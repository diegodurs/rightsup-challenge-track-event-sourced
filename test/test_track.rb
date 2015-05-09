require 'minitest/autorun'
require 'track'

module TestTrack
  class TestCreate < Minitest::Test
    def setup
      @track = Track.create(title: 'Uptown Funk')
    end

    def test_uuid
      assert @track.uuid
    end

    def test_title
      assert_equal 'Uptown Funk', @track.title
    end

    def test_rebuild
      track_rebuilded = Track.replay(Track.stream(@track.uuid))
      assert_equal @track, track_rebuilded
    end
  end

  # add more test

  # TOTEST
  # @track.add_main_artist(name: 'Mark Ronson')
  # @track.add_featured_artist(name: 'Bruno Mars')
end