class Picture < ActiveRecord::Base
  belongs_to :advert

  has_attached_file :image,
    # styles: { normal: "100x100>", small: "50x50>" },
    path: ":rails_root/public/images/:id/:filename",
    url: "/images/:id/:filename"

  do_not_validate_attachment_file_type :image
  # validates_attachment :image, size: { in: 0..2.megabytes }
end
