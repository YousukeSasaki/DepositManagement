class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # association
  has_many :transations

  # validation
  validates :name, length: { in: 1..12, message: 'は1〜12文字で記入してください'}, presence: true
  validates :kana, length: { in: 1..12, message: 'は1〜12文字で記入してください'}, presence: true
  validates :email, length: { maximum: 50, too_long: 'は50文字以内で記入してください'}, presence: true, format: { with: /\A\S+@\S+\.\S+\z/, message: "は「***@***.***」で登録してください"}
  validates_uniqueness_of :email, message: 'は既に登録されています' 
  validates :password, length: { in: 6..15, message: '6〜15文字で記入してください'}, presence: true, confirmation: true
end
