class Api::V1::FundraiseOffersController < ApplicationController
  before_action :set_fundraise_offer, only: %i[destroy show]

  def index
    @fundraise_offers = FundraiseOffer.all

    return unless stale?(last_modified: @fundraise_offers.maximum(:updated_at))

    render json: Api::V1::FundraiseOfferSerializer.new(@fundraise_offers)
                                                  .serialized_json
  end

  def create
    @fundraise_offer = FundraiseOffer.new(fundraise_offer_params)
    if @fundraise_offer.save
      head :ok
    else
      render json: { errors: @fundraise_offer.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def show
    return unless stale?(etag: @fundraise_offer)

    render json: Api::V1::FundraiseOfferSerializer.new(@fundraise_offer)
                                                  .serialized_json
  end

  def destroy
    @fundraise_offer.destroy
    head :ok
  end

  private

  def set_fundraise_offer
    @fundraise_offer = FundraiseOffer.find(params[:id])
  end

  def fundraise_offer_params
    params.require(:fundraise_offer).permit(:organization_name,
                                            :segment,
                                            :offer_type,
                                            :pitch_deck,
                                            :fundraise_target)
  end
end
