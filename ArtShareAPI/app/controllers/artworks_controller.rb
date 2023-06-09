class ArtworksController < ApplicationController

    def index
        if params.has_key?(:user_id)
            artworks = Artwork.where(artist_id: params[:user_id])
            artwork_shares = ArtworkShare.where(viewer_id: params[:user_id])
            all = artworks + artwork_shares
            render json: all
        end
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
          params.require(:artwork).permit(:title, :artist_id, :image_url)
      end
  
end