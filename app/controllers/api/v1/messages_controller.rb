class Api::V1::MessagesController < ApplicationController
  # GET /messages
  def index
    messages = Message.all

    render json: messages.map(&:serialize)
  end

  # GET /messages/:id
  def show
    message = Message.find(params[:id])

    render json: message.serialize
  end

  # POST /messages
  def create
    # TODO: handle Slack rate limiting
    # https://github.com/sensortower/sidekiq-throttled
    message = Message.create!(
      status: :pending,
      text: message_params[:text],
      channel: message_params[:channel]
    )

    SendSlackMessageWorker.perform_async(message.id)

    render json: message.serialize
  end

  private

  def message_params
    params.permit(:text, :channel)
  end
end
