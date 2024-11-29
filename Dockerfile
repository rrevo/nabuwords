FROM debian:bookworm

# Print release information
RUN cat /etc/*release*

# OS update
RUN apt-get update && \
  apt-get install --yes -y --no-install-recommends \
  build-essential \
  ruby

WORKDIR /root

# Install asciidoc and tools
RUN gem install asciidoctor asciidoctor-pdf && asciidoctor --version

CMD ["/bin/bash"]
