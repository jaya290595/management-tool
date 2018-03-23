class Account < ApplicationRecord
  has_one :users
  has_many :invitations
end
