class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  
  with_options presence: true do
    validates :nickname
    validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ヶー-龥々ー]+\z/, message: "Full-width characters" }
    validates :last_name_kana,:first_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: "Full-width katakana characters" }
    validates :birthday
  end
  PASSWORD_REGEX = /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/
  validates :password, format: { with: PASSWORD_REGEX, message: "Include both letters and numbers" }

end
