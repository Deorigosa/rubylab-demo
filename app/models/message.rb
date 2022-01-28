# frozen_string_literal: true

require 'aasm'

class Message < ApplicationRecord
  include AASM

  aasm column: 'status' do
    state :pending, initial: true
    state :sent
    state :error

    event :acknowledge_sent do
      transitions from: :pending, to: :sent
    end

    event :fail do
      transitions from: :pending, to: :error
    end
  end

  store_accessor :payload

  def serialize
    MessageSerializer.new(self).attributes
  end
end
