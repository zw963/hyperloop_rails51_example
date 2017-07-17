#config/initializers/hyperloop.rb

Hyperloop.configuration do |config|
  config.transport = :action_cable
  config.import 'client_and_server'
  config.import 'client_only', client_only: true
  config.import 'reactrb/auto-import'
end
