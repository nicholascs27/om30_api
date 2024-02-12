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

        desc "return municipes"
        params do
          optional :q, type: Hash
        end
        # desc 'Retorna todos os municipes'
        get do
          ::Municipe.all
        end

        desc 'create a municipe'
        post '/', serializer: ::MunicipeSerializer do
          municipe ||= ::MunicipeCreateService.new(params).create_municipe_service
          if municipe.is_a?(::Municipe)
            present municipe
          else
            error!(municipe[:errors], :bad_request)
          end
        end

        desc "edit to municipe"
        params do
          requires :id, type: Integer
        end
        put '/:id', serializer: ::MunicipeSerializer do
          set_municipe
          municipe = ::MunicipeEditService.new(@municipe, params).edit_municipe_service

          if municipe.is_a?(::Municipe)
            present municipe
          else
            error!(municipe[:errors], :bad_request)
          end
        end

        desc "edit to municipe"
        params do
          requires :id, type: Integer
          requires :status, type: Boolean
        end
        patch ':id/update_status', serializer: ::MunicipeSerializer do
          set_municipe
          municipe = MunicipeUpdateStatusService.new(@municipe, permitted_params[:status]).call

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
