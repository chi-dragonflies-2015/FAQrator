class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :subscriber_id
      t.integer :topic_id

      t.timestamps null: false
    end
    add_index :subscriptions, :subscriber_id
    add_index :subscriptions, :topic_id
    add_index :subscriptions, [:subscriber_id, :topic_id], unique: true
  end
end
