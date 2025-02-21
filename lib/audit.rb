require 'httpx'

module SdkRuby
    class Audit
        def initialize(api_handler)
            @api_handler = api_handler
        end

        # Obtain information on conflicts
        def get_conflict_information(limit = 20, offset = 0)
            p "Launch get_conflict_information..."
            response = httpx_post("/api/audit/conflict-information", { limit: limit, offset: offset })
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        # Put a conflict as managed
        def set_conflict_managed(information_id)
            p "Launch set_conflict_managed..."
            response = httpx_post("/api/audit/conflict-information/set-managed", { id: information_id })
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

            # Set a conflict new state
            def conflict_information_set_state(information_id, state)
                p information_id
                p state
                p "Launch set_state for conflict_information..."
                response = httpx_post("/api/audit/conflict-information/set-state", { id: information_id, state: state })
                handle_response(response)
            rescue => e
                puts "An error has occurred while processing your query: #{e.message}"
                nil
            end

        # Get information about duplicates
        def get_duplicated_information(limit = 20, offset = 0)
            p "Launch get_duplicated_information..."
            response = httpx_post("/api/audit/duplicated-information", { limit: limit, offset: offset })
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        # Set a duplicate as managed
        def set_duplicated_information_managed(information_id)
            p "Launch set_duplicated_information_managed..."
            response = httpx_post("/api/audit/duplicated-information/set-managed", { id: information_id })
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

                # Set a duplicate new state
                def duplicated_information_set_state(information_id, state)
                    p "Launch set_state for duplicated_information..."
                    response = httpx_post("/api/audit/duplicated-information/set-state", { id: information_id, state: state })
                    handle_response(response)
                rescue => e
                    puts "An error has occurred while processing your query: #{e.message}"
                    nil
                end

        # Obtain the documents'list to be managed
        def get_documents_to_manage(limit = 20, offset = 0)
            p "Launch get_documents_to_manage..."
            response = httpx_post("/api/audit/documents-to-manage", { limit: limit, offset: offset })
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        # Get the missing topics from previous queries
        def get_missing_subjects(limit = 20, offset = 0)
            p "Launch get_missing_subjects..."
            response = httpx_post("/api/audit/missing-subjects", { limit: limit, offset: offset })
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        # Get the conflicts for a given document
        def get_anomalies_for_document(doc_id)
            p "Launch get_anomalies_for_document..."
            response = httpx_post("/api/audit/get-anomalies-for-document", { docId: doc_id })
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        # Count the conflicts
        def count_conflict_information
            p "Launch count_conflicts..."
            response = httpx_post("/api/audit/count-conflict-information", {})
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        # Count the duplications
        def count_duplicated_information
            p "Launch count_duplicated_information..."
            response = httpx_post("/api/audit/count-duplicated-information", {})
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        # Count the missing subjects
        def count_missing_subjects
            p "Launch count_missing_subjects..."
            response = httpx_post("/api/audit/count-missing-subjects", {})
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        private

        def httpx_post(endpoint, payload)
            url = "#{@api_handler.base_url}#{endpoint}"
            response = HTTPX.post(url, headers: @api_handler.headers, json: payload)
            # p response
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
