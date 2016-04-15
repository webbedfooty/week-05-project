### CLUBS ###

# INDEX
get "/clubs" do
  @clubs = Club.all
  erb :"clubs/index"
end


# NEW
get "/clubs/new" do
  @club = Club.new
  erb :"clubs/new"
end


# CREATE
post "/clubs" do
  @club = Club.new(params)
  if @club.save
    redirect to('/clubs')
  else
    erb :"clubs/new"
  end
end


# SHOW w Sponsors
get "/clubs/:id" do
  @club = Club.find_by_id(params['id'])
  @sponsors = @club.sponsors
erb :"clubs/show"
end


# EDIT
get "/clubs/:id/edit" do
  @club = Club.find_by_id(params['id'])
  @clubs = Club.all
  erb :"clubs/edit"
end


# UPDATE
patch "/clubs/:id" do
  @club = Club.find_by_id(params['id'])
  if @club.update_attributes(name: params['name'], city: params['city'])
    redirect to("/clubs/#{@club.id}")
  else
    erb :"clubs/edit"
  end
end


# DELETE
# check scratch for delete
# put in code for reassign_all_clubs
#  @sponsor.reassign_all_clubs(@new_sponsor)


# CLUB SPONSORS
get '/clubs/:id/sponsors' do
  @club = Club.find_by_id(params['id'])
  @sponsors = @club.sponsors
  erb :"clubs/sponsors"
end

get '/clubs/:id/clubs_sponsors' do
  @club = Club.find_by_id(params['id'])
  @clubs_sponsors = ClubsSponsors.all
  erb :"clubs/clubs_sponsors"
end


# Adding a sponsor to a club
post '/clubs/:id/sponsors/add' do
  @club = Club.find_by_id(params['id'])
  @sponsor = Sponsor.find_by_id(params['sponsor_id'])

  @club.sponsors << @sponsor
  redirect to("/clubs/#{@club.id}/sponsors")
end


# Removing a sponsor to a club
post '/clubs/:id/sponsors/remove' do
  @club = Club.find_by_id(params['id'])
  @sponsor = Sponsor.find_by_id(params['sponsor_id'])

  @club.sponsors.delete(@club.sponsors)
  redirect to("/clubs/#{@club.id}/clubs_sponsors")
end



# ALL PLAYERS FOR A CLUB
