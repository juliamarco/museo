require './lib/curator'
require './lib/photograph'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'

class CuratorTest < MiniTest::Test

  def test_it_exists

    curator = Curator.new
    assert_instance_of Curator, curator
  end

  def test_it_starts_with_no_artists

    curator = Curator.new
    assert_equal [], curator.artists
  end

  def test_it_starts_with_no_photographs

    curator = Curator.new
    assert_equal [], curator.photographs
  end

  def test_it_can_add_photographs

    photo_1 = {
                id: "1",
                name: "Rue Mouffetard, Paris (Boy with Bottles)",
                artist_id: "1",
                year: "1954"
              }

    photo_2 = {
                id: "2",
                name: "Moonrise, Hernandez",
                artist_id: "2",
                year: "1941"
              }

    curator = Curator.new
    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)

    assert_instance_of Photograph, curator.photographs.first
    assert_equal "Rue Mouffetard, Paris (Boy with Bottles)", curator.photographs.first.name
  end

  def test_it_can_add_artists

    artist_1 = {
                  id: "1",
                  name: "Henri Cartier-Bresson",
                  born: "1908",
                  died: "2004",
                  country: "France"
                }

    artist_2 = {
                  id: "2",
                  name: "Ansel Adams",
                  born: "1902",
                  died: "1984",
                  country: "United States"
                }

    curator = Curator.new
    curator.add_artist(artist_1)
    curator.add_artist(artist_2)

    assert_instance_of Artist, curator.artists.first
    assert_equal "Henri Cartier-Bresson", curator.artists.first.name

  end

  def test_it_can_find_artists_by_id

    artist_1 = {
                  id: "1",
                  name: "Henri Cartier-Bresson",
                  born: "1908",
                  died: "2004",
                  country: "France"
                }

    artist_2 = {
                  id: "2",
                  name: "Ansel Adams",
                  born: "1902",
                  died: "1984",
                  country: "United States"
                }

    curator = Curator.new
    curator.add_artist(artist_1)
    curator.add_artist(artist_2)

    assert_equal curator.artists.first, curator.find_artist_by_id("1")
  end

  def test_it_can_find_photographs_by_id

    photo_1 = {
                id: "1",
                name: "Rue Mouffetard, Paris (Boy with Bottles)",
                artist_id: "1",
                year: "1954"
              }

    photo_2 = {
                id: "2",
                name: "Moonrise, Hernandez",
                artist_id: "2",
                year: "1941"
              }

    curator = Curator.new
    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)

    assert_equal curator.photographs[1], curator.find_photograph_by_id("2")
  end

  def test_it_can_find_artists_by_id

    artist_3 = {
                  id: "3",
                  name: "Diane Arbus",
                  born: "1923",
                  died: "1971",
                  country: "United States"
                }

    curator = Curator.new
    curator.add_artist(artist_3)

    assert_equal curator.artists.first, curator.find_artist_by_id("3")
  end


  def test_it_can_find_photographs_by_artist

    photo_1 = {
                  id: "1",
                  name: "Rue Mouffetard, Paris (Boy with Bottles)",
                  artist_id: "1",
                  year: "1954"
                }

    photo_2 = {
                  id: "2",
                  name: "Moonrise, Hernandez",
                  artist_id: "2",
                  year: "1941"
                }

    photo_3 = {
                  id: "3",
                  name: "Identical Twins, Roselle, New Jersey",
                  artist_id: "3",
                  year: "1967"
                }

    photo_4 = {
                  id: "4",
                  name: "Child with Toy Hand Grenade in Central Park",
                  artist_id: "3",
                  year: "1962"
                }

    artist_1 = {
                  id: "1",
                  name: "Henri Cartier-Bresson",
                  born: "1908",
                  died: "2004",
                  country: "France"
                }

    artist_2 = {
                  id: "2",
                  name: "Ansel Adams",
                  born: "1902",
                  died: "1984",
                  country: "United States"
                }

    artist_3 = {
                  id: "3",
                  name: "Diane Arbus",
                  born: "1923",
                  died: "1971",
                  country: "United States"
                }

    curator = Curator.new
    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    curator.add_photograph(photo_3)
    curator.add_photograph(photo_4)
    curator.add_artist(artist_1)
    curator.add_artist(artist_2)
    curator.add_artist(artist_3)
    diane_arbus = curator.find_artist_by_id("3")

    assert_equal curator.photographs[2..3], curator.find_photographs_by_artist(diane_arbus)
  end

  def test_it_has_artists_with_multiple_photographs

    photo_1 = {
                  id: "1",
                  name: "Rue Mouffetard, Paris (Boy with Bottles)",
                  artist_id: "1",
                  year: "1954"
                }

    photo_2 = {
                  id: "2",
                  name: "Moonrise, Hernandez",
                  artist_id: "2",
                  year: "1941"
                }

    photo_3 = {
                  id: "3",
                  name: "Identical Twins, Roselle, New Jersey",
                  artist_id: "3",
                  year: "1967"
                }

    photo_4 = {
                  id: "4",
                  name: "Child with Toy Hand Grenade in Central Park",
                  artist_id: "3",
                  year: "1962"
                }

    artist_1 = {
                  id: "1",
                  name: "Henri Cartier-Bresson",
                  born: "1908",
                  died: "2004",
                  country: "France"
                }

    artist_2 = {
                  id: "2",
                  name: "Ansel Adams",
                  born: "1902",
                  died: "1984",
                  country: "United States"
                }

    artist_3 = {
                  id: "3",
                  name: "Diane Arbus",
                  born: "1923",
                  died: "1971",
                  country: "United States"
                }

    curator = Curator.new
    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    curator.add_photograph(photo_3)
    curator.add_photograph(photo_4)
    curator.add_artist(artist_1)
    curator.add_artist(artist_2)
    curator.add_artist(artist_3)
    diane_arbus = curator.find_artist_by_id("3")

    assert_equal [diane_arbus], curator.artists_with_multiple_photographs
  end

  def test_it_gets_photographs_by_artist_country

    photo_1 = {
                  id: "1",
                  name: "Rue Mouffetard, Paris (Boy with Bottles)",
                  artist_id: "1",
                  year: "1954"
                }

    photo_2 = {
                  id: "2",
                  name: "Moonrise, Hernandez",
                  artist_id: "2",
                  year: "1941"
                }

    photo_3 = {
                  id: "3",
                  name: "Identical Twins, Roselle, New Jersey",
                  artist_id: "3",
                  year: "1967"
                }

    photo_4 = {
                  id: "4",
                  name: "Child with Toy Hand Grenade in Central Park",
                  artist_id: "3",
                  year: "1962"
                }

    artist_1 = {
                  id: "1",
                  name: "Henri Cartier-Bresson",
                  born: "1908",
                  died: "2004",
                  country: "France"
                }

    artist_2 = {
                  id: "2",
                  name: "Ansel Adams",
                  born: "1902",
                  died: "1984",
                  country: "United States"
                }

    artist_3 = {
                  id: "3",
                  name: "Diane Arbus",
                  born: "1923",
                  died: "1971",
                  country: "United States"
                }

    curator = Curator.new
    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    curator.add_photograph(photo_3)
    curator.add_photograph(photo_4)
    curator.add_artist(artist_1)
    curator.add_artist(artist_2)
    curator.add_artist(artist_3)

    assert_equal curator.photographs[1..3], curator.photographs_taken_by_artist_from("United States")
    assert_equal [], curator.photographs_taken_by_artist_from("Argentina")
  end

  def test_it_can_load_photographs
    curator = Curator.new
    assert_equal curator.photographs, curator.load_photographs("./data/photographs.csv")
  end

  def test_it_can_load_artists
    curator = Curator.new
    assert_equal curator.artists, curator.load_artists("./data/artists.csv")
  end

end
