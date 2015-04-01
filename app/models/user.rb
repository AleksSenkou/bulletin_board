class User < ActiveRecord::Base
  validates :name, presence: true

  devise :database_authenticatable, :registerable, :rememberable,
         :trackable, :validatable #, omniauthable #, :recoverable
end
