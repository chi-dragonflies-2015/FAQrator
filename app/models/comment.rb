class Comment < ActiveRecord::Base
  belongs_to :question

  validates :content, presence: true
  #validates :question, presence: true

  before_create do
    self.author ||= "Guest#{rand(1000)}"
  end
end