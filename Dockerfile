FROM node:7
ADD app.js /app.js

# Command to be executed when the image is run
ENTRYPOINT ["node", "app.js"]  