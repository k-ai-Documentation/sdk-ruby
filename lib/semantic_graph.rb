require 'httpx'

module SdkRuby
    class SemanticGraph
        def initialize(api_handler)
            @api_handler = api_handler
        end

        # Obtenir des informations sur les nodes
        def get_nodes(limit = 20, offset = 0)
            p "Launch list of relationships between nodes..."
            response = httpx_post("/api/semantic-graph/nodes", { limit: limit, offset: offset })
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        # Mettre un conflit comme géré
        def get_linked_nodes(information_id)
            p "Launch get linked nodes to an id..."
            response = httpx_post("/api/semantic-graph/linked-nodes", { id: information_id })
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        # Obtenir des informations sur les nodes ayant le nom exact donné
        def get_nodes_by_label(label)
            p "Launch get node by label..."
            response = httpx_post("/api/semantic-graph/nodes-by-label", { label: label })
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        # Obtenir des informations sur les nodes à partir d'un mot
        def identify_nodes(query)
            p "Search node from a query..."
            response = httpx_post("/api/semantic-graph/identify-nodes", { query: query })
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        private

        # Méthode générique pour envoyer les requêtes POST
        def httpx_post(endpoint, payload)
            url = "#{@api_handler.base_url}#{endpoint}"

            # Effectuer la requête HTTP POST de manière synchrone
            response = HTTPX.post(url, headers: @api_handler.headers, json: payload)
            response
        end

        # Gérer la réponse de l'API
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
