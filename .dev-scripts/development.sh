bundle install
rails db:drop:_unsafe
rails db:create
rails db:migrate
rails db:seed