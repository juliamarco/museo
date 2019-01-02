require './lib/photograph'
require './lib/artist'

class Curator

  attr_reader :artists,
              :photographs

  def initialize
    @artists = []
    @photographs = []
  end

  def add_photograph(attributes)
    photographs << Photograph.new(attributes)
  end

  def add_artist(attributes)
    artists << Artist.new(attributes)
  end

  def find_artist_by_id(id)
    @artists.find do |artist|
      artist.id == id
    end
  end

  def find_photograph_by_id(id)
    @photographs.find do |photo|
      photo.id == id
    end
  end

  def find_photographs_by_artist(artist)
    @photographs.find_all do |photo|
      photo.artist_id == artist.id
    end
  end

  def artists_with_multiple_photographs
    group = @photographs.group_by do |photo|
      photo.artist_id
    end
    artists_id = []
    group.each do |k,v|
      if v.count > 1
        artists_id << v.first.artist_id
      end
    end
    artists_id.map do |artist_id|
      find_artist_by_id(artist_id)
    end
  end

  def photographs_taken_by_artist_from(country)
    artists = @artists.find_all do |artist|
      artist.country == country
    end
    ids = artists.map do |artist|
      artist.id
    end
    @photographs.find_all do |photo|
      ids.include?(photo.artist_id)
    end
  end





end
