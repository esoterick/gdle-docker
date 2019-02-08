# $ sha256sum -c gdle.tar.gz.sha256sum
# gdle.tar.gz: OK

# https://gdle.sfo2.cdn.digitaloceanspaces.com/gdle.tar.gz
# https://gdle.sfo2.cdn.digitaloceanspaces.com/gdle.tar.gz.sha256sum

# https://lifestoned.org/WorldRelease/Get?fileName=GDLE-Latest-Updates-2019-01-12_10-50.zip

FROM debian:stretch

# Setup Configs
ENV LIFESTONED_BASE https://lifestoned.org
ENV LIFESTONED_FILE GDLE-Latest-Updates-2019-01-12_10-50.zip
ENV LIFESTONED_HASH 999c2b4b3ecf4a2a16d55b3135ed9c939dff02fb740eb724e9f94baeb1913794

# Setup requirements
RUN apt-get update
RUN apt-get install -y \
    tar \
    wget \
    wine

# Setup directory structure
RUN mkdir /gdle 
WORKDIR /gdle

# Download and verify server
RUN wget https://gdle.sfo2.cdn.digitaloceanspaces.com/gdle.tar.gz
RUN wget https://gdle.sfo2.cdn.digitaloceanspaces.com/gdle.tar.gz.sha256sum
RUN sha256sum -c gdle.tar.gz.sha256sum
