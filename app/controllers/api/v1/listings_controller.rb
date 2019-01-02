class Api::V1::ListingsController < ApplicationController

  skip_before_action :authorized, only: %i[create index]

  def index
    @listings = Listing.all
    render json: @listings
  end

  def create
    @listing = Listing.create(user_params)
    if @listing.valid?
      @token = encode_token(user_id: @listing.id)
      render json: { listing: UserSerializer.new(@listing) }, status: :created
    else
      render json: { error: 'failed to create listing' }, status: :not_acceptable
    end
  end

  private
  def user_params

    params.require(:listing).permit(:user_id, :item, :condition, :location, :picture, :coordinates, :tags)

  end

end
