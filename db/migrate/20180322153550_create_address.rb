class CreateAddress < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
    	t.string "province", comment: "省份"
    	t.string "city", comment: "市"
    	t.string "county", comment: "县"
    	t.string "town", comment: "镇"
    	t.string "street", comment: "街／村"
    	t.string "door_number", comment: "门牌号"
        t.timestamps    
    end
  end
end
