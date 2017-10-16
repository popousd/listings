class ListingsController < ApplicationController

  def index
    @listings = Listing.search(params)

    # respond_to do |format|
    #   format.html
    #   format.json { render :xml => @listings.to_xml }
    # end
  end

  def new
  end

  def show
  end

  def create
  end

  def contact
    Contact.generate(
      user_id: current_user.id,
      listing_id: params[:listing_id],
      message: params[:message]
    )
  end

private
  def listing_params
  end
end
