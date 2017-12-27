class CreateHouseMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :house_memberships do |t|

      t.timestamps
    end
  end
end
