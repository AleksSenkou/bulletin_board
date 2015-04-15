require "faker"
require "populator"

USERS_COUNT = 10
IDENTITES_COUNT = 1
USERS_WITH_ADVERTS = 2
ADVETRS_COUNT = 5
PICTURES_COUNT = 3

namespace :db do
  desc 'Fill database with sample data'
  task populate: :environment do
    clean_database
    make_users
    make_adverts
    make_pictures_for_adverts
  end
end

def clean_database
  [User, Identity, Advert, Picture].each(&:delete_all)
end

def make_users
  User.create(name: 'alex',
              email: 'aleksey.senkou@gmail.com',
              password: 'zxczxczxc',
              password_confirmation: 'zxczxczxc',
              admin: true)

  USERS_COUNT.times {
    name                 = Faker::Name.name
    email                = Faker::Internet.free_email
    password             = Faker::Internet.password(8)
    signup_with_provider = (1 == rand(2) ? true : false)

    user = User.create(name: name, email: email, password: password,
                       password_confirmation: password,
                       signup_with_provider: signup_with_provider)

    if user.signup_with_provider
      Identity.populate IDENTITES_COUNT do |identity|
        identity.user_id  = user.id
        identity.provider = ['twitter', 'facebook']
        identity.uid      = Faker::Number.number(10)
      end
    end
  }
end

def make_adverts
  User.first(USERS_WITH_ADVERTS).each do |user|
    Advert.populate ADVETRS_COUNT do |ad|
      ad.user_id     = user.id
      ad.name        = Faker::Lorem.word
      ad.description = Faker::Lorem.sentence(16)
      ad.price       = Faker::Commerce.price
      ad.type        = %w[Sale Buy Rent Favor Exchange]
    end
  end
end

def make_pictures_for_adverts
  Advert.all.each do |ad|
    PICTURES_COUNT.times {
      image     = Faker::Avatar.image
      Picture.create(advert_id: ad.id, image: image)
    }
  end
end
