class Api::V1::FundraiseOfferSerializer
  include FastJsonapi::ObjectSerializer
  attributes :organization_name,
             :segment,
             :offer_type,
             :pitch_deck,
             :fundraise_target

  attribute :organization_logo_url do |object|
    AWS_BUCKET.object("logos/#{object.organization_logo}")
              .presigned_url(:get)
  end

  attribute :organization_thumbnail_url do |object|
    AWS_BUCKET.object("thumbnails/#{object.organization_thumbnail}")
              .presigned_url(:get)
  end
end
