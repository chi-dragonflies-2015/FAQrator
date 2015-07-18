class RemoveFriendlyUrlFromTopics < ActiveRecord::Migration
  def change
    remove_column :topics, :friendly_url, :string
  end
end
