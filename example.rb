require 'dotenv/load' # Load environment variables from the .ENV file
require_relative 'lib/kai_sdk_ruby' #Load the sdk

# Initialize the credentials and the KS instance. (Don't forget to put your credentials in an .env file)
credentials = SdkRuby::KSCredentials.new(
  ENV['API_KEY'], 
  ENV['ORGANIZATION_ID'], 
  ENV['INSTANCE_ID'], 
  ENV['API_HOST'] 
)

# Create the ApiHandler instance
api_handler = SdkRuby::ApiHandler.new(credentials)

## TESTS AND EXAMPLES
## Test the hello method
puts SdkRuby::KS.hello + SdkRuby::VERSION

## Call the count_documents method in Core to test
## First initialize with api_handler and credentials
core = SdkRuby::Core.new(api_handler)
## puts "Compter les documents..."
# begin
      ##   Then call the methods
      # response = core.count_indexable_documents
      # p "Réponse de l'API: #{response['response']}"
# rescue => e
#   puts "Erreur lors de l'appel API: #{e.message}"
# end

## Other methods in Core
# core.count_documents
# core.count_indexed_documents
# core.count_detected_documents
# core.list_docs
# core.differential_indexation
# core.global_health
# core.health
# core.version

## Call the audit methods, some examples
## First initialize with api_handler and credentials
# audit = SdkRuby::Audit.new(api_handler)
## Then call the methods
# audit.get_conflict_information(limit = 5, offset = 0)
# audit.set_conflict_managed(1)
# audit.get_duplicated_information(limit = 20, offset = 0)
# audit.set_duplicated_information_managed(1)
# audit.get_documents_to_manage(10, 0)
# audit.get_missing_subjects(30, 0)

# Example of calling Search methods
# search = SdkRuby::Search.new(api_handler)
## Then call the methods
## Perform a search
# search.query("UPS", "user123", false, true, false)
## Identify a specific document from a conversation
# conversation = [{ "from" => "user", "message" => "how many tires tires were produced in 2018 ?"}]
# search.identify_specific_document(conversation)
## Get a document’s signature
# search.get_doc_signature("doc_id_123")
## Get multiple documents by ID
# search.get_doc_ids(["doc_id_123", "doc_id_456"])
## Count the queries made
# search.count_done_requests
## Count the queries made that had responses
# search.count_answered_done_requests
## Get the most recent queries
# search.get_requests_to_api(3, 0)

# Methods related to the semantic graph
## First initialize with api_handler and credentials
# semantic_graph = SdkRuby::SemanticGraph.new(api_handler)
## Then call the methods
# semantic_graph.get_nodes(limit = 5, offset = 0)
# semantic_graph.get_linked_nodes(1)
# semantic_graph.get_nodes_by_label("UPS")
# semantic_graph.identify_nodes("United Parcel Service")