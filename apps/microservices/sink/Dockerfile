from node:current-buster-slim
copy package.json /app/
copy package-lock.json /app/
workdir /app
run npm install
copy src/*.js /app/src/
entrypoint ["npm", "start"]
  