class Municipe < ApplicationRecord
  self.table_name = :municipes

  include MunicipeValidations

  has_many :municipe_addresses, class_name: 'MunicipeAddress'

  accepts_nested_attributes_for :municipe_addresses, allow_destroy: true
end
