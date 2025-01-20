require 'httpx'

module SdkRuby
    class SemanticGraph
        def initialize(api_handler)
            @api_handler = api_handler
        end

        # Get information about nodes
        def get_nodes(limit = 20, offset = 0)
            p "Launch list of relationships between nodes..."
            response = httpx_post("/api/semantic-graph/nodes", { limit: limit, offset: offset })
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        def get_linked_nodes(information_id)
            p "Launch get linked nodes to an id..."
            response = httpx_post("/api/semantic-graph/linked-nodes", { id: information_id })
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        # Get information about nodes with the given exact name
        def get_nodes_by_label(label)
            p "Launch get node by label..."
            response = httpx_post("/api/semantic-graph/nodes-by-label", { label: label })
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        # Get node information from a word
        def identify_nodes(query)
            p "Search node from a query..."
            response = httpx_post("/api/semantic-graph/identify-nodes", { query: query })
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        private

        def httpx_post(endpoint, payload)
            url = "#{@api_handler.base_url}#{endpoint}"
            response = HTTPX.post(url, headers: @api_handler.headers, json: payload)
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
