class SongsController < ApplicationController
  def index; end

  def show
    set_song
  end

  def new
    @song = Song.new
  end

  def create
    set_song
    @song.artist = Artist.find_or_create_by(artist_params)

    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    set_song

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = 'Song deleted.'
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title)
  end

  def set_song
    @song = Song.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name)
  end
end
