require 'httpx'

module SdkRuby
    class Search
        def initialize(api_handler)
            @api_handler = api_handler
        end

        # Perform a search query
        def query(query, user, impersonate, multi_documents, need_following_questions)
            p "Launch search query..."
            response = httpx_post("/api/search/query", {
                "query" => query,
                "user" => user,
                "impersonate" => impersonate,
                "multiDocuments" => multi_documents,
                "needFollowingQuestions" => need_following_questions
            })
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        # Count the requests made
        def count_done_requests
            p "Launch count_done_requests..."
            response = httpx_post("/api/search/stats/count-search", {})
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        # Count the requests made
        def count_done_requests_by_date(begin_date, end_date)
            p "Launch historic count_done_requests..."
            response = httpx_post("/api/search/count-search-by-date",{ "beginDate": begin_date, "endDate": end_date })
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        # Count answered queries
        def count_answered_done_requests
            p "Launch count_answered_done_requests..."
            response = httpx_post("/api/search/stats/count-answered-search", {})
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        # Get API requests with a given limit and offset
        def get_requests_to_api(limit, offset)
            p "Launch get_requests_to_api..."
            response = httpx_post("/api/search/stats/list-search", { "limit" => limit, "offset" => offset })
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        # Identify a specific document from a conversation
        def identify_specific_document(conversation)
            p "Launch identify_specific_document..."
            response = httpx_post("/api/search/identify-specific-document", { "conversation" => conversation })
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end


        private

        # Generic method for sending POST requests
        def httpx_post(endpoint, payload)
            url = "#{@api_handler.base_url}#{endpoint}"
            # Perform HTTP POST request synchronously
            response = HTTPX.post(url, headers: @api_handler.headers, form: payload)
            response
        end

        # Handle API response
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
