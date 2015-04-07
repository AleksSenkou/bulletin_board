class Photo < ActiveRecord::Base
  belongs_to :advert

  has_attached_file :data, styles: { mini: "100x100>", normal: "200x200>" }
  attr_accessible :data, :data_file_name
end
