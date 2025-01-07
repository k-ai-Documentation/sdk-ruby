require 'httpx'

module SdkRuby
    class Core
        def initialize(api_handler)
            @api_handler = api_handler
        end
  
        def count_documents
            p "Launch count documents..."
            response = httpx_post("/api/orchestrator/stats/count-documents")
            if response
                response
            else
                puts "An error has occurred while processing your request."
            end
        end
    
        private
        def httpx_post(endpoint)
            # Utilisation de HTTPX de manière synchrone (sans plugin async)
            url = "#{@api_handler.base_url}#{endpoint}"
      
            # Faire la requête POST de manière synchrone
            response = HTTPX.post(url, headers: @api_handler.headers)

            # Affichage détaillé de la réponse avant de la traiter
            # puts "Réponse brute de HTTPX : #{response.inspect}"

            if response.is_a?(HTTPX::ErrorResponse)
                # Si c'est une erreur, afficher les détails complets
                puts "An error has occurred while processing your API request : #{response.inspect}"
                return nil
            elsif response.is_a?(HTTPX::Response)
                # Si c'est une réponse réussie, on traite comme prévu
                if response.status == 200
                return response.json
                else
                puts "API error : #{response.status} - #{response.body}"
                return nil
                end
            else
                # Si ce n'est ni un ErrorResponse ni un Response valide
                puts "Response not expected : #{response.inspect}"
                return nil
            end
            

        rescue => e
        puts "An error has occurred while processing your query : #{e.message}"
        nil
        end

        def async_httpx_post(endpoint)
            # Utilisation du plugin :async
            client = HTTPX.plugin(:async)
        
            url = "#{@api_handler.base_url}#{endpoint}"
        
            client.post(url, headers: @api_handler.headers) do |response|
                if response.status == 200
                response.json
                else
                "API error: #{response.status} - #{response.body.to_s}"
                end
            end
            rescue => e
            puts "An error has occurred while processing your query : #{e.message}"
            nil
        end
    end
end
