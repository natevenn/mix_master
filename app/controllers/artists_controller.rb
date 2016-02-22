class ArtistsController < ApplicationController
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
    find_artist(params[:id])
  end

  def edit
    find_artist(params[:id])
  end

  def update
    artist = find_artist(params[:id])
    artist.update(artist_params)
    redirect_to artist
  end

  def destroy
   artist = find_artist(params[:id])
   artist.destroy
   redirect_to artists_path
  end

  def find_artist(id)
    @artist = Artist.find(id)
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :image_path)
  end
end
