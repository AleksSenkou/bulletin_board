class Picture < ActiveRecord::Base
  belongs_to :advert

  has_attached_file :image,
    path: ":rails_root/public/images/:id/:filename",
    url: "/images/:id/:filename"

  do_not_validate_attachment_file_type :image

#  validates_size_of :image, maximum: 500.kilobytes, message: "should be no more than 500 KB"#, if: :image_changed?

#  validates_property :format, of: :image, in: [:jpeg, :jpg, :png, :bmp], case_sensitive: false, message: "should be either .jpeg, .jpg, .png, .bmp"#, if: :image_changed?
end
