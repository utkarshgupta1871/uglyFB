class AddConfirmationToFriendships < ActiveRecord::Migration[5.1]
  def change
    add_column :friendships, :confirmation, :boolean, default: false
  end
end
