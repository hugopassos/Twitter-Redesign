class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.references :user, index: true, null: false, foreign_key: true
      t.references :following, index: true, null: false

      t.timestamps
    end
    add_foreign_key :followings, :users, column: :following_id
  end
end
