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