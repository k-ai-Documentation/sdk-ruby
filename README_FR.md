# KAI SDK Ruby

Ce SDK permet d'interagir avec l'API KAI. Il est écrit en Ruby et facilite les opérations suivantes avec l'API de KAI :
- Fonctions liées au module Search et l'add-on conversation (chatbot)
- Fonctions liées au module Audit
- Fonctions liées à l'instance global : Core
- Fonctions liées à la gestion des données du graphe sémantique

Pour plus d'informations : 
Visitez notre site : https://k-ai.ai/
et pour toute la documentation : https://k-ai.gitbook.io/knowledge-ai

## Installation
Pour utiliser ce SDK, clonez ce dépôt et utilisez-le dans votre projet Ruby :

Ajouter la gem dans le Gemfile dans votre projet

```bash
gem 'sdk_ruby', git: 'https://github.com/k-ai-Documentation/sdk-ruby'
```

ou si vous utilisez SSH :
```bash
gem 'sdk_ruby', git: 'git@github.com:k-ai-Documentation/sdk-ruby.git'
```

Puis
```bash
bundle install
```

Le SDK sera installé dans le répertoire vendor/bundle ou dans les gems système, selon la configuration.


## Utilisation
### Intégrer le SDK dans votre projet
Une fois la gem installée, vous pouvez utiliser le SDK comme avec une gem Ruby classique. Par exemple, dans un fichier main.rb de votre projet, l'utiliser ainsi :

```bash
require 'sdk_ruby'

# Initialiser les credentials
credentials = SdkRuby::KSCredentials.new("API_KEY", "Organization_ID", "Instance_ID")

# Création de l'instance de ApiHandler
api_handler = SdkRuby::ApiHandler.new(credentials)

# Tester la fonctionnalité "Hello" du SDK
p SdkRuby::KS.hello
# cela affichera "Welcome on KAI's Ruby SDK!""

# Exemple d'appel à une fonction du module Audit
audit = SdkRuby::Audit.new(api_handler)
audit.get_conflict_information(limit = 5, offset = 0)

```

### Exemples
Le fichier example.rb vous fournit une liste complète des fonctions disponibles et leur utilisation.