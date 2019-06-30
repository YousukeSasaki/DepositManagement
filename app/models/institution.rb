class Institution < ApplicationRecord
  has_many :customers
  has_many :transactions
  belongs_to :institution_type
  belongs_to :prefecture

  mount_uploader :image, ImageUploader
end
