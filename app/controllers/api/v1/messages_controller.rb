class Api::V1::MessagesController < ApplicationController
  # GET /messages
  def index
    @messages = Message.all

    render json: @messages
  end

  # GET /messages/:id
  def show
    @message = Message.find(params[:id])

    render json: @message
  end

  # POST /messages
  def create
    response = SendSlackMessage.call(text: message_params[:text], channel: message_params[:channel])
    @message = Message.create!(payload: response)

    render json: @message
  end

  private

  def message_params
    params.permit(:text, :channel)
  end
end
