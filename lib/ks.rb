require 'ks_credentials'
require 'api_handler'
require 'core'
# require 'audit'
# require 'search'
# require 'semantic-graph'

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
  end
end
