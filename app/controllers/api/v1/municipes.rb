module API
  module V1
    class Municipes < API::V1::Base
      include API::V1::Defaults

      resource :municipes do
        helpers do
          def set_municipe
            @municipe = ::Municipe.find(permitted_params[:id])
          end
        end

        desc "return a municipe"
        params do
          requires :id, type: Integer
        end
        get '/:id', serializer: ::MunicipeSerializer do
          set_municipe

          present @municipe
        end

        desc 'create a municipe'
        params do
          requires :municipe, type: Hash do
            requires :full_name, type: String
            requires :email, type: String
            requires :telephone, type: String
            requires :cpf, type: String
            requires :cns, type: String
            requires :birth_date, type: Date
            requires :municipe_addresses_attributes, type: Array
          end
        end
        post '/', serializer: ::MunicipeSerializer do
          municipe ||= ::MunicipeCreateService.new(permitted_params).create_municipe_service
          if municipe.is_a?(::Municipe)
            present municipe
          else
            error!(municipe[:errors], :bad_request)
          end
        end

        desc "edit to municipe"
        params do
          requires :id, type: Integer
          requires :municipe, type: Hash do
            requires :full_name, type: String
            requires :email, type: String
            requires :telephone, type: String
            requires :birth_date, type: Date
          end
        end
        put '/:id', serializer: ::MunicipeSerializer do
          set_municipe
          municipe = ::MunicipeEditService.new(@municipe, permitted_params[:municipe]).edit_municipe_service

          if municipe.is_a?(::Municipe)
            present municipe
          else
            error!(municipe[:errors], :bad_request)
          end
        end
      end
    end
  end
end
