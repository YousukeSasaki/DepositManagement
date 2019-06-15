class Institution < ApplicationRecord
  has_many :customers, through: :customer_institutions
  has_many :customer_institutions
  has_many :transactions
  belongs_to :institution_types
  belongs_to :prefecture

  mount_uploader :image, ImagesUploader
end
