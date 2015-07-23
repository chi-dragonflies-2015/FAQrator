class Subscription < ActiveRecord::Base
  belongs_to :subscriber, class_name: "User"
  belongs_to :topic

  validates :subscriber_id, presence: :true
  validates :topic_id, presence: :true
end