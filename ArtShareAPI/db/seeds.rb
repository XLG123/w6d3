# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

artist_1 = User.create!(username: "Bob")
artist_2 = User.create!(username: "AHHHHH")
artist_3 = User.create!(username: "Bicasso")

artwork_1 = Artwork.create!(title: "Ruby 1", image_url: "www.ruby1.com", artist_id: artist_1.id)
artwork_2 = Artwork.create!(title: "Ruby 2", image_url: "www.ruby2.com", artist_id: artist_2.id)
artwork_3 = Artwork.create!(title: "Ruby 3", image_url: "www.ruby3.com", artist_id: artist_3.id)

shared_1 = ArtworkShare.create!(artwork_id: artwork_1.id, viewer_id: artist_1.id)
shared_2 = ArtworkShare.create!(artwork_id: artwork_2.id, viewer_id: artist_2.id)
shared_3 = ArtworkShare.create!(artwork_id: artwork_3.id, viewer_id: artist_3.id)