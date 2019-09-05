Gem::Specification.new do |s|
  s.name            = 'logstash-output-amazon_es'
  s.version         = '6.4.2'
  s.licenses        = ['Apache-2.0']
  s.summary         = "Logstash Output to Amazon Elasticsearch Service"
  s.description     = "Output events to Amazon Elasticsearch Service with V4 signing"
  s.authors         = ["Amazon"]
  s.email           = 'feedback-prod-elasticsearch@amazon.com'
  s.homepage        = "https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/index.html"
  s.require_paths = ["lib"]

  s.platform = RUBY_PLATFORM

  # Files
  s.files = Dir["lib/**/*","spec/**/*","*.gemspec","*.md","CONTRIBUTORS","Gemfile","LICENSE","NOTICE.TXT", "vendor/jar-dependencies/**/*.jar", "vendor/jar-dependencies/**/*.rb", "VERSION", "docs/**/*"]

  # Tests
  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  # Special flag to let us know this is actually a logstash plugin
  s.metadata = { "logstash_plugin" => "true", "logstash_group" => "output" }

  s.add_runtime_dependency "manticore", '>= 0.6.4', '< 1.0.0'
  s.add_runtime_dependency 'stud', ['>= 0.0.17', '< 0.1']
  s.add_runtime_dependency 'cabin', ['~> 0.6']
  s.add_runtime_dependency "logstash-core-plugin-api", ">= 1.60", "<= 2.99"
  s.add_runtime_dependency 'aws-sdk-core', '~> 3'
  s.add_runtime_dependency 'aws-sdk-signer', '~> 1'

  s.add_development_dependency 'logstash-codec-plain'
  s.add_development_dependency 'logstash-devutils'
  s.add_development_dependency 'flores', '~> 0'
  # Still used in some specs, we should remove this ASAP
  s.add_development_dependency 'elasticsearch'
end
