# Mon SDK Ruby

Ce SDK permet d'interagir avec [nom de l'API ou service]. Il est écrit en Ruby et facilite les opérations suivantes :
- Fonction 1
- Fonction 2
- Fonction 3

## Installation
Pour utiliser ce SDK, clonez ce dépôt et utilisez-le dans votre projet Ruby :

```bash
git clone https://github.com/votreutilisateur/sdk-ruby.git
cd sdk-ruby


a. Ajouter la gem dans le Gemfile dans votre projet

gem 'sdk_ruby', git: 'https://github.com/toncompte/sdk_ruby.git'
ou si vous utilisez SSH :
gem 'sdk_ruby', git: 'git@github.com:toncompte/sdk_ruby.git'

b. bundle install

Le SDK sera installé dans le répertoire vendor/bundle ou dans les gems système, selon la configuration.


c. Utilisation du SDK dans le projet tiers
Une fois la gem installée, tu peux utiliser ton SDK comme tu le ferais avec une gem Ruby classique. Par exemple, dans un fichier main.rb de ton projet tiers, tu pourrais l'utiliser ainsi :

ruby
Copier le code
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