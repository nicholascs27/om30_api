class TwilioService
  def self.send_sms(telephone, message)
    @client = ::Twilio::REST::Client.new(Figaro.env.twilio_account_sid.to_s, Figaro.env.twilio_auth_token.to_s)
    message = @client.messages.create(
      body: message,
      from: Figaro.env.twilio_phone_number.to_s,
      to: telephone
    )
  end
end
