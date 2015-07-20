class Question < ActiveRecord::Base
  has_many :comments
  belongs_to :topic

  validates :content, presence: true
  validates :topic, presence: true
end

#six and 140 character limit