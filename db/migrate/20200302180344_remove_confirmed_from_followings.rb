class RemoveConfirmedFromFollowings < ActiveRecord::Migration[6.0]
  def change
    remove_column :followings, :confirmed
  end
end
