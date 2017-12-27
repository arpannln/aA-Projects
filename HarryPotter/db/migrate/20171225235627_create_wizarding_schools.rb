class CreateWizardingSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :wizarding_schools do |t|

      t.timestamps
    end
  end
end
