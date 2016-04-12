class RemoveValueFromSponsors < ActiveRecord::Migration
  def change
    remove_column :sponsors, :value, :integer
  end
end
