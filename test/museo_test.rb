require './lib/photograph'
require './lib/artist'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'

class MuseoTest < MiniTest::Test

  def test_it_creates_photograph_instances

    attributes = {
                id: "1",
                name: "Rue Mouffetard, Paris (Boy with Bottles)",
                artist_id: 4,
                year: 1954
              }

    photograph = Photograph.new(attributes)
    assert_instance_of Photograph, photograph
  end

  def test_photographs_has_attributes

    attributes = {
                id: "1",
                name: "Rue Mouffetard, Paris (Boy with Bottles)",
                artist_id: 4,
                year: 1954
              }

    photograph = Photograph.new(attributes)
    assert_equal "1", photograph.id
    assert_equal "Rue Mouffetard, Paris (Boy with Bottles)", photograph.name
    assert_equal 4, photograph.artist_id
    assert_equal 1954, photograph.year
  end

  def test_it_creates_artist_instances

    attributes = {
                   id: "2",
                   name: "Ansel Adams",
                   born: "1902",
                   died: "1984",
                   country: "United States"
                  }

    artist = Artist.new(attributes)
    assert_instance_of Artist, artist
  end

  def test_artists_have_attributes

    attributes = {
                   id: "2",
                   name: "Ansel Adams",
                   born: "1902",
                   died: "1984",
                   country: "United States"
                  }

    artist = Artist.new(attributes)
    assert_equal "2", artist.id
    assert_equal "Ansel Adams", artist.name
    assert_equal "1902", artist.born
    assert_equal "1984", artist.died
    assert_equal "United States", artist.country
  end

end
