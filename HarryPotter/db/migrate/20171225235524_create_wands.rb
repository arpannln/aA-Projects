class CreateWands < ActiveRecord::Migration[5.1]
  def change
    create_table :wands do |t|
      t.string :type
      t.integere :owner_id 
      t.timestamps
    end
  end
end
