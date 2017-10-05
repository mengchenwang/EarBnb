class EarBnb < Sinatra::Base

  get '/property/:id/contact_form' do
    @property = Property.get(params[:id])
    erb :'conversations/new'
  end

  post '/property/:id/new_conversation' do
    @message = Message.new(content: params[:content])
    @conversation = Conversation.new
    @property = Property.get(params[:id])
    @property_owner = @property.user
    @conversation.messages << @message
    current_user.messages << @message
    @property.conversations << @conversation
    current_user.conversations << @conversation
    @property_owner.conversations << @conversation
    if @message.save
      @conversation.save
      current_user.save
      @property.save
      @property_owner.save
      redirect '/conversations'
    else
      flash.now[:errors] = @message.errors.full_messages
      erb :'conversations/new'
    end
  end

  get '/conversations' do
    erb :'conversations/index'
  end

  get '/conversation/:id' do
    @conversation = Conversation.get(params[:id])
    erb :'conversations/conversation'
  end
end
