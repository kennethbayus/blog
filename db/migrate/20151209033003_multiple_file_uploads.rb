class MultipleFileUploads < ActiveRecord::Migration
  def change
  	remove_column :posts, :photo
  end
end
