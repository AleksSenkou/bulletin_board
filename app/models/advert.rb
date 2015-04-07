class Advert < ActiveRecord::Base
  TYPES_LIST = %[sale buy exchange favor rent]

  validates_presence_of :name, :description, :price, :type
  validates :name, length: { maximum: 40 }
  validates :description, length: { maximum: 4000 }
  validates :price, numericality: { greater_then_or_equal_to: 0,
                                    less_then: 1_000_001 }
  validates :type, allow_blank: true, inclusion: { in: TYPES_LIST }
  belongs_to :user
end
