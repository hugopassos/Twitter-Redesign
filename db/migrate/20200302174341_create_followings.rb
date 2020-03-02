class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.references :user, index: true, null: false, foreign_key: true
      t.references :follower, index: true, null: false
      t.boolean :confirmed

      t.timestamps
    end
    add_foreign_key :followings, :users, column: :follower_id
  end
end
