class User < ApplicationRecord
    attr_accessor :account_name, :account_id1, :email1
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #has_many :invitations, dependent: :destroy
  #has_one :account
  #accepts_nested_attributes_for :account
    after_create :account 
    
  def self.team_id user_id
    User.find_by_id(user_id)
  end

  def account
    if (account_id1 && email1).present?
    Invitation.where(account_id: account_id1, email: email1).update(user_id: self.id)
    else
    @account = Account.create(user_id: self.id, account_name: account_name)
    end
  end

end
