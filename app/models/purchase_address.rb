class PurchaseAddress
  include ActiveModl::Model
  attr_accessor :user_id, :item_id, :postcode, :region_id, :city, :block, :building, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :region_id, numericality: { other_than: 0 }
    validates :city
    validates :block
    validates :phone_number, numericality: { only_integer: true }, length: { maximum: 11 }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(
      postcode: postcode, region_id: region_id, city: city, block: block, building: building, phone_number: phone_number, purchase_id: purchase.id
    )
  end
end
