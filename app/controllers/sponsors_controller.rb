### SPONSORS ###

# NEW
get "/sponsors/new" do
  @sponsor = Sponsor.new
  erb :"sponsors/new"
end


# CREATE
post "/sponsors" do
  @sponsor = Sponsor.new(params)
  if @sponsor.save
    redirect to("/sponsors")
  else
    erb :"sponsors/new"
  end
end


# INDEX
get "/sponsors" do
  @sponsors = Sponsor.all
  erb :"sponsors/index"
end


# SHOW
get "/sponsors/:id" do
  @sponsor = Sponsor.find_by_id(params['id'])
  @clubs = @sponsor.clubs
erb :"sponsors/show"
end


# EDIT
get "/sponsors/:id/edit" do
  @sponsor = Sponsor.find_by_id(params['id'])
#  @sponsors = Sponsor.all
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
delete "/sponsors/:id/?" do
  @sponsor = Sponsor.find_by_id(params['id'])
  @sponsor.destroy
  redirect to("/sponsors")
end
