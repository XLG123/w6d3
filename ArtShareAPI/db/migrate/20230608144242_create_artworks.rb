class CreateArtworks < ActiveRecord::Migration[7.0]
  def change
    create_table :artworks do |t|
      t.string :title
      t.string :image_url, null: false
      t.references :artist, null: false, foreign_key: {to_table: :users}
      t.index [:title, :artist_id], unique: true
      t.timestamps
    end
    add_index :artworks, :image_url, unique: true
  end
end
