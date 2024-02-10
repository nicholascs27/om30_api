module MunicipeAddressValidations
  extend ActiveSupport::Concern

  included do
    validates :street, :street_number, :neighborhood, presence: true
    validates :cep, :city, :state, presence: true
  end
end
