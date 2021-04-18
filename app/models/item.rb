class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description, length: { maximum: 1000 }
    validates :category_id
    validates :status_id
    validates :delivery_charge_id
    validates :region_id
    validates :delivery_days_id
    validates :price, format: { with: /\A[0-9]+\z/ }, 
                numericality: { :greater_than_or_equal_to: 300, less_than_or_equal_to: 9*7}
  end
end
