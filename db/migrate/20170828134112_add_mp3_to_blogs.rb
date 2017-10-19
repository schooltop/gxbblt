class AddMp3ToBlogs < ActiveRecord::Migration[5.1]
  def changes
  	add_column :blogs ,:mp3, :integer, comment: 'pm3_bgroud_music' 
  end
end
