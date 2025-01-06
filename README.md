# Mon SDK Ruby

Ce SDK permet d'interagir avec l'API KAI. Il est écrit en Ruby et facilite les opérations suivantes :
- Fonction 1
- Fonction 2
- Fonction 3

## Installation
Pour utiliser ce SDK, clonez ce dépôt et utilisez-le dans votre projet Ruby :

a. Ajouter la gem dans le Gemfile dans votre projet

```bash
gem 'sdk_ruby', git: 'https://github.com/nchevalet-KAI/sdk_ruby.git'
```

ou si vous utilisez SSH :
```bash
gem 'sdk_ruby', git: 'git@github.com:nchevalet-KAI/sdk_ruby.git'
```

b. commande
```bash
cd sdk-ruby
bundle install
```

Le SDK sera installé dans le répertoire vendor/bundle ou dans les gems système, selon la configuration.


c. Utilisation du SDK dans le projet tiers
Une fois la gem installée, vous pouvez utiliser le SDK comme avec une gem Ruby classique. Par exemple, dans un fichier main.rb de votre projet, l'utiliser ainsi :

```bash
require 'sdk_ruby'

# Initialiser les credentials
credentials = SdkRuby::KSCredentials.new("API_KEY", "Organization_ID", "Instance_ID")

# Initialiser le SDK avec les credentials
sdk = SdkRuby::SDK.new(credentials)

# Utiliser les fonctionnalités du SDK
puts sdk.hello

# Exemple d'appel à une API via le SDK
response = sdk.api_handler.get('/api/v1/resource', { param1: 'value1' })
puts response
```
