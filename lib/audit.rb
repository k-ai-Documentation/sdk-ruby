require 'httpx'

module SdkRuby
    class Audit
        def initialize(api_handler)
            @api_handler = api_handler
        end

        # Obtenir des informations sur les conflits
        def get_conflict_information(limit = 20, offset = 0)
            p "Launch get_conflict_information..."
            response = httpx_post("/api/audit/conflict-information", { json: { limit: limit, offset: offset } })
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        # Obtenir des informations sur les doublons
        def get_duplicated_information(limit = 20, offset = 0)
            p "Launch get_duplicated_information..."
            response = httpx_post("/api/audit/duplicated-information", { json: { limit: limit, offset: offset } })
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        # Mettre un conflit comme géré
        def set_conflict_managed(information_id)
            p "Launch set_conflict_managed..."
            response = httpx_post("/api/audit/conflict-information/set-managed", { json: { id: information_id } })
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        # Mettre un doublon comme géré
        def set_duplicated_information_managed(information_id)
            p "Launch set_duplicated_information_managed..."
            response = httpx_post("/api/audit/duplicated-information/set-managed", { json: { id: information_id } })
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        # Obtenir les documents à gérer
        def get_documents_to_manage(limit = 20, offset = 0)
            p "Launch get_documents_to_manage..."
            response = httpx_post("/api/audit/documents-to-manage", { json: { limit: limit, offset: offset } })
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        # Obtenir les sujets manquants
        def get_missing_subjects(limit = 20, offset = 0)
            p "Launch get_missing_subjects..."
            response = httpx_post("/api/audit/missing-subjects", { json: { limit: limit, offset: offset } })
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
