require_relative "version"
require_relative "ks_credentials"
require_relative "api_handler"
require_relative 'core'
# require_relative 'audit'
# require_relative 'search'
# require_relative 'semantic-graph'

module SdkRuby
    class KS
      attr_accessor :core
      # attr_accessor :audit
      # attr_accessor :search
      # attr_accessor :semantic_graph
  
      # Initialisation du SDK avec les credentials
      def initialize(credentials = nil)
          credentials ||= KSCredentials.new
          @api_handler = ApiHandler.new(credentials)
          # Initialisation 
          @core = Core.new(@api_handler)
          # @audit = Audit.new(@api_handler)
          # @search = Search.new(@api_handler)
          # @semantic_graph = SemanticGraph.new(@api_handler)
      end
      def self.hello
        "Hello from MyRubySDK!"
      end
    end
  end