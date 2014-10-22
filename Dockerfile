FROM java:7

MAINTAINER Tammo van Lessen

ENV JRUBY_VERSION 1.7.16
ENV BUILDR_VERSION 1.4.20

RUN mkdir /opt/jruby \
  && curl http://jruby.org.s3.amazonaws.com/downloads/${JRUBY_VERSION}/jruby-bin-${JRUBY_VERSION}.tar.gz \
  | tar -zxC /opt/jruby --strip-components=1 \
  && update-alternatives --install /usr/local/bin/ruby ruby /opt/jruby/bin/jruby 1
ENV PATH /opt/jruby/bin:$PATH

RUN echo 'gem: --no-rdoc --no-ri' >> /.gemrc

RUN gem install bundler
RUN gem install buildr -v=${BUILDR_VERSION}

ENV WORKSPACE /workspace
VOLUME $DIRPATH
WORKDIR $DIRPATH

ENTRYPOINT [ "buildr" ]