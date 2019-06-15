class Customer < ApplicationRecord
  has_many :institutions, through: :customer_institutions
  has_many :customer_institutions
  has_many :transactions
  belongs_to :prefecture

  mount_uploader :image, ImagesUploader
end
