FROM openjdk:7

MAINTAINER Sathwik B P

ENV JRUBY_VERSION 1.7.26
ENV BUILDR_VERSION 1.4.25

RUN mkdir /opt/jruby \
  && curl http://jruby.org.s3.amazonaws.com/downloads/${JRUBY_VERSION}/jruby-bin-${JRUBY_VERSION}.tar.gz \
  | tar -zxC /opt/jruby --strip-components=1 \
  && update-alternatives --install /usr/local/bin/ruby ruby /opt/jruby/bin/jruby 1

ENV PATH /opt/jruby/bin:$PATH

RUN echo 'gem: --no-rdoc --no-ri' >> /.gemrc

RUN gem install bundler
RUN gem install buildr -v=${BUILDR_VERSION}

# make /tmp available to all users.
RUN chmod 777 -R /tmp && chmod o+t -R /tmp

RUN ln -s /opt/jruby/bin/buildr /usr/local/bin/buildr

ENV WORKSPACE /workspace
VOLUME /workspace
WORKDIR /workspace

ENTRYPOINT [ "buildr" ]
