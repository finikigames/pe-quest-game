FROM node:alpine

RUN apk add git

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copi>
# where available (npm@5+)

COPY games
COPY lib
COPY test
COPY typings
COPY utils
COPY deathling.ts./
COPY nodemon.json./
COPY schema.json./
COPY tsconfig.json./
COPY tslint.json./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

CMD [ "npm", "start" ]