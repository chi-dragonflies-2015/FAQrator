class User < ActiveRecord::Base
  has_secure_password
  
  has_many :topics
  
  has_many :active_relationships, class_name:  "Relationship",foreign_key: "follower_id", dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed

  has_many :passive_relationships, class_name:  "Relationship", foreign_key: "followed_id", dependent:   :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true


 
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end


  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end


  def following?(other_user)
    following.include?(other_user)
  end

end