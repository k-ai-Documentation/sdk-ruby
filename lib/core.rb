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

        def download_file(file_id)
            p "Launching file download..."
            response = httpx_post("/api/orchestrator/files/download", { id: file_id })
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        def differential_indexation
            p "Launching differential indexation..."
            response = httpx_post("/api/orchestrator/differential-indexation")
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        def last_indexation
            p "Get last indexation launch..."
            response = httpx_post("/api/orchestrator/last-indexation")
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        def list_indexed_documents
            p "Get list of indexed documents launch..."
            response = httpx_post("/api/orchestrator/list-indexed-documents")
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
        def httpx_post(endpoint, payload = nil)
            url = "#{@api_handler.base_url}#{endpoint}"
            if payload
                response = HTTPX.post(url, headers: @api_handler.headers, json: payload)
            else
                response = HTTPX.post(url, headers: @api_handler.headers)
            end
            response
        end

        def handle_response(response)
            if response.status == 200
                response.json
            else
                puts "API error: #{response.status} - #{response.body.to_s}"
                nil
            end
        end

    end
end
