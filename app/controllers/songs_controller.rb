class SongsController < ApplicationController
  def create
    @song = Song.new(song_params)
    @song.artist_id = params[:artist_id]

    if @song.save
      redirect_to @song.artist, notice: "Song added."
    else
      redirect_to @song.artist, notice: "Song could not be added. Try again."
    end
  end

  def destroy
    @song = Song.find(params[:id])

    @song.destroy

    redirect_to artist_path(params[:artist_id]), notice: "Song deleted"
  end

  private
  def song_params
    params.require(:song).permit(:title, :year)
  end
end
