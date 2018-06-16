class CreateOctoEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :octo_events do |t|
      t.string :action, :null => false
      t.integer :number, :null => false

      t.timestamps
    end
  end
end
