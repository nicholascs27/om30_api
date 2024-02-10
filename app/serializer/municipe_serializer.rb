class MunicipeSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :email, :cpf, :cns,
              :birth_date, :telephone, :status

  has_many :municipe_addresses, each_serializer: ::MunicipeAddressSerializer
end
