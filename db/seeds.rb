# Put your seed data in here. This should be a series of .create! statements for
# each of your relevant models.
#
# You'll run it with rake db:seed

Club.create(name: "Liverpool", city: "Liverpool")
#Club.create(name: "Arsenal", city: "London", club_sponsors: "Emirates")
#Club.create(name: "Fulham", city: "London", club_sponsors: "ForEx")
Player.create(name: "Messi", value: "10000000")
Player.create(name: "Zlatan", value: "10,000,000")
#Player.create(name: "Dalglish", value: "100000", club: "Arsenal")
Sponsor.create(name: "Aflac")
#Sponsor.create(name: "Fireball", sponsor_clubs: "Birmingham")
