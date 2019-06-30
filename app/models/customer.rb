class Customer < ApplicationRecord
  has_many :institutions
  has_many :transactions
  has_one :balance
  accepts_nested_attributes_for :balance
  belongs_to :prefecture

  validates :name, length: {in: 1..12}, presence: true
  validates :kana, length: {in: 1..12}, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :phone_number, length: {in: 0..13}
  validates :cell_phone_number, length: {in: 0..13}
  validates :emergency_phone_number, length: {in: 0..13}
  validates :postal_code, length: {in: 0..8}
  validates :city, length: {in: 0..30}
  validates :address, length: {in: 0..30}
  validates :building, length: {in: 0..30}

  mount_uploader :image, ImageUploader

  # def remove_hyphen
  #   params[:customer][:phone_number] = 
  # end
end
