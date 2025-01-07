require 'httpx'

module SdkRuby
    class Search
        def initialize(api_handler)
            @api_handler = api_handler
        end

        # Effectuer une requête de recherche
        def query(query, user, impersonate, multi_documents, need_following_questions)
            p "Launch search query..."
            response = httpx_post("/api/search/query", { json: {
                "query" => query,
                "user" => user,
                "impersonate" => impersonate,
                "multiDocuments" => multi_documents,
                "needFollowingQuestions" => need_following_questions
            } })
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        # Obtenir la signature d'un document
        def get_doc_signature(doc_id)
            p "Launch get_doc_signature..."
            response = httpx_post("/api/search/doc", { json: { "id" => doc_id } })
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        # Obtenir les documents par ID
        def get_doc_ids(doc_ids)
            p "Launch get_doc_ids..."
            response = httpx_post("/api/search/docs", { json: { "docsIds" => doc_ids } })
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        # Compter les requêtes effectuées
        def count_done_requests
            p "Launch count_done_requests..."
            p response = httpx_post("/api/search/stats/count-search", {})
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        # Compter les requêtes répondues
        def count_answered_done_requests
            p "Launch count_answered_done_requests..."
            response = httpx_post("/api/search/stats/count-answered-search", {})
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        # Obtenir les requêtes API avec un certain limite et offset
        def get_requests_to_api(limit, offset)
            p "Launch get_requests_to_api..."
            response = httpx_post("/api/search/stats/list-search", { json: { "limit" => limit, "offset" => offset } })
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        # Identifier un document spécifique à partir d'une conversation
        def identify_specific_document(conversation)
            p "Launch identify_specific_document..."
            response = httpx_post("/api/search/identify-specific-document", { json: { "conversation" => conversation } })
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        # Obtenir la version de l'API
        def get_version
            p "Launch get_version..."
            response = httpx_post("/version", {})
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
