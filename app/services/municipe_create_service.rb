class MunicipeCreateService
  def initialize(params)
    @params = params
  end

  def create_municipe_service
    ActiveRecord::Base.transaction do
      @municipe = create_municipe
      ::MunicipeMailer.confirm(@municipe, I18n.t("mailer.municipe.message.create")).deliver_now if @municipe.valid?
      ::TwilioService.send_sms("#{@municipe.ddi}#{@municipe.telephone}", I18n.t("twillio.message.create")) if @municipe.valid?
      return { errors: @municipe.errors.messages, status: :bad_request } unless @municipe.valid?
    end

    @municipe
  end

  private

  def create_municipe
    ::Municipe.create(@params[:municipe])
  end
end
