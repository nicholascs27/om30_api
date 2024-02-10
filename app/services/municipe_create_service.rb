class MunicipeCreateService
  def initialize(params)
    @params = params
  end

  def create_municipe_service
    ActiveRecord::Base.transaction do
      @municipe = create_municipe
      return { errors: @municipe.errors.messages, status: :bad_request } unless @municipe.valid?
    end

    @municipe
  end

  private

  def create_municipe
    ::Municipe.create(@params[:municipe])
  end
end
