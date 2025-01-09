require_relative "lib/version"

Gem::Specification.new do |spec|
    spec.name          = "kai_sdk_ruby"
    spec.version       = SdkRuby::VERSION
    spec.authors       = ["NC-KAI"]
    spec.email         = ["nchevalet@k-ai.ai"]
  
    spec.summary       = "Un SDK pour interagir avec l'API KAI"
    spec.description   = "Ce SDK permet d'interagir avec l'API de KAI pour faciliter les intégrations."
    spec.homepage      = "https://github.com/nchevalet-KAI/sdk-ruby"
    spec.license       = "MIT"
  
    spec.files         = Dir["lib/**/*.rb"]
    spec.require_paths = ["lib"]
  
    spec.add_dependency "httparty"  # Ajout de la dépendance HTTParty
    spec.add_dependency "httpx"
    spec.add_dependency "async"
    spec.add_dependency "json", "~> 2.5"
    spec.add_dependency "dotenv", "~> 2.7"
  
    # Définir les versions de Ruby supportées
    spec.required_ruby_version = ">= 2.6.0"
  end
  