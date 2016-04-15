### SPONSORS ###

# INDEX
get "/sponsors" do
  @sponsors = Sponsor.all
  erb :"sponsors/index"
end


# NEW
get "/sponsors/new" do
  @sponsor = Sponsor.new
  erb :"sponsors/new"
end


# CREATE
post "/sponsors" do
  @sponsor = Sponsor.new(params)
  if @sponsor.save
    redirect to('/sponsors')
  else
    erb :"sponsors/new"
  end
end


# SHOW
get "/sponsors/:id" do
  @sponsor = Sponsor.find_by_id(params['id'])
erb :"sponsors/show"
end


# EDIT
get "/sponsors/:id/edit" do
  @sponsor = Sponsor.find_by_id(params['id'])
  @sponsors = Sponsor.all
  erb :"sponsors/edit"
end


# UPDATE
patch "/sponsors/:id" do
  @sponsor = Sponsor.find_by_id(params['id'])
  if @sponsor.update_attributes(name: params['name'])
    redirect to("/sponsors/#{@sponsor.id}")
  else
    erb :"sponsors/edit"
  end
end


# DELETE
# check scratch for delete
# put in code for reassign_all_clubs
#  @player.reassign_all_clubs(@new_player)


# SPONSORS CLUB
get '/sponsors/:id/clubs' do
  @sponsor = Sponsor.find_by_id(params['id'])
  @clubs = @sponsor.clubs
  erb :"sponsors/clubs"
end


get '/sponsors/:id/clubs_sponsors' do
  @sponsor = Sponsor.find_by_id(params['id'])
  @clubs_sponsors = ClubsSponsors.all
  erb :"clubs/clubs_sponsors"
end


# Adding a club to a sponsor ??
post '/sponsors/:id/clubs/add' do
  @sponsor = Sponsor.find_by_id(params['id'])
  @club = Club.find_by_id(params['sponsor_id'])

  @sponsor.clubs << @club
  redirect to("/sponsors/#{@sponsor.id}/clubs")
end


# Removing a club to a sponsor ??
post '/sponsors/:id/clubs/remove' do
  @sponsor = Sponsor.find_by_id(params['id'])
  @club = Club.find_by_id(params['sponsor_id'])

  @sponsor.clubs.delete(@sponsor.clubs)
  redirect to("/sponsors/#{@sponsor.id}/clubs_sponsors")
end
