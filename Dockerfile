FROM centos:7

# Install ffmpeg
RUN yum -y install http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
RUN yum install -y ffmpeg


RUN yum install -y wget tar make gcc-c++ gcc
# Install Node.js
RUN \
  cd /tmp && \
  wget http://nodejs.org/dist/v0.12.0/node-v0.12.0.tar.gz && \
  tar xvzf node-v0.12.0.tar.gz && \
  rm -f node-v0.12.0.tar.gz && \
  cd node-v* && \
  ./configure && \
  CXX="g++ -Wno-unused-local-typedefs" make && \
  CXX="g++ -Wno-unused-local-typedefs" make install && \
  cd /tmp && \
  rm -rf /tmp/node-v* && \
  npm install -g npm && \
  echo -e '\n# Node.js\nexport PATH="node_modules/.bin:$PATH"' >> /root/.bashrc

