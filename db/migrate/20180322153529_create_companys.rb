class CreateCompanys < ActiveRecord::Migration[5.1]
  def change
    create_table :companys do |t|
    	t.string "name", comment: "公司名称"
    	t.string "artificial", comment: "法人"
    	t.string "information", comment: "简介"
    	t.string "address_id", comment: "地址"
    	t.date "creation_date", comment: "创建时间"
    	t.timestamps	
    end
  end
end
