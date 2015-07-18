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

end