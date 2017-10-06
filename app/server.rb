class EarBnb < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Flash

  use Rack::MethodOverride

  register Sinatra::Partial
  set :partial_template_engine, :erb
  enable :partial_underscores

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def other_user(conversation)
      @other_user = (conversation.conversation_users.map(&:user) - [current_user]).first
    end

    def user_name(user)
      "#{user.first_name} #{user.last_name}"
    end
  end
end
