class Transaction < ApplicationRecord
  # associate
  belongs_to :user
  belongs_to :customer
  belongs_to :subject
  belongs_to :institution, optional: true

  # validation
  validates :ts_number, presence: true
  validates :date, presence: true
  validates :customer, presence: true
  validates :subject, presence: true
  validates :amount, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 9999999999}, presence: true
  validates :summary, length: {in: 0..100}
  validates :user, presence: true
end
