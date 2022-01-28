# frozen_string_literal: true

class Message < ApplicationRecord
  store_accessor :payload

  def serialize
    MessageSerializer.new(self).attributes
  end
end
