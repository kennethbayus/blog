class AddColumnToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :user_id, :integer
  	add_column :posts, :tag_line, :text
  end
end
