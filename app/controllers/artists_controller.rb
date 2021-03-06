class ArtistsController < ApplicationController

  def index
    @artists = Artist.all.order(sort_how)
  end

  def show
    @artist = Artist.find(params[:id])
    @photos = @artist.photos.all
    @songs = @artist.songs.all
    @song = @artist.songs.new
    # render status: 200, json: @artist.as_json(include: [:songs, :photos])
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist_name = @artist.name
    @artist.destroy
    redirect_to root_path, notice: "Artist #{@artist_name} deleted."
  end

  def delete_all_songs
    @artist = Artist.find(params[:id])
    @artist.songs.each do |song|
      song.destroy
    end
    # redirect_to artist_path, notice: "All songs by #{@artist.name} deleted."
    render status: 200, json: {
      message: "All songs by #{@artist.name} deleted.",
    }.to_json
  end

  def sort_how
    params[:sort] = params[:sort] || "name asc"
    @next_sort_created_at = "created_at asc"
    case params[:sort]
    when "name asc"
      @next_sort_name = "name desc"
    when "name desc"
      @next_sort_name = "name asc"
    when "created_at asc"
      @next_sort_created_at = "created_at desc"
    when "created_at desc"
      @next_sort_created_at = "created_at asc"
    end
    params[:sort]
  end

end
