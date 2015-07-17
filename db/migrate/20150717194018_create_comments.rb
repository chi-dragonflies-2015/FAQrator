class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :question

    end
  end
end
