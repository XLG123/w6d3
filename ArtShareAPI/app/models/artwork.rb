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

end
