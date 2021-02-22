class Artist < ActiveRecord::Base
  has_many :songs

  def song_count
    songs.length
  end
end
