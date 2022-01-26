class Api::V1::MessagesController < ApplicationController
  # GET /messages
  def index
    @messages = Message.all

    render json: @messages.to_json
  end

  # GET /messages/:id
  def show
    @message = Message.find(params[:id])

    render json: @message.to_json
  end

  # POST /messages
  def create
    raise NotImplementedError
  end

  private

  def message_params
    params.require(:message).permit(:text, :channel)
  end
end
