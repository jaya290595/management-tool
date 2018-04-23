class User < ApplicationRecord
    attr_accessor :account_name, :token
    validates_presence_of :name, :email

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #has_many :invitations, dependent: :destroy
  #has_one :account
  #accepts_nested_attributes_for :account
   
  after_create :account 
    
  def self.get_invite account_id
    User.find_by_id(account)
  end

  def account
    token1 = token 
    if token1.present?
    Invitation.where(token: token1).update(user_id: self.id)
    else
    @account = Account.create(user_id: self.id, account_name: account_name) if account_name.present?
    end
  end

end
