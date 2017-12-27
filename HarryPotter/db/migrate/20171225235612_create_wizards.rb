class CreateWizards < ActiveRecord::Migration[5.1]
  def change
    create_table :wizards do |t|

      t.timestamps
    end
  end
end
