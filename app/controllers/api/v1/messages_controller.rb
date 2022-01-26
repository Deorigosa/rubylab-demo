class Api::V1::MessagesController < ApplicationController
  # GET /messages
  def index
    @messages = Message.all

    render json: @messages.to_json
  end

  # GET /messages/:id
  def show
    @message = Message.find(message_params[:id])

    render json: @message.to_json
  end

  # POST /messages
  def create
    raise NotImplementedError
  end

  private

  def message_params
    params.require(:messages).permit(:id, :text, :channel)
  end
end
