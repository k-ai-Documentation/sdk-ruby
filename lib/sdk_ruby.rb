require_relative "version"
require_relative "ks_credentials"
require_relative "api_handler"
require_relative 'core'
require_relative 'audit'
require_relative 'search'
require_relative 'semantic_graph'

module SdkRuby
    class KS
      def self.hello
        "Welcome on KAI's Ruby SDK!"
      end
    end
  end