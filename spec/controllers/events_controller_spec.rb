require 'rails_helper'

RSpec.describe EventsController, type: :controller do

  describe 'Fetch Events Api Calls' do

    it "should have an http error status without proper issue number" do
      get :get_events_by_issue, params: { :issue_number => '2' } 
      expect(response).to have_http_status(400)
    end
  
    it "should have an http success status with proper issue number" do
      get :get_events_by_issue, params: { :issue_number => '1' } 
      expect(response).to have_http_status(200)
    end
  
    it "should return error with invalid issue number" do
      get :get_events_by_issue, params: { :issue_number => '2' } 
  
      errorResponse = { :error  => "Issue not found or invalid issue number informed" }.to_json
      expect(response.body).to eq(errorResponse)
    end

    it 'should return a list of events by issue number' do
      get :get_events_by_issue, params: { :issue_number => '1' } 
  
      response_body = JSON.parse(response.body)
      expect(response_body.length).to eq(1)
    end

  end

  describe 'Controller Methods' do

    before(:each) do
      @EventsController = EventsController.new
    end
  
    it "should allow numeric issue numbers params" do
      validParams = @EventsController.send(:check_is_numeric, '1')
      validParams2 = @EventsController.send(:check_is_numeric, '1001')
      expect(validParams).to eq(true)
      expect(validParams2).to eq(true)
    end
  
    it "should not allow issue numbers params that are not numeric" do
      invalidParam1 = @EventsController.send(:check_is_numeric, 'd')
      invalidParam2 = @EventsController.send(:check_is_numeric, '...DROP TABLE... ')
      invalidParam3 = @EventsController.send(:check_is_numeric, 'OR 1=1')
      expect(invalidParam1).to eq(false)
      expect(invalidParam2).to eq(false)
      expect(invalidParam3).to eq(false)
    end

  end

end
