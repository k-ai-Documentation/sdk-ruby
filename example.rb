require 'dotenv/load' # Charger les variables d'environnement
require_relative 'lib/sdk_ruby'

# Initialiser les credentials et l'instance KS
# Mettre ses identifiants dans un fichier .env
credentials = SdkRuby::KSCredentials.new(
  ENV['API_KEY'], 
  ENV['ORGANIZATION_ID'], 
  ENV['INSTANCE_ID'], 
  ENV['API_HOST'] 
)

# Création de l'instance de ApiHandler
api_handler = SdkRuby::ApiHandler.new(credentials)


# TESTS ET EXAMPLES
# Tester la méthode hello
puts SdkRuby::KS.hello

# Appel à la méthode count_documents dans Core pour tester
# core = SdkRuby::Core.new(api_handler)
# puts "Compter les documents..."
# begin
#     response = core.count_indexable_documents
#     p "Réponse de l'API: #{response['response']}"

# rescue => e
#   puts "Erreur lors de l'appel API: #{e.message}"
# end

# Appel aux méthodes d'audit, quelques examples
# audit = SdkRuby::Audit.new(api_handler)
# audit.get_conflict_information(limit = 5, offset = 0)
# audit.set_conflict_managed(1)
# audit.get_duplicated_information(limit = 20, offset = 0)
# audit.set_duplicated_information_managed(1)
# audit.get_documents_to_manage(10, 0)
# audit.get_missing_subjects(30, 0)

# Exemple d'appel de methodes de Search : 
# search = SdkRuby::Search.new(api_handler)
# # Effectuer une recherche
# search.query("UPS", "user123", false, true, false)
# # Obtenir la signature d'un document
# search.get_doc_signature("doc_id_123")
# # Obtenir plusieurs documents par ID
# search.get_doc_ids(["doc_id_123", "doc_id_456"])
# # Compter les requêtes effectuées
# search.count_done_requests
# # Compter les requêtes effectuées ayant eu des réponses
# search.count_answered_done_requests
# # Obtenir les dernières requêtes effectuées
# search.get_requests_to_api(3, 0)
# # Identifier un document spécifique à partir d'une conversation
# conversation = [{ "from" => "user", "message" => "how many tires tires were produced in 2018 ?"}]
# search.identify_specific_document(conversation)

# Méthodes liées au graph sémantique
# semantic_graph = SdkRuby::SemanticGraph.new(api_handler)
# semantic_graph.get_nodes(limit = 5, offset = 0)
# semantic_graph.get_linked_nodes(1)
# semantic_graph.get_nodes_by_label("UPS")
# semantic_graph.identify_nodes("United Parcel Service")