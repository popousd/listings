require 'test_helper'

describe Listing do

  it "search by keywords" do
    listings = Listing.search(keywords: 'iphone')

    assert_equal 1, listings.length
    assert_equal 'iphone title', listings.first.title
  end
end
