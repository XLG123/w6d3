class ArtworksController < ApplicationController

    def index
        artworks = Artwork.all
        render json: artworks
    end
  
      def show
          artwork = Artwork.find(params[:id])
          render json: artwork
      end
  
      def create
        artwork = Artwork.new(artwork_params)
        if artwork.save
          render json: artwork
        else
          render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
      end
  
      def update
          artwork = Artwork.find(params[:id])
  
          if artwork.update(artwork_params)
              redirect_to artworks_url(artwork)
          else
              render json: artwork.errors.full_messages, status: :unprocessable_entity
          end
      end
  
      def destroy
          artwork = Artwork.find(params[:id])
          artwork.destroy
          redirect_to artworks_url
      end
  
      private
  
      def artwork_params
        # debugger
          params.require(:artwork).permit(:title, :artist_id, :image_url)
      end
  
end