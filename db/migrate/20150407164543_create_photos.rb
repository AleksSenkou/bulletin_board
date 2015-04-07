class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.attachment :data
      t.integer :advert_id
      t.integer :advert_type
      t.timestamps null: false
    end
  end
end
