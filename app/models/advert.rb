class Advert < ActiveRecord::Base
  belongs_to :user
  has_many :pictures, dependent: :destroy

  acts_as_votable

  default_scope -> { order('created_at DESC') }
  self.inheritance_column = nil

  TYPES = %w[Sale Buy Exchange Favor Rent]

  validates_presence_of :name, :description, :price, :type, :user_id
  validates :name, length: { maximum: 40 }
  validates :description, length: { maximum: 4000 }
  validates :price, numericality: { greater_than_or_equal_to: 0,
                                    less_than: 1_000_001 }
  validates :type, allow_blank: true, inclusion: { in: TYPES }

  # accepts_nested_attributes_for :pictures
end
