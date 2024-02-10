module API
  module V1
    class Base < Grape::API
      mount API::V1::Municipes
      mount API::V1::MunicipeAddresses
    end
  end
end
