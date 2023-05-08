# Basic-auth

##### Netflix Replica:
Requiments:

###### Model:
* user(email, full_name, role, password_digest)
* movie(title, description, type, release_date, rating, user_id)
* payment(amount, status, user_id)
* notification(detail, status, user_id)

```
rails g model user email full_name role password_digest
rails g model movie title description type release_date:date rating user:references
rails g model payment amount:float status user:references
rails g model notification detail status user:references
```

```
rails g model user email full_name role password_digest --force && rails g model movie title description type release_date:date rating user:references --force && rails g model payment amount:float status user:references --force && rails g model notification detail status user:references --force && rails db:drop db:create db:migrate && git add . && git commit -m "Added Models" && git push origin api-branch
```

User:
* has_many :payments
* has_many :notifications
* movies

notification, payment, movie:
* belongs_to :user

Controllers:
```
rails g controller api/v1/users index && rails g controller api/v1/movies index && rails g controller api/v1/notifications index && rails g controller api/v1/payments index
```

```
rails db:drop db:create db:migrate && rails s -p 3001
```

Creating Mailer:

* Configuring production & development environments:
config/environments/development.rb:
```
config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_url_options = { :host => "localhost:3000", protocol: "http" }

  my_user_name = Rails.application.credentials[:development][:my_user_name]
  my_password = Rails.application.credentials[:development][:my_password]

  config.action_mailer.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :user_name            => my_user_name,
    :password             => my_password,
    :authentication       => "plain",
    :enable_starttls_auto => true
  }
```
config/environments/production.rb:
```
config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_url_options = { :host => "simplecash.herokuapp.com", protocol: "http" }

  my_user_name = Rails.application.credentials[:production][:my_user_name]
  my_password = Rails.application.credentials[:production][:my_password]

  config.action_mailer.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :user_name            => my_user_name,
    :password             => my_password,
    :authentication       => "plain",
    :enable_starttls_auto => true
  }
```
Go to credentials:
```
EDITOR="subl --wait" rails credentials:edit
```
Link to configure email:

* Set Up 2-factor Authentication:
```
https://support.google.com/accounts/answer/185839
```
* Create & use app passwords:
```
https://support.google.com/accounts/answer/185833
```

Validations:
```
movie_link
title
movie_type
release_date
```