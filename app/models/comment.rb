class Comment < ActiveRecord::Base
  belongs_to :question

  validates :content, presence: true
  validates :question, presence: true

  before_save :init

  def init
    self.author = "Guest#{rand(1000)}" if author == "" || author == nil
  end
end