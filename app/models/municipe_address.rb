class MunicipeAddress < ApplicationRecord
  self.table_name = :municipe_addresses

  include MunicipeAddressValidations

  belongs_to :municipe, class_name: 'Municipe'

  def self.ransackable_attributes(auth_object = nil)
    ["address_complement", "cep", "city", "created_at", "ibge_code", "neighborhood", "state", "street", "street_number"]
  end
end
