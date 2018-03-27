class CearteIndustryes < ActiveRecord::Migration[5.1]
  def change
  	create_table :industryes do |t|
  		t.string "industry", comment: "类型"
  		t.integer "parent_id", comment: "父类id查找子节点"
  		t.timestamps	
  	end 
  end
end
