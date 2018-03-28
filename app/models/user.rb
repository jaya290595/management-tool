class User < ApplicationRecord
    attr_accessor :account_name
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #has_many :invitations, dependent: :destroy
  #has_one :account
  #accepts_nested_attributes_for :account
    after_create :account

  def account
    @account = Account.create(user_id: self.id, account_name: account_name)
  end
end
