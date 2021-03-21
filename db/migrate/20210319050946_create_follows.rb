class CreateFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows do |t|
      t.integer :user_id, index: true, foreign_key: true
      t.integer :following_user_id, index: true, foreign_key: true

      t.timestamps
    end
  end
end
