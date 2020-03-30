class FundraiseOffer < ApplicationRecord
  validates :organization_name,
            :segment,
            :offer_type,
            :pitch_deck,
            :fundraise_target, presence: true
end
