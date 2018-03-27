class CreateInformations < ActiveRecord::Migration[5.1]
  def change
    create_table :informations do |t|
    	t.text "title", comment: "标题"
    	t.integer "company_id", comment: "公司"
    	t.integer "industryes_id", comment: "信息类型"
    	t.text "information", comment: "信息内容"
    	t.integer "contacts_id", comment: "联系人"
    	t.integer "click_times", comment: "点击次数"
    	t.timestamps	
    end
  end
end
