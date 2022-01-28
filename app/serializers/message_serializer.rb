class MessageSerializer < ActiveModel::Serializer
  attributes :id, :status, :channel, :text, :ts, :payload
end
