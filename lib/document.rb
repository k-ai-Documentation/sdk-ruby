require 'httpx'
# require 'async'

module SdkRuby
    class Document
        def initialize(api_handler)
            @api_handler = api_handler
        end
        
        # Get documents list
        def list_docs(limit = 50, offset = 0, state = "")
            p "List all documents..."
            response = httpx_post("/api/document/list-docs", { limit: limit, offset: offset, state: state })
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        # Getting a document's information
        def get_doc_information(doc_id)
            p "Launch get doc information..."
            response = httpx_post("/api/document/doc", { id: doc_id } )
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        def download_file(file_id)
            p "Launching file download..."
            response = httpx_post("/api/document/download", { id: file_id })
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        # Get documents by IDs
        def get_doc_by_ids(doc_ids)
            p "Launch get_doc_by_ids..."
            response = httpx_post("/api/document/docs-by-ids", { "ids": doc_ids })
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        def count_documents_by_state(state = "")
            p "Launch count documents by state..."
            response = httpx_post("/api/document/count-documents", { state: state } )
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
