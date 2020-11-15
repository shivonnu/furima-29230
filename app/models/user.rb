class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many   :items
  has_many   :purchases
  has_one :card, dependent: :destroy
  
  with_options presence: true do
    validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "が空です 全角で入力して下さい"}
    validates :last_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "が空です 全角かなで入力して下さい"}
    validates :nickname, :email, :encrypted_password, :birthday
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'が空です 数字と文字の両方を入力して下さい' 
end
