class Message
  include DataMapper::Resource

  belongs_to :user
  belongs_to :property

  property :id,               Serial
  property :content,          Text, required: true, length: 1..300,
                              messages: {
                                presence: "Message must not be empty",
                                length: "Message must not be more than 300 characters"
                              }
  property :created_at,       DateTime

  def format_time(time = @created_at)
    "#{time.strftime("%R")} on #{time.strftime("%d/%-m")}"
  end
end
