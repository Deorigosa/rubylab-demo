class Api::V1::MessagesController < ApplicationController
  # GET /messages
  def index
    @messages = Message.all

    render json: @messages.to_json
  end

  # GET /messages/:id
  def show; end

  # POST /messages
  def create; end
end
