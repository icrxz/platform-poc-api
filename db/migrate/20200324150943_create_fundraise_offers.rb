class CreateFundraiseOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :fundraise_offers do |t|
      t.string :organization_name
      t.string :organization_logo
      t.string :organization_thumbnail
      t.string :segment
      t.string :offer_type
      t.decimal :fundraise_target
      t.text :pitch_deck

      t.timestamps
    end
  end
end
