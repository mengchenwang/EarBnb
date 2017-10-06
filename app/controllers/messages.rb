class EarBnb < Sinatra::Base
  get '/conversation/:id/new_message' do
    @conversation = Conversation.get(params[:id])
    erb :'messages/new'
  end

  post '/conversation/:id/submit_message' do
    @message = Message.new(content: params[:content])
    @conversation = Conversation.get(params[:id])
    @conversation.messages << @message
    current_user.messages << @message
    if @message.save
      current_user.save
      @conversation.save
      redirect "/conversation/#{params[:id]}"
    else
      flash.now[:errors] = @message.errors.full_messages
      erb :'messages/new'
    end
  end
end
