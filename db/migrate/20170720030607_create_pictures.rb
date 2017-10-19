class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.string  :name
      t.references :category
      t.integer :view_count , comment: '访问次数' 
      t.timestamps	
    end
  end
end
