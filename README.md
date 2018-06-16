# Octo Events API v1.0

Octo Events é uma aplicação que recebe e armazena eventos do Github, por intermédio de webhooks, e disponibiliza uma API para consulta posterior destes eventos.  

## Environment

Ruby 2.5.1  
Rails 5.2.0  
Base de Dados PostgreSQL

## Instalação

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
