# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'POST /api/v1/messages', type: :request do
  context 'when message is created successfully' do
    let(:request_params) { { channel: channel, text: text } }
    let(:channel) { '#api-test' }
    let(:text) { 'rspec message' }
    let(:request) { post '/api/v1/messages', params: request_params }
    let(:stub_message) { instance_double Message }
    let(:serialized_message) do
      {
        foo: :bar
      }.to_json
    end

    before do
      allow(Message).to receive(:create!).and_return(stub_message)
      allow(stub_message).to receive(:serialize).and_return(serialized_message)

      VCR.use_cassette('POST /api/v1/messages - success') do
        request
      end
    end

    it "should be 200 - OK" do
      expect(response.status).to eq 200
    end

    it "should have correct body" do
      expect(response.body).to eq serialized_message
    end
  end
end
