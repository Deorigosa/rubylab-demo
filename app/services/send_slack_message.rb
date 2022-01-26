class SendSlackMessage
  class << self
    def call(channel:, text:)
      new.call(channel: channel, text: text)
    end

    private :new
  end

  def call(channel:, text:)
    client.chat_postMessage(channel: channel, text: text)
  end

  private

  def client
    @client ||= Slack::Web::Client.new
  end
end
