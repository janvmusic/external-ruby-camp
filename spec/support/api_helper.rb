# rubocop:disable ClassAndModuleChildren
module Helpers
  # rubocop:enable ClassAndModuleChildren
  module ApiHelpers
    include Rack::Test::Methods

    def app
      Rails.application
    end
  end
end
