require 'httpx'
# require 'async'

module SdkRuby
    class Core
        def initialize(api_handler)
            @api_handler = api_handler
        end
  
        def count_documents
            p "Launch count documents..."
            response = httpx_post("/api/orchestrator/stats/count-documents")
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        def count_indexable_documents
            p "Launch count indexable documents..."
            response = httpx_post("/api/orchestrator/stats/count-indexable-documents")
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        def count_indexed_documents
            p "Launch count indexed documents..."
            response = httpx_post("/api/orchestrator/stats/count-indexed-documents")
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        def count_detected_documents
            p "Launch count detected documents..."
            response = httpx_post("/api/orchestrator/stats/count-detected-documents")
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        def list_docs
            p "List all indexed documents..."
            response = httpx_post("/api/orchestrator/list-docs")
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        # def download_file(file_id)
        #     p "Launching file download..."
        #     response = httpx_post("/api/orchestrator/files/download", { json: { id: file_id } })
        #     handle_response(response)
        # rescue => e
        #     puts "An error has occurred while processing your query: #{e.message}"
        #     nil
        # end

        def differential_indexation
            p "Launching differential indexation..."
            response = httpx_post("/api/orchestrator/differential-indexation")
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        def global_health
            p "Launching global server running stats..."
            response = httpx_post("/global-health")
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        def health
            p "Launching running status of the instance and api..."
            response = httpx_post("/health")
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        # Obtenir la version de l'API
        def version
            p "Get version of service kai-api..."
            response = httpx_post("/version", {})
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        private
        # def httpx_post(endpoint) #old version
        #     # Utilisation de HTTPX de manière synchrone (sans plugin async)
        #     url = "#{@api_handler.base_url}#{endpoint}"
      
        #     # Faire la requête POST de manière synchrone
        #     response = HTTPX.post(url, headers: @api_handler.headers)

        #     # Affichage détaillé de la réponse avant de la traiter
        #     # puts "Réponse brute de HTTPX : #{response.inspect}"

        #     if response.is_a?(HTTPX::ErrorResponse)
        #         # Si c'est une erreur, afficher les détails complets
        #         puts "An error has occurred while processing your API request : #{response.inspect}"
        #         return nil
        #     elsif response.is_a?(HTTPX::Response)
        #         # Si c'est une réponse réussie, on traite comme prévu
        #         if response.status == 200
        #         return response.json
        #         else
        #         puts "API error : #{response.status} - #{response.body}"
        #         return nil
        #         end
        #     else
        #         # Si ce n'est ni un ErrorResponse ni un Response valide
        #         puts "Response not expected : #{response.inspect}"
        #         return nil
        #     end
            

        # rescue => e
        # puts "An error has occurred while processing your query : #{e.message}"
        # nil
        # end

        # def async_httpx_post(endpoint, &callback)
        #     url = "#{@api_handler.base_url}#{endpoint}"
      
        #     # Effectuer la requête HTTP de manière asynchrone
        #     HTTPX.get(url, headers: @api_handler.headers) do |response|
        #       if response.status == 200
        #         # Appeler le callback avec la réponse JSON
        #         callback.call(response.json)
        #       else
        #         puts "API error: #{response.status} - #{response.body.to_s}"
        #         # Appeler le callback avec nil en cas d'erreur
        #         callback.call(nil)
        #       end
        #     end
        # end

        def httpx_post(endpoint, payload = nil)
            url = "#{@api_handler.base_url}#{endpoint}"

            # Effectuer la requête HTTP POST de manière synchrone
            if payload
                response = HTTPX.post(url, headers: @api_handler.headers, json: payload)
            else
                response = HTTPX.post(url, headers: @api_handler.headers)
            end
            response
        end

        def handle_response(response)

            # Async do |task|
            #     async_httpx_post("/api/orchestrator/stats/count-documents") do |result|
            #         if result
            #             puts "Réponse API : #{result}"
            #             # Traite la réponse comme nécessaire
            #         else
            #             puts "An error has occurred while processing your request."
            #         end
            #     end
            # end
            # Without async   

            if response.status == 200
                response.json
            else
                puts "API error: #{response.status} - #{response.body.to_s}"
                nil
            end
        end

    end
end
