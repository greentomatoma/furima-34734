class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string     :postcode,     null: false
      t.integer    :region_id,    null: false
      t.string     :city,         null: false
      t.string     :block,        null: false
      t.string     :building,     null: false
      t.string     :phone_number, null: false
      t.references :purchase,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
