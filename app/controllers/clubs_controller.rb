### CLUBS ###

# NEW
get "/clubs/new" do
  @club = Club.new
  erb :"clubs/new"
end


# CREATE
post "/clubs" do
  @club = Club.new(params)
  if @club.save
    redirect to("/clubs")
  else
    erb :"clubs/new"
  end
end


# INDEX
get "/clubs" do
  @clubs = Club.all
  erb :"clubs/index"
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
#  @clubs = Club.all
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
delete "/clubs/:id/?" do
  @club = Club.find_by_id(params['id'])
  @club.destroy
  redirect to("/clubs")
end
