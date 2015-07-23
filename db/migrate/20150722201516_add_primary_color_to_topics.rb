class AddPrimaryColorToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :primary_color, :string
  end
end
