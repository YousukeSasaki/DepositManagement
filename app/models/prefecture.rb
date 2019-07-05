class Prefecture < ApplicationRecord
  # association
  has_many :customers
  has_many :institutions
end
