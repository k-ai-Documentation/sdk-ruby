require 'dotenv/load' # Charger les variables d'environnement
require_relative 'lib/sdk_ruby'

# Initialiser les credentials et l'instance KS
credentials = SdkRuby::KSCredentials.new(
  ENV['API_KEY'], 
  ENV['ORGANIZATION_ID'], 
  ENV['INSTANCE_ID'], 
  ENV['API_HOST'] 
)

# Créer l'instance de ApiHandler
api_handler = SdkRuby::ApiHandler.new(credentials)
# Créer l'instance de KS avec ApiHandler

# Tester la méthode hello
puts SdkRuby::KS.hello

core = SdkRuby::Core.new(api_handler)
# Appel à la méthode count_documents pour tester
puts "Compter les documents..."
begin
    response = core.count_documents
    p "Réponse de l'API: #{response['response']}"

rescue => e
  puts "Erreur lors de l'appel API: #{e.message}"
end
