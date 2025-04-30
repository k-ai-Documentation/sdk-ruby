require 'httpx'
# require 'async'

module SdkRuby
    class Core
        def initialize(api_handler)
            @api_handler = api_handler
        end
  
        def count_documents_by_state(state = "")
            p "Launch count documents by state..."
            response = httpx_post("/api/core/count-documents-by-state", { state: state } )
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        # def count_documents
        #     p "Launch count documents..."
        #     response = httpx_post("/api/orchestrator/stats/count-documents")
        #     handle_response(response)
        # rescue => e
        #     puts "An error has occurred while processing your query: #{e.message}"
        #     nil
        # end

        # def count_indexable_documents
        #     p "Launch count indexable documents..."
        #     response = httpx_post("/api/orchestrator/stats/count-indexable-documents")
        #     handle_response(response)
        # rescue => e
        #     puts "An error has occurred while processing your query: #{e.message}"
        #     nil
        # end

        # def count_indexed_documents
        #     p "Launch count indexed documents..."
        #     response = httpx_post("/api/orchestrator/stats/count-indexed-documents")
        #     handle_response(response)
        # rescue => e
        #     puts "An error has occurred while processing your query: #{e.message}"
        #     nil
        # end

        # def count_detected_documents
        #     p "Launch count detected documents..."
        #     response = httpx_post("/api/orchestrator/stats/count-detected-documents")
        #     handle_response(response)
        # rescue => e
        #     puts "An error has occurred while processing your query: #{e.message}"
        #     nil
        # end

        # def count_in_progress_documents
        #     p "Launch count documents with pending indexation..."
        #     response = httpx_post("/api/orchestrator/stats/count-inprogress-indexation-documents")
        #     handle_response(response)
        # rescue => e
        #     puts "An error has occurred while processing your query: #{e.message}"
        #     nil
        # end

        # Getting a document's signature
        def get_doc_signature(doc_id)
            p "Launch get_doc_signature..."
            response = httpx_post("/api/orchestrator/doc", { id: doc_id } )
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        # Get documents by ID
        def get_doc_ids(doc_ids)
            p "Launch get_doc_ids..."
            response = httpx_post("/api/orchestrator/docs", { "docsIds" => doc_ids })
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        def list_docs(limit = 20, offset = 0, state = "")
            p "List all documents..."
            response = httpx_post("/api/orchestrator/list-docs", { limit: limit, offset: offset, state: state })
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        # No more used
        # def list_indexed_documents(limit = 100, offset = 0)
        #     p "Get list of indexed documents launch..."
        #     response = httpx_post("/api/orchestrator/list-indexed-documents", { limit: limit, offset: offset })
        #     handle_response(response)
        # rescue => e
        #     puts "An error has occurred while processing your query: #{e.message}"
        #     nil
        # end

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

        def last_finished_indexation
            p "Get last finished indexation ..."
            response = httpx_post("/api/orchestrator/last-finished-indexation")
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        def check_pending_job
            p "Check pending jobs ..."
            response = httpx_post("/api/orchestrator/check-pending-job")
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

        # # Obtenir la version de l'API
        # def version
        #     p "Get version of service kai-api..."
        #     response = httpx_post("/version", {})
        #     handle_response(response)
        # rescue => e
        #     puts "An error has occurred while processing your query: #{e.message}"
        #     nil
        # end

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
