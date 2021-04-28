class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.string :offer_name
      t.string :location
      t.string :phone
      t.text :description

      t.timestamps
    end
  end
end
