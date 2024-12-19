module SdkRuby
    class KSCredentials
      attr_accessor :organization_id, :instance_id, :api_key, :host
  
      def initialize(api_key, organization_id = "", instance_id = "", host = "")
        @organization_id = ENV['ORGANIZATION_ID'] || ""
        @instance_id = ENV['INSTANCE_ID'] || ""
        @api_key = ENV['API_KEY'] || ""
        @host = ENV['API_HOST'] || ""
      end
    end
  end
  