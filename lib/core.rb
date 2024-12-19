require 'httpx'

module SdkRuby
    class Core
        def initialize(api_handler)
            @api_handler = api_handler
        end
  
        # Méthode pour compter les documents de manière asynchrone
        def count_documents
        response = httpx_post("/api/orchestrator/stats/count-documents")
        response 
        end

        private

        # Effectuer une requête POST avec HTTPX
        def httpx_post(endpoint)
        client = HTTPX.plugin(:async)

        # Construction de l'URL complète avec le base_url de ApiHandler
        url = "#{@api_handler.base_url}#{endpoint}"

        # Faire une requête POST asynchrone
        client.post(url, headers: @api_handler.headers) do |response|
            if response.status == 200
            return response.json
            else
            return response.body.to_s  # Ou renvoyer message d'erreur
            end
        end
        rescue => e
        puts "Erreur : #{e.message}"
        nil
        end
  end
end
