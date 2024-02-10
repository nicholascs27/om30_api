class MunicipeAddressCreateService
  def initialize(municipe, params)
    @municipe = municipe
    @params = params
  end

  def create_municipe_address_service
    ActiveRecord::Base.transaction do
      @municipe_address = create_municipe_address
      return { errors: @municipe_address.errors.messages, status: :bad_request } unless @municipe_address.valid?
    end

    @municipe_address
  end

  private

  def create_municipe_address
    ::MunicipeAddress.create(@params)
  end
end
