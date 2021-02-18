# rubocop:disable ClassAndModuleChildren
module Helpers
  # rubocop:enable ClassAndModuleChildren
  module JsonHelpers
    def response_body
      JSON.parse(last_response.body)
    end

    def response_status_code
      last_response.status.to_i
    end

    def response_errors
      last_response.errors
    end

    def response_headers
      JSON.parse(last_response.headers)
    end
  end
end
