# Jungle

A mini e-commerce application built with Rails 6.1 that allows users to shop plants. 

## Final Product

Homepage
!["homepage"](https://github.com/Winnie0313/jungle-rails/blob/master/docs/homepage.png?raw=true)

Product Detail Page
!["product-detail-page"](https://github.com/Winnie0313/jungle-rails/blob/master/docs/product-detail-page.png?raw=true)

My Cart Page
!["my-cart-page.png"](https://github.com/Winnie0313/jungle-rails/blob/master/docs/my-cart-page.png?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
