class RemovePlayerIdFromClubs < ActiveRecord::Migration
  def change
    remove_column :clubs, :player_id, :integer
  end
end
