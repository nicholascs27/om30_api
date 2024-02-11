class Municipe < ApplicationRecord
  self.table_name = :municipes

  include MunicipeValidations

  mount_uploader :photo, PhotoUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  has_many :municipe_addresses, class_name: 'MunicipeAddress'

  accepts_nested_attributes_for :municipe_addresses, allow_destroy: true

  def self.ransackable_attributes(auth_object = nil)
    ["birth_date", "cns", "cpf", "created_at", "email", "full_name", "status", "telephone"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["municipe_addresses"]
  end

end
