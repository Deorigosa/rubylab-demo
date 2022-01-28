require 'slack'

Slack.configure do |config|
  config.token = ENV.fetch('RUBY_LAB_SLACK_TOKEN', '')
end
