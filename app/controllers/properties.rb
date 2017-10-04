class EarBnb < Sinatra::Base

  get '/' do
    redirect '/properties'
  end

  get '/properties' do
    @properties = Property.all
    erb :'properties/index'
  end

  # get '/properties/111' do
  #
  # end
  #
  # get 'propertyies/111/new_comment'
  #
  # end
  #
  # post 'properties/111/post_comment'
  #   redirect 'properties/111'
  # end

  get '/property/:id' do
    @property = Property.get(params['id'])
    # @property.address1
    # @comments = Comment.all(:property_id => params['id'])
    erb(:'properties/property')
  end

  post '/properties' do
    @property = current_user.propertys.new(description: params[:description],
                                           address1: params[:address1],
                                           price: params[:price],
                                           bedrooms: params[:bedrooms],
                                           file: params[:file]
                                          )
    if @property.save
      current_user.save
      redirect '/properties'
    else
      flash.now[:errors] = @property.errors.full_messages
      erb :'properties/new'
    end
<<<<<<< HEAD
    # property = Property.create(
    # :address1 => params[:address1],
    # :price_per_night => params[:price],
    # :description => params[:description]
    # )q
    # session['message'] = params[:address1]
    # redirect to('/properties')
=======
>>>>>>> c814ffab356582ffb64d8a861b3e331b2034a457
  end

  get '/property/:id' do
    @property = Property.get(params[:id])
    erb :'properties/property'
  end

  get '/properties/new' do
    erb :'properties/new'
  end
end
