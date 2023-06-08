# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string
#  image_url  :string           not null
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
  validates :title, :artist_id, :image_url, presence: true

  validates :title, uniqueness: { scope: :artist_id}

  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User

  has_many :artwork_shares,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare,
    dependent: :destroy,
    inverse_of: :artwork

  has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer,
    dependent: :destroy

  has_many :comments,
    foreign_key: :artwork_id,
    primary_key: :id,
    class_name: :Comment,
    dependent: :destroy
end
