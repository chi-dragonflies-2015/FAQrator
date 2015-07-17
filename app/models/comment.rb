class Comment < ActiveRecord::Base
  belongs_to :question

  validates :content, presence: true
  #validates :question, presence: true

  after_initialize :init

  def init
    self.author ||= "Guest#{rand(1000)}"
  end

end