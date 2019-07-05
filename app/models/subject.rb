class Subject < ApplicationRecord
  # association
  has_many :transactions
  has_ancestry

  # validation
  validates :name, length: { in: 1..25, message: 'は1〜25文字で記入してください'}, presence: true
  validates :status, numericality: {only_integer: true, greater_than_or_equal_to: 0, :less_than_or_equal_to: 1}, presence: true
end
