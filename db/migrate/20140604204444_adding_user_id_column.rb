class AddingUserIdColumn < ActiveRecord::Migration
  def change
    add_column :events, :user_id, :string
  end
end