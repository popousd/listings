class ListingsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    #@listings = Listing.search(params)
    @listings = Listing.all
    # respond_to do |format|
    #   format.html
    #   format.json { render :xml => @listings.to_xml }
    # end
  end

  def new
    @listing = Listing.new
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def create
    @listing = Listing.new(listing_params)

    if @listing.save
      redirect_to listings_path
    else
      render template: '/listings/new'
    end
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
    params.require(:listing)
      .permit(
        :title,
        :description,
        :picture,
        :price,
        :category_id
      ).merge(user_id: current_user.id)
  end
end
