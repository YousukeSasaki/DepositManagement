class Institution < ApplicationRecord
  # association
  has_many :customers
  has_many :transactions
  belongs_to :institution_type, optional: true
  belongs_to :prefecture, optional: true

  # validation
  validates :name, length: {in: 1..30}, presence: true
  validates :kana, length: {in: 1..50}, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :phone_number_one, length: {in: 10..13}, format: {with: /\A\d{2}[-]\d{4}[-]\d{4}$|^\d{3}[-]\d{3}[-]\d{4}$|^\d{4}[-]\d{2}[-]\d{4}$|^\d{4}[-]\d{3}[-]\d{3}$|^\d{3}[-]\d{4}[-]\d{4}$|^\d{10,11}\z/}, allow_blank: true
  validates :phone_number_two, length: {in: 10..13}, format: {with: /\A\d{2}[-]\d{4}[-]\d{4}$|^\d{3}[-]\d{3}[-]\d{4}$|^\d{4}[-]\d{2}[-]\d{4}$|^\d{4}[-]\d{3}[-]\d{3}$|^\d{3}[-]\d{4}[-]\d{4}$|^\d{10,11}\z/}, allow_blank: true
  validates :postal_code, length: {in: 0..8}, format: {with: /\A\d{3}[-]\d{4}$|^\d{7}\z/}, allow_blank: true
  validates :city, length: {in: 0..30}
  validates :address, length: {in: 0..30}
  validates :building, length: {in: 0..30}

  mount_uploader :image, ImageUploader
end
