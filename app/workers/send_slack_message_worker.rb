class SendSlackMessageWorker
  include Sidekiq::Worker

  def perform(message_id)
    message = Message.find(message_id)
    response = SendSlackMessage.call(text: message.text, channel: message.channel)
    message.update!(payload: response)
    message.acknowledge_sent!
  rescue Slack::Web::Api::Errors::SlackError => e
    message.update!(payload: e.response&.body)
    message.fail!
  end
end
