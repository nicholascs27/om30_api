class MunicipeUpdateStatusService
  def initialize(municipe, status)
    @municipe = municipe
    @status = status
    @errors = []
  end

  def call
    ActiveRecord::Base.transaction do
      @municipe.status = @status
      @municipe.save
      status = @status ? I18n.t("twillio.message.enabled") : I18n.t("twillio.message.disabled")
      ::MunicipeMailer.confirm(@municipe, I18n.t("mailer.municipe.message.status_update", status: status)).deliver_now if @municipe.valid?
      ::TwilioService.send_sms("#{@municipe.ddi}#{@municipe.telephone}", I18n.t("twillio.message.status_update", status: status)) if @municipe.valid?

      return { errors: @municipe.errors.messages, status: :bad_request } unless @municipe.valid?
    end
    @municipe
  end
end
