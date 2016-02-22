class ArtistsController < ApplicationController
  before_action :find_artist, only: [:show, :edit, :update, :destroy]

  def index
    @artist = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
   @artist = Artist.new(artist_params)
   if @artist.save
     redirect_to @artist
   else
     render :new
   end
  end

  def show
    @artist
  end

  def edit
    @artist
  end

  def update
    if @artist.update(artist_params)
    redirect_to @artist
    else
      render :edit
    end
  end

  def destroy
   @artist.destroy
   redirect_to artists_path
  end


  private
  def find_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :image_path)
  end
end
