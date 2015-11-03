# scratch notes for quick restful routes convention reference
# crud and restful routes for a resource photos

# index -- list of photos
get '/photos' do
  @photos = Photo.all
  erb :index
end

#new photo
get '/photos/new' do
  erb :"photos/new"
end

# show a photo
get '/photos/:id' do
  @photo = Photo.where(id: params[:id]).first
  if @photo
    erb :"photos/show"
  else
    status 404
    "photo not found"
  end
end


# create photo
post '/photos' do
  @photo = photo.new(title: params[:title], url: params[:url])
  if @photo.save
    redirect '/photos/#{photo.id}'
  else
    status 400
    erb :"photos/new"
    # in view have something like:

# <% @photo.errors.full_messages.each do |error| %>
#   <h3> <%= error %> </h3>
# <% end %>

end

get '/photos/:id/edit' do
  @photo = Photo.where(id: params[:id]).first
  if @photo.save
    erb :"photos/edit"
  else
    status 404
    "bad request"
  end

  # make a form like below for photos/edit erb
  # <form method="post" action="/photos/<%= @photo.id %>">
  #   <input type="hidden" name="_method" value="put"/>
  #   <input type="submit" value="delete button"/>
  # </form>
end

# update
put '/photos/:id' do
  @photo = Photo.where(id: params[:id]).first
  @photo.title = "new title or whatever other changes"
  if @photo.save
    erb :"photos/edit"
  else
    status 404
    "bad request"
  end
end

# delete photo
delete '/photos/:id'
  @photo = Photo.where(id: params[:id]).first
  if @photo
    @photo.destroy
    redirect '/photos'
  else
    status 404
    "not found"
  end

  # make a form like below
  # <form method="post" action="url">
  #   <input type="hidden" name="_method" value="delete"/>
  #   <input type="submit" value="delete button"/>
  # </form>

end
