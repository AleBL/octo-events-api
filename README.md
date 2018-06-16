# Octo Events API v1.0

Octo Events é uma aplicação que recebe e armazena eventos do Github, por intermédio de webhooks, e disponibiliza uma API para consulta posterior destes eventos.  

## Environment

Ruby 2.5.1  
Rails 5.2.0  
Base de Dados PostgreSQL

## Instalação e Configuração

### Instalando as Gems:  

```
bundle install
```

### Criando a Base de Dados

Configurar em `config/database.yml` usuário e senha local da base de dados.

```
rails db:create
```
```
rails db:migrate
```

### Criando o Webhook

1) No repositório do Github, ir em _Settings > Webhooks_  
2) Selecionar _Add webhook_  
3) Em _Payload URL_ incluir a URL da API para o Endpoint de Payload. No caso: _{base_url}/events_  
4) Definir _Content-Type_ como _application/json_  
5) Selectionar _Let me select individual events_ e Escolher _Issues_ & _Issue comments_  
6) Marcar Active no checkbox  
7) Clicar em _Add Webhook_  

Obs: Para testar o funcionamento do webhook em ambiente de desenvolvimento local, foi utilizado o _ngrok_ (https://ngrok.com/).  
Para tal, basta instalar o ngrok seguindo as instruções de acordo com o ambiente de desenvolvimento e:  
1) Colocar para rodar na porta sendo utilizada pelo projeto (neste projeto, a porta 3000): `ngrok http 3000`
2) Obter a URL disponibilizada pelo _ngrok_ e utilizá-la como _Payload URL_ na configuração do Passo 3.

## Rodando o Projeto

```
rails server
```

## Testes

Testes com RSpec

### Criando Base de Testes

```
rails db:create RAILS_ENV=test
```
```
rails db:migrate RAILS_ENV=test
```

### Rodando Testes

```
bundle exec rspec
```

## Documentação

| HTTP | Rota | Descrição |
| ----------- | ---- | --------- |
| **POST** | /events | Webhook que recebe eventos do Github e os armazena na Base de Dados |
| **GET** | /issues/{issue_number}/events | Listagem de eventos filtrados pelo número do issue |

### Postman Collection

Postman_Collection.json na raíz do projeto.  
Link de Importação do Postman: https://www.getpostman.com/collections/4d7b94b5238193adbcf7
