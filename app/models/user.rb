class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :transactions
  has_many :shares
  has_many :stocks, through: :shares
  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?
  def set_default_role
    self.role ||= :user
  end

  enum pending: [:waiting, :approved]
  after_initialize :set_default_pending, :if => :new_record?
  def set_default_pending
    self.role ||= :waiting
  end
  
  has_many :stock_transactions
end
