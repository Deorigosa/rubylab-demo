class MessageSerializer < ActiveModel::Serializer
  attributes :id, :channel, :message

  def channel
    payload["channel"]
  end

  def message
    {
      timestamp: payload["ts"],
      text: payload["message"]["text"],
    }
  end

  private

  def payload
    self.object.payload
  end
end
