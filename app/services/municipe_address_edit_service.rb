class MunicipeAddressEditService
  def initialize(municipe_address, params)
    @municipe_address = municipe_address
    @params = params
  end

  def edit_municipe_address_service
    ActiveRecord::Base.transaction do
      update_municipe_address
      return { errors: @municipe_address.errors.messages, status: :bad_request } unless @municipe_address.valid?
    end

    @municipe_address
  end

  private

  def update_municipe_address
    @municipe_address.update(@params)
  end
end
