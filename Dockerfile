# syntax=docker/dockerfile:1

# base imagem which will be extended
FROM node:18.5-alpine

# ENV variable to use in running app
ENV NODE_ENV=production

# Workdirectory which will be the folder to run subsequent commands
WORKDIR /app

# Copy project files to the run container. src , dest
# Can select more than 1 file, but the last param will be the target directory on the container
COPY ["package.json", "package-lock.json*", "./"]

# running commands, to install ex
RUN npm install --production

# Copy all files of the project to container folder.
COPY . . 

# run when our image is run inside of a container
CMD ["node", "server.js"]

