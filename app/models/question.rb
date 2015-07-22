class Question < ActiveRecord::Base
  default_scope { order(:cached_votes_up => :desc) }

  acts_as_votable

  has_many :comments
  belongs_to :topic

  validates :content, presence: true
  validates :topic, presence: true
end

#six and 140 character limit