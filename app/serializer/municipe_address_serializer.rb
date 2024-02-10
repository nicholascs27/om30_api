class MunicipeAddressSerializer < ActiveModel::Serializer
  attributes :id, :street, :street_number, :neighborhood,
              :city, :state, :cep, :ibge_code
end
