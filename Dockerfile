# Source: https://github.com/cpuguy83/docker-jruby/blob/1f289ddb5d77c41b9f096384bdc412efa76e3d63/1.7/jre/Dockerfile

FROM logstash

RUN apt-get update && apt-get install -y libc6-dev --no-install-recommends && rm -rf /var/lib/apt/lists/*

ENV JRUBY_VERSION 1.7.27
RUN mkdir /opt/jruby \
  && curl -fSL https://s3.amazonaws.com/jruby.org/downloads/${JRUBY_VERSION}/jruby-bin-${JRUBY_VERSION}.tar.gz -o /tmp/jruby.tar.gz \
  && tar -zx --strip-components=1 -f /tmp/jruby.tar.gz -C /opt/jruby \
  && rm /tmp/jruby.tar.gz \
  && update-alternatives --install /usr/local/bin/ruby ruby /opt/jruby/bin/jruby 1
ENV PATH /opt/jruby/bin:$PATH

RUN echo 'gem: --no-rdoc --no-ri' >> ~/.gemrc

ENV GEM_HOME /usr/local/bundle
ENV PATH $GEM_HOME/bin:$PATH
RUN gem install bundler \
  && bundle config --global path "$GEM_HOME" \
  && bundle config --global bin "$GEM_HOME/bin"

# don't create ".bundle" in all our apps
ENV BUNDLE_APP_CONFIG $GEM_HOME

RUN mkdir /var/build_dir

# The contents of the volume are the actual build sources as defined in docker-compose.yml ('-v .:/var/build').
VOLUME /var/build_dir 

WORKDIR /var/build_dir

COPY entrypoint.sh /opt/entrypoint.sh

RUN chmod +x /opt/entrypoint.sh

CMD ["/opt/entrypoint.sh"]
