require 'httparty'

module SdkRuby
  class ApiHandler
    include HTTParty

    def initialize(credentials)
      @credentials = credentials
      @base_url = build_base_url
      @headers = build_headers
    end

    def get(endpoint, params = {})
      response = self.class.get("#{@base_url}#{endpoint}", query: params, headers: @headers)
      handle_response(response)
    end

    def post(endpoint, body)
      response = self.class.post("#{@base_url}#{endpoint}", body: body.to_json, headers: @headers)
      handle_response(response)
    end

    def headers
      @headers
    end
    def base_url
      @base_url
    end

    private

    def build_headers
      headers = { 'api-key' => @credentials.api_key }

      if @credentials.organization_id
        headers['organization-id'] = @credentials.organization_id
      end

      if @credentials.instance_id
        headers['instance-id'] = @credentials.instance_id
      end

      # Si un hôte personnalisé est spécifié, ajouter dans le header aussi
      if @credentials.host && !@credentials.host.empty?
        headers['host'] = @credentials.host
      end

      headers
    end

    def build_base_url
      # Vérifier si le host est défini et non vide
      if @credentials.host && !@credentials.host.empty?
        @credentials.host
      elsif @credentials.organization_id && @credentials.instance_id
        # Si @credentials.host n'est pas défini, utiliser la méthode de fallback
        "https://api.kai-studio.ai"
      else
        # Si aucune donnée n'est fournie, lever une exception pour prévenir de l'erreur
        raise "Erreur: Host, organization_id ou instance_id sont manquants dans les credentials."
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
