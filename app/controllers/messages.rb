class EarBnb < Sinatra::Base

  get '/property/:id/new_message' do
    @property = Property.get(params[:id])
    erb :'messages/new'
  end

  post '/property/:id/submit_message' do
    @message = Message.new(content: params[:content])
    @property = Property.get(params[:id])
    @property.messages << @message
    current_user.messages << @message
    if @message.save
      current_user.save
      @property.save
      redirect "/property/#{params[:id]}"
    else
      flash.now[:errors] = @message.errors.full_messages
      erb :'messages/new'
    end
  end
end
