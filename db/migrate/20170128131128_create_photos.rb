class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.references :artist, foreign_key: true
      t.string :picture

      t.timestamps
    end
  end
end
