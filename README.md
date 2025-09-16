# KAI SDK Ruby

This SDK allows you to interact with the KAI API. It is written in Ruby and facilitates the following operations with the KAI API:
- Functions related to the Search module (Search) and conversational addon (Chatbot)
- Functions related to the Audit Knowledge module : Audit
- Functions related to the Audit Documents : Document
- Fonctions related to the indexing of documents : Core 
- Functions related to the semantic graph data management : Graph

For more information:
Visit our website : https://k-ai.ai/
And for the documentation : https://k-ai.gitbook.io/knowledge-ai

## Installation
To use this SDK, clone this repository and use it in your Ruby project:

Add the gem to the Gemfile in your project

```bash
gem 'sdk_ruby', git: 'https://github.com/k-ai-Documentation/sdk-ruby'
```

or if you use SSH :
```bash
gem 'sdk_ruby', git: 'git@github.com:k-ai-Documentation/sdk-ruby.git'
```

Then
```bash
bundle install
```

The SDK will be installed in the vendor/bundle directory or in the system gems, depending on the configuration.

## Usage
### Using the SDK in your project
Once the gem is installed, you can use the SDK as with a regular Ruby gem. For example, in a main.rb file of your project, use it like this:

```bash
require 'sdk_ruby'

# Initialize credentials
credentials = SdkRuby::KSCredentials.new("API_KEY", "Organization_ID", "Instance_ID")

(Do not forget to create a file dedicated to your credentials. An exemple of .env file is in this repo.)

# Create the ApiHandler instance
api_handler = SdkRuby::ApiHandler.new(credentials)

# Test "Hello" method from the SDK
p SdkRuby::KS.hello
# It should print "Welcome on KAI's Ruby SDK!""

# Example : How to call a method in the Audit module
audit = SdkRuby::Audit.new(api_handler)
audit.get_conflict_information(limit = 5, offset = 0)

```

### Examples
The example.rb file provides you with a complete list of available functions and their usage.