require( 'minitest/autorun' )
require_relative( '../models/bb' )

class TestBB< MiniTest::Test

  def setup
      options = {
        'first_name' => 'Tony', 
        'last_name' => 'Goncalves', 
        'bedroom_type' => 'Double',
        'breakfast' => 'yes',
        'length_of_stay' =>'3'
      }
      @bb = BB.new( options )
    end

  def test_first_name()
    assert_equal('Tony', @bb.first_name() )
  end

  def test_length_of_stay()
    assert_equal(3, @bb.length_of_stay)
  end
end