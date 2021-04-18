class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,               null: false, limit: 40
      t.text       :description,        null: false, limit: 1000
      t.string     :category_id,        null: false
      t.string     :status_id,          null: false
      t.string     :delivery_charge_id, null: false
      t.string     :region_id,          null: false
      t.string     :delivery_days_id,   null: false
      t.integer    :price,              null: false
      t.references :user,               null: false, foreign_key: true
      t.timestamps
    end
  end
end
