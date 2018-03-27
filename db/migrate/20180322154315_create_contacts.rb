class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
    	t.integer "companys_id", comment: "公司"
    	t.string "name", comment: "姓名"
    	t.string "position", comment: "职位"
    	t.integer "telephone", comment: "电话"
    	t.string "e_mail", comment: "邮箱"
    	t.timestamps	
    end
  end
end
