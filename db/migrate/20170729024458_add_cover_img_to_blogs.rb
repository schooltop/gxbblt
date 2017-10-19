class AddCoverImgToBlogs < ActiveRecord::Migration[5.1]
  def change
  	add_column :blogs ,:cover_img, :string, comment: 'cover' 
  	add_column :blogs ,:category_id, :integer, comment: 'category' 
  	add_column :blogs ,:view_count, :integer, comment: 'view_count' 
  	add_column :blogs ,:seq, :integer, default: 10, comment: 'seq' 
  end
end
