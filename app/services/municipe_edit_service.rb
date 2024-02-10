class MunicipeEditService
  def initialize(municipe, params)
    @municipe = municipe
    @params = params
  end

  def edit_municipe_service
    ActiveRecord::Base.transaction do
      update_municipe
      return { errors: @municipe.errors.messages, status: :bad_request } unless @municipe.valid?
    end

    @municipe
  end

  private

  def update_municipe
    @municipe.update(@params)
  end
end
