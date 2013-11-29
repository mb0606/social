class AddUserIdToStatuses < ActiveRecord::Migration
  def change
	add_column :statuses, :user_id, :integer
	add_index :statuses, :user_id
	remove_column :statuses, :name
	remove_column :statuses, :context
	add_column :statuses, :content, :text
  end
end
