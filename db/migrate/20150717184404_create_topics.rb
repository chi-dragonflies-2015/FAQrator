class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
    	t.string :title
    	t.text :description
    	t.string :friendly_url
    	t.string :edit_key
    end
  end
end
