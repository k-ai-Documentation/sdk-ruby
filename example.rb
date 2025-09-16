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

## Call the count_documents method in Document to test
## First initialize with api_handler and credentials
document = SdkRuby::Document.new(api_handler)
puts "Begin tests..."
begin
      response = document.list_docs(limit = 3, offset = 0, state = "")
      p "Réponse de l'API: #{response['response'].size}"
      p "Réponse de l'API: #{response['response'].first}"

      p document.count_documents_by_state("INDEXED")
      # 
rescue => e
  puts "Erreur lors de l'appel API: #{e.message}"
end

## Methods in Documents
## Get documents'list
# document.list_docs(limit = 2, offset = 0, state = "")
## Get a document’s information
# document.get_doc_information("Sharepoint::012KVC2QVJX6FVHMW46")
## Get multiple documents by ID
# document.get_doc_by_ids(["GENERIC::memorice-search::02abb178-ccbb-40de-8413-bbd840fd7578", "GENERIC::memorice-search::02bb261d-8857-42b1-8a8c-94e6750ecd16"])
## Get documents count with state variable
# document.count_documents_by_state("INDEXED")

## Methods in Core / Orchestrator
## First initialize with api_handler and credentials
# core = SdkRuby::Core.new(api_handler)
## Methodes de Core / Orchestrator
# core.differential_indexation
# core.reindex_document("Sharepoint::012KVC2QVJX6FVHMW46")
# core.retry_parsing_error_indexation
# core.count_back_tasks
# core.get_doc_back_tasks("Sharepoint::012KVC2QVJX6FVHMW46")


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
# Then call the methods
# Perform a search
# p search.query("Qu'est ce que l'odorisation des gaz ?","Test direct from API - Nicolas Chevalet")
## Count the queries made
# p search.count_done_requests
## Count the queries made per day for a given period
# p search.count_done_requests_by_date(begin_date = "2025-06-02", end_date = "2025-09-22")

## Count the queries made that had responses
# p search.count_answered_done_requests
## Count the queries made per day for a given period
# p search.count_answered_done_requests_by_date("2025-07-02","2025-09-04")
## Get the most recent queries
# p search.get_requests_to_api(3, 0)

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