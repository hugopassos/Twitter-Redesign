class AddUniqueConstraintToFollowings < ActiveRecord::Migration[6.0]
  def change
    add_index :followings, [:user_id, :following_id], unique: true
  end
end
