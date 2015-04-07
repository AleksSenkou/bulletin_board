require "faker"
require "populator"

namespace :db do
  desc 'Fill database with sample data'
  task populate: :environment do
    clean_database
    make_users
  end
end

def clean_database
  [User, Identity, Advert].each(&:delete_all)
end

def make_users
  User.create(name: 'alex',
              email: 'aleksey.senkou@gmail.com',
              password: 'asdasdasd',
              password_confirmation: 'asdasdasd')

  9.times do |n|
    name     = Faker::Name.name
    email    = Faker::Internet.free_email
    password = Faker::Internet.password(8)
    signup_with_provider = (1 == rand(2) ? true : false)

    user = User.create(name: name, email: email, password: password,
                       password_confirmation: password,
                       signup_with_provider: signup_with_provider)

    if user.signup_with_provider
      Identity.populate 1 do |identity|
        identity.user_id  = user.id
        identity.provider = ['twitter', 'facebook']
        identity.uid      = Faker::Number.number(10)
      end
    end
  end
end
