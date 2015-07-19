class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :question
      t.text :content, null: false

      t.timestamps
    end
  end
end
