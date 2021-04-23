class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :region
  belongs_to :delivery_days

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name,               length: { maximum: 40 }
    validates :description,        length: { maximum: 1000 }
    validates :category_id,        numericality: { other_than: 0 }
    validates :status_id,          numericality: { other_than: 0 }
    validates :delivery_charge_id, numericality: { other_than: 0 }
    validates :region_id,          numericality: { other_than: 0 }
    validates :delivery_days_id,   numericality: { other_than: 0 }
    validates :price, format: { with: /\A[0-9]+\z/ },
                      numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :image
  end
end
