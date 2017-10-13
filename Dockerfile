FROM node:8.6.0

RUN useradd --user-group --create-home --shell /bin/false appuser &&\
npm install --global yarn

ENV HOME=/home/app
COPY package.json yarn.lock $HOME/node-app/
RUN chown -R appuser:appuser $HOME/*

USER appuser
WORKDIR $HOME/node-app
RUN yarn

CMD ["node", "server.js"]

