module API
  module V1
    class MunicipeAddresses < API::V1::Base
      include API::V1::Defaults

      resource :municipe_addresses do
        helpers do
          def set_municipe_address
            @municipe_address = ::MunicipeAddress.find(params[:id])
          end

          def set_municipe
            @municipe = ::Municipe.find(params[:id])
          end
        end

        desc "return a municipe address"
        params do
          requires :id, type: Integer
        end
        get '/:id', serializer: ::MunicipeAddressSerializer do
          set_municipe_address

          present @municipe_address
        end

        desc 'create a municipe address'
        params do
          requires :id, type: Integer
          requires :municipe_address, type: Hash do
            requires :street, type: String
            requires :street_number, type: String
            requires :neighborhood, type: String
            requires :city, type: String
            requires :state, type: String
            requires :cep, type: String
            optional :ibge_code, type: String
          end
        end
        post '/:id', serializer: ::MunicipeAddressSerializer do
          set_municipe
          municipe_address ||= ::MunicipeAddressCreateService.new(@municipe, params[:municipe_address].merge(municipe: @municipe)).create_municipe_address_service
          if municipe_address.is_a?(::MunicipeAddress)
            present municipe_address
          else
            error!(municipe_address[:errors], :bad_request)
          end
        end

        desc "edit to municipe"
        params do
          requires :id, type: Integer
        end
        put '/:id', serializer: ::MunicipeAddressSerializer do
          set_municipe_address

          municipe_address_edit_service = ::MunicipeAddressEditService.new(@municipe_address, params[:municipe_address])
          municipe_address = municipe_address_edit_service.edit_municipe_address_service

          if municipe_address.is_a?(::MunicipeAddress)
            present municipe_address
          else
            error!(municipe_address[:errors], :bad_request)
          end
        end
      end
    end
  end
end
