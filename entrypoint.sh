#!/bin/bash

gem build logstash-output-amazon_es.gemspec
logstash-plugin install /var/build_dir/logstash-output-amazon_es-2.0.1-java.gem
logstash-plugin prepare-offline-pack --output /var/build_dir/logstash-output-amazon_es-2.0.1.zip logstash-output-amazon_es

chmod o+r /var/build_dir/logstash-output-amazon_es-2.0.1*