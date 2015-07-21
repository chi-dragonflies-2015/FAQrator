class User < ActiveRecord::Base
  has_secure_password
  
  has_many :topics
  has_many :active_relationshhips, class_name:  "Relationship",foreign_key: "follower_id", dependent:   :destroy


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true
end