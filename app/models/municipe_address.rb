class MunicipeAddress < ApplicationRecord
  self.table_name = :municipe_addresses

  include MunicipeAddressValidations

  belongs_to :municipe, class_name: 'Municipe'
end
