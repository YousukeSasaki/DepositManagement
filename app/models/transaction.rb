class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :customer
  belongs_to :subject
  belongs_to :institution, optional: true
end
