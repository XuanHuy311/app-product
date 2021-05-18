class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
    	t.string 	:name, null: false
    	t.numeric :price, null: false
    	t.boolean :no_sale_tax 
    	t.boolean :is_imported

      t.timestamps
    end
  end
end
