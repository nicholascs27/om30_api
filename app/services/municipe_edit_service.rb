class MunicipeEditService
  def initialize(municipe, params)
    @municipe = municipe
    @params = params
  end

  def edit_municipe_service
    ActiveRecord::Base.transaction do
      update_municipe
      ::MunicipeMailer.confirm(@municipe, I18n.t("mailer.municipe.message.update")).deliver_now if @municipe.valid?
      ::TwilioService.send_sms("#{@municipe.ddi}#{@municipe.telephone}", I18n.t("twillio.message.update")) if @municipe.valid?
      return { errors: @municipe.errors.messages, status: :bad_request } unless @municipe.valid?
    end

    @municipe
  end

  private

  def update_municipe
    @municipe.update(@params[:municipe])
  end
end
