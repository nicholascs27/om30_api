module API
  class Base < Grape::API
    prefix 'api'

    default_format :json
    format :json
    formatter :json, Grape::Formatter::ActiveModelSerializers

    mount API::V1::Base
  end
end
