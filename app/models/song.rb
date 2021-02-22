class Song < ActiveRecord::Base
  belongs_to :artist

  def artist_name
    artist.name
  end

  def display_title_and_artist
    "#{artist_name} - #{title}"
  end
end
