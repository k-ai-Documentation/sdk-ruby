require 'httpx'

module SdkRuby
    class Chatbot
        def initialize(api_handler)
            @api_handler = api_handler
        end

        def message(user_message, user_id, multi_documents, conversation_id)
            p "Launch message..."
            response = httpx_post("/api/chatbot/message", {
                "user_message" => user_message,
                "user_id" => user_id,
                "multiDocuments" => multi_documents,
                "id" => conversation_id
            })
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        def get_conversation(conversation_id)
            p "Launch get_conversation..."
            response = httpx_post("/api/chatbot/get-conversation", { "id" => conversation_id } )
            handle_response(response)
        rescue => e
            puts "An error has occurred while processing your query: #{e.message}"
            nil
        end

        private

        # Generic method for sending POST requests
        def httpx_post(endpoint, payload)
            url = "#{@api_handler.base_url}#{endpoint}"
            response = HTTPX.post(url, headers: @api_handler.headers, form: payload)
            response
        end

        # Handle API response
        def handle_response(response)
            if response.status == 200
                p response.json
            else
                puts "API error: #{response.status} - #{response.body.to_s}"
                nil
            end
        end
    end
end
