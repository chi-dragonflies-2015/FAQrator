class Topic < ActiveRecord::Base
  has_many :questions

  validates :title, presence: true
  validates :description, presence: true

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

end