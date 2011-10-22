RulesEngine.add :provisioning_message do

  domain [
    :broadband_on_net,
    :broadband_off_net,
    :talk_and_line_rental,
    :awaiting_phone_line,
  ]

  rule "Awaiting phone line" do
    "UK/Common/DSL/NewResponses/AwaitingPhoneLine" if @awaiting_phone_line
  end

  rule "Broadband on-net only" do
    "UK/Common/DSL/NewResponses/Onnet_BB_Only" if @broadband_on_net and not @talk_and_line_rental
  end

  rule "Broadband and talk" do
    "UK/Common/DSL/NewResponses/Onnet_BBAndTalk" if @broadband_on_net and @talk_and_line_rental
  end

  rule "Broadband off-net only" do
    "UK/Common/DSL/NewResponses/Connect_Only" if @broadband_off_net and not @talk_and_line_rental
  end

  rule "Broadband off-net and talk" do
    "UK/Common/DSL/NewResponses/Connect_Talk" if @broadband_off_net and @talk_and_line_rental
  end

  rule "Talk only" do
    "UK/Common/DSL/NewResponses/Talk_Only" if @talk_and_line_rental and not (:broadband_on_net or :broadband_off_net)
  end

  rule "No products" do
    "UK/Common/DSL/NewResponses/No_BB_Or_Talk" if not (@talk_and_line_rental or :broadband_on_net or :broadband_off_net)
  end

end