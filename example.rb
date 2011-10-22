require './lib/rule.rb'
require './lib/rules_engine.rb'
require './rules/provisioning_message.rb'

result = RulesEngine[:provisioning_message].evaluate do
  {
    :broadband_on_net => false,
    :broadband_off_net => true,
    :talk_and_line_rental => true,
    :awaiting_phone_line => false,
  }
end

puts result