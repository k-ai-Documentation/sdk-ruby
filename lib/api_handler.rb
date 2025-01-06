require 'httparty'

module SdkRuby
  class ApiHandler
    include HTTParty

    def initialize(credentials)
      @credentials = credentials
      @base_url = build_base_url
      @headers = { 'api-key' => @credentials.api_key }
    end

    def get(endpoint, params = {})
      response = self.class.get("#{@base_url}#{endpoint}", query: params, headers: @headers)
      handle_response(response)
    end

    def post(endpoint, body)
      response = self.class.post("#{@base_url}#{endpoint}", body: body.to_json, headers: @headers)
      handle_response(response)
    end

    private

    def build_base_url
      if @credentials.host
        @credentials.host
      else
        "https://#{@credentials.organization_id}.kai-studio.ai/#{@credentials.instance_id}/"
      end
    end

    def handle_response(response)
      if response.success?
        response.parsed_response
      else
        raise "Erreur API: #{response.code} - #{response.message}"
      end
    end
  end
end
