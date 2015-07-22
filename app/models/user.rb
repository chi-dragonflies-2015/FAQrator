class User < ActiveRecord::Base
  has_secure_password
  
  has_many :topics
  
  has_many :subscriptions, foreign_key: "subscriber_id", dependent:   :destroy
  has_many :followed_topics, through: :subscriptions, source: :topic
  
  has_many :active_relationships, class_name:  "Relationship", foreign_key: "follower_id", dependent:   :destroy
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

  def star(topic)
    subscriptions.create(topic_id: topic.id)
  end


  def unstar(topic)
    subscriptions.find_by(topic_id: topic.id).destroy
  end


  def starred?(topic)
    followed_topics.include?(topic)
  end

end