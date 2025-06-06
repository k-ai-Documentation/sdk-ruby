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
# core = SdkRuby::Core.new(api_handler)
puts "Begin tests..."
begin
      # response = core.list_docs(limit = 3, offset = 0, state = "")
      # p "Réponse de l'API: #{response['response'].size}"
      # p "Réponse de l'API: #{response['response'].first(3)}"

      # response2 = core.list_indexed_documents(limit = 100, offset = 0)
      # p "Réponse 2 de l'API: #{response2['response'].size}"
      # p "Réponse 2 de l'API: #{response2['response'].first(3)}"

      # p core.global_health
      # p core.health 
rescue => e
  puts "Erreur lors de l'appel API: #{e.message}"
end

## Other methods in Core
# core.count_documents_by_state("INDEXED")

## Get a document’s signature
# p core.get_doc_signature("Sharepoint::01EWFXH5RRVV4F3G62KVC2QVJX6FVHMW46")
## Get multiple documents by ID
# core.get_doc_ids(["doc_id_123", "doc_id_456"])

# p core.list_docs(limit = 100, offset = 0, state = "")
# core.differential_indexation
# core.check_pending_job
# core.last_indexation
# core.last_finished_indexation
# core.global_health
# core.health
# core.version

## Call the audit methods, some examples
## First initialize with api_handler and credentials
#  audit = SdkRuby::Audit.new(api_handler)
## Then call the methods
# p audit.get_conflict_information(limit = 1, offset = 0)
# p audit.get_conflict_information(limit = 5, offset = 0, query = "Document Purpose")
# p audit.conflict_information_set_state("103K95MB_KTK57Ts58Yr", "ignored")
# audit.set_conflict_managed(1)
# p audit.get_conflict_information(limit = 1, offset = 0)
# 
# p audit.get_duplicated_information(limit = 2, offset = 1, query = "URL")
# audit.duplicated_information_set_state(2, "managed")
# audit.set_duplicated_information_managed(1)
# audit.get_documents_to_manage(2, 0)
# audit.get_missing_subjects(30, 0)
# audit.count_conflict_information
# audit.count_conflict_information_by_date(begin_date, end_date)
# audit.count_duplicated_information
# audit.count_duplicated_information_by_date(begin_date, end_date)

# audit.count_missing_subjects
# p audit.get_anomalies_for_document("Sharepoint::01EWFXH5RRVV4F3G62KVC2QVJX6FVHMW46")["response"].first

# Example of calling Search methods
# search = SdkRuby::Search.new(api_handler)
## Then call the methods
## Perform a search
# search.query("UPS", "user123", false, true, false)
## Identify a specific document from a conversation
# conversation = [{ "from" => "user", "message" => "how many tires tires were produced in 2018 ?"}]
# search.identify_specific_document(conversation)
## Count the queries made
# search.count_done_requests
## Count the queries made per day for a given period
# search.count_done_requests_by_date("2025-03-02","2025-04-22")
## Count the queries made that had responses
# search.count_answered_done_requests
## Count the queries made per day for a given period
# search.count_answered_done_requests_by_date("2025-05-02","2025-06-04")
## Get the most recent queries
# search.get_requests_to_api(3, 0)

# Methods related to the Chatbot methods
# chatbot = SdkRuby::Chatbot.new(api_handler)
# Then call the methods
# Launch or continue a conversation
# chatbot.message("What is the maximum weight limit for packages ?", "sdk_demo_user", false)
# Get a conversation in details
# chatbot.get_conversation("n0g2rZQBw6MiAeQpGbLO")

# Methods related to the semantic graph
# First initialize with api_handler and credentials
# semantic_graph = SdkRuby::SemanticGraph.new(api_handler)
# Then call the methods
# p semantic_graph.get_nodes(limit = 5, offset = 0)
# semantic_graph.get_linked_nodes(1)
# semantic_graph.get_nodes_by_label("UPS")
# p semantic_graph.identify_nodes("fabien barthez", true)