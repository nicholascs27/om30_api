class Municipe < ApplicationRecord
  self.table_name = :municipes

  include MunicipeValidations

  mount_uploader :photo, PhotoUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  has_many :municipe_addresses, class_name: 'MunicipeAddress'

  accepts_nested_attributes_for :municipe_addresses, allow_destroy: true
end
