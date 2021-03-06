class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :region_id, :city, :block, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフンを含めた半角数字で入力してください' }
    validates :region_id, numericality: { other_than: 0, message: 'を選択してください' }
    validates :city
    validates :block
    VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/.freeze
    validates :phone_number, format: { with: VALID_PHONE_REGEX, message: 'は半角数字のみで入力してください' }
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(
      postcode: postcode, region_id: region_id, city: city, block: block, building: building, phone_number: phone_number, purchase_id: purchase.id
    )
  end
end
