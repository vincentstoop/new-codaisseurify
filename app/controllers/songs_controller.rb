class SongsController < ApplicationController

  # def create
  #   @song = Song.new(song_params)
  #   @song.artist_id = params[:artist_id]
  #   @artist = Artist.find(@song.artist_id)
  #
  #   if @song.save
  #     redirect_to @song.artist, notice: "Song added."
  #   else
  #     render 'artists/show', id: @artist.id
  #   end
  # end

  def create
    @song = Song.new(song_params)
    @song.artist_id = params[:artist_id]
    if @song.save
      render status: 201, json: {
        message: 'Song added',
        song: @song
      }.to_json
    else
      render status: 422, json: {
        errors: @song.errors
      }.to_json
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    render status: 200, json: {
      message: 'Song deleted',
    }.to_json
    # redirect_to artist_path(params[:artist_id]), notice: "Song deleted"
  end

  # def destroy
  #   room = Room.find(params[:id])
  #   room.destroy
  #
  #   render status: 200, json: {
  #     message: "Room successfully deleted"
  #   }.to_json
  # end

  private
  def song_params
    params.require(:song).permit(:title, :year)
  end
end
