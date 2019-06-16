class Customer < ApplicationRecord
  has_many :institutions, through: :customer_institutions
  has_many :customer_institutions
  has_many :transactions
  belongs_to :prefecture

  validates :name, length: {in: 1..10}, presence: true
  validates :kana, length: {in: 1..10}, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :phone_number, length: {in: 1..13}
  validates :cell_phone_number, length: {in: 1..13}
  validates :emergency_phone_number, length: {in: 1..13}
  validates :postal_code, length: {in: 1..8}
  validates :city, length: {in: 1..50}
  validates :address, length: {in: 1..50}
  validates :building, length: {in: 1..50}

  mount_uploader :image, ImageUploader

  # def remove_hyphen
  #   params[:customer][:phone_number] = 
  # end
end
