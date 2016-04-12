class CreateClubsSponsorsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :clubs, :sponsors
  end
end
