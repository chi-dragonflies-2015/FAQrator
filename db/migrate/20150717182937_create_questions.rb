class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :content
      # t.references :topic

      t.timestamps null: false
    end
  end
end
