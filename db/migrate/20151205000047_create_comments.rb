class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.text :comment
    	t.text :username
    	t.text :email
    end
    add_reference :comments, :post, index: true, foreign_key: true
  end
end
