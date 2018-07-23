FROM node:8.11-jessie

RUN mkdir -p /opt/neo-mon

# Create the user
RUN useradd user -m -s /bin/bash
ENV HOME /opt/neo-mon

WORKDIR /opt/neo-mon

COPY ./ /opt/neo-mon

# RUN npm install -g bower

RUN chown -R user:user /opt/neo-mon

USER user

RUN yarn
# RUN /opt/neo-mon/node_modules/bower/bin/bower install

ENTRYPOINT ["/opt/neo-mon/node_modules/.bin/gulp", "serve"]
