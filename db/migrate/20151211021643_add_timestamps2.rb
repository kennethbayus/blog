class AddTimestamps2 < ActiveRecord::Migration
  def change
  	add_timestamps :users
  	add_timestamps :categories
  	add_timestamps :post_categories
  end
end
