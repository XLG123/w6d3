# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :artworks,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :Artwork,
    dependent: :destroy,
    inverse_of: :artist
  
  has_many :artwork_shares,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :ArtworkShare,
    dependent: :destroy,
    inverse_of: :viewer
  
  has_many :shared_artworks,
    through: :artwork_shares,
    source: :artwork,
    dependent: :destroy

  has_many :comments,
    foreign_key: :author_id,
    primary_key: :id,
    class_name: :Comment,
    dependent: :destroy
end
