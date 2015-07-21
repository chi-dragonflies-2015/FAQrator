class User < ActiveRecord::Base
  has_many :topics
  has_many :active_relationshhips

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true
end