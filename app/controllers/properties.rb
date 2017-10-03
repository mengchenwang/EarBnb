class EarBnb < Sinatra::Base
  get '/' do
    redirect '/properties'
  end

  get '/properties' do
    @properties = Property.all
    @message = session['message']
    erb :'properties/index'
  end

  post '/properties' do
    p params[:file][:filename]
    @photo = params[:file][:filename]
    @property = current_user.propertys.new(
    description: params[:description],
    :address1 => params[:address1],
    :address2 => params[:address2],
    :address3 => params[:address3],
    :city => params[:city],
    :state => params[:state],
    :post_code => params[:post_code],
    :price_per_night => params[:price],
    :bedrooms => params[:bedrooms],
    :imgitage_url => @photo
    )
    if @property.save
      current_user.save
      redirect '/properties'
    else
      flash.now[:errors] = @property.errors.full_messages
      erb :'properties/new'
    end
    # property = Property.create(
    # :address1 => params[:address1],
    # :price_per_night => params[:price],
    # :description => params[:description]
    # )
    # session['message'] = params[:address1]
    # redirect to('/properties')
  #  session[:file][]
  end

  get '/properties/new' do
    erb :'properties/new'
  end

  get '/property/:id' do
    @property = Property.get(params['id'])
    # @property.address1
    # @comments = Comment.all(:property_id => params['id'])
    erb(:'properties/property')

  end

end
