class Topic < ActiveRecord::Base
  has_many :questions

  validates :title, presence: true
  validates :description, presence: true

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  before_create { self.edit_key = generate_key }

  def generate_key
  	SecureRandom.urlsafe_base64(6)
  end

  def self.search(keyword)
    list = {}
    Topic.all.each{ |topic| list[topic] = topic.title.downcase.scan(/#{keyword.downcase}/).length }
    Hash[list.select{ |_,value| value > 0 }.sort_by{ |_,value| value }].keys.reverse
  end

end