FROM node:alpine

RUN apk add git

RUN sysctl fs.inotify.max_user_watches=582222 && sudo sysctl -p

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copi>
# where available (npm@5+)

COPY package*.json ./
COPY server*.js ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

CMD [ "npm", "start" ]