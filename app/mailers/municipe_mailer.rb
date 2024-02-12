class MunicipeMailer < ApplicationMailer
  default(
    from: Figaro.env.email_name.to_s,
  )

  def confirm(municipe, message)
    @municipe = municipe
    @message = message
    mail(to: @municipe.email, subject: @message)
  end
end
