class Conversation
  include DataMapper::Resource

  belongs_to :property
  has n, :messages
  has 2, :users, through: Resource

  property :id,               Serial
  property :created_at,       DateTime

  def format_time(time = @created_at)
    "#{time.strftime('%R')} on #{time.strftime('%d/%-m')}"
  end
end
