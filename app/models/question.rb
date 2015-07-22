class Question < ActiveRecord::Base
  default_scope { order(:cached_votes_up => :desc) }

  acts_as_votable

  has_many :comments
  belongs_to :topic

  validates :content, presence: true
  validates :topic, presence: true

  validates :content,length: { minimum: 2,maximum: 250,
   too_short: "%{count} characters is the minimum allowed",
    too_long: "%{count} characters is the maximum allowed" }
end

