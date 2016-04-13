# 004_add_player_id_to_clubs_table
class AddPlayerIdToClubsTable <ActiveRecord::Migration
  def change
    add_column :clubs, :player_id, :integer
  end
end
