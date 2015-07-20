class AddTopicToQuestions < ActiveRecord::Migration
  def change
    add_reference :questions, :topic
  end
end
