class AddColumnPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :photos, :json
  end
end
