FROM node:18
WORKDIR /app
COPY src/ /app
RUN npm init -y
EXPOSE 3000
CMD ["node", "index.js"]
