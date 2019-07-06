class Customer < ApplicationRecord
  # association
  has_many :institutions
  has_many :transactions, dependent: :destroy
  has_one :balance, dependent: :destroy, class_name: "Balance"
  accepts_nested_attributes_for :balance
  belongs_to :prefecture, optional: true

  # validation
  validates :name, length: {in: 1..12}, presence: true
  validates :kana, length: {in: 1..12}, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :phone_number, length: {in: 0..13}, format: {with: /\A\d{2}[-]\d{4}[-]\d{4}$|^\d{3}[-]\d{3}[-]\d{4}$|^\d{4}[-]\d{2}[-]\d{4}$|^\d{4}[-]\d{3}[-]\d{3}$|^\d{3}[-]\d{4}[-]\d{4}$|^\d{10,11}\z/}, allow_blank: true
  validates :cell_phone_number, length: {in: 0..13}, format: {with: /\A\d{2}[-]\d{4}[-]\d{4}$|^\d{3}[-]\d{3}[-]\d{4}$|^\d{4}[-]\d{2}[-]\d{4}$|^\d{4}[-]\d{3}[-]\d{3}$|^\d{3}[-]\d{4}[-]\d{4}$|^\d{10,11}\z/}, allow_blank: true
  validates :emergency_phone_number, length: {in: 0..13}, format: {with: /\A\d{2}[-]\d{4}[-]\d{4}$|^\d{3}[-]\d{3}[-]\d{4}$|^\d{4}[-]\d{2}[-]\d{4}$|^\d{4}[-]\d{3}[-]\d{3}$|^\d{3}[-]\d{4}[-]\d{4}$|^\d{10,11}\z/}, allow_blank: true
  validates :postal_code, length: {in: 0..8}, format: {with: /\A\d{3}[-]\d{4}$|^\d{7}\z/}, allow_blank: true
  validates :city, length: {in: 0..30}
  validates :address, length: {in: 0..30}
  validates :building, length: {in: 0..30}

  mount_uploader :image, ImageUploader
end
