class Subject < ApplicationRecord
  has_many :transactions
  has_ancestry
end
