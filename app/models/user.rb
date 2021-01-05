class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :nickname
    validates :email
    validates :password, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/}
    with_options format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "Full-width characters"} do
      validates :last_name
      validates :first_name
    end
    with_options format: {with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}do
      validates :last_name_kana
      validates :first_name_kana
    end
    validates :birth_date
  end

  has_many :items
end
