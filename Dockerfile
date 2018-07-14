# Specifying the node version
FROM node:8.11.3

# Making environment variable
ENV NPM_CONFIG_LOGLEVEL warn
# Gives varaible the value
ARG app_env
ENV APP_ENV $app_env

# Making the working directory
RUN mkdir -p /my-app

# Setting the working directory
WORKDIR /my-app

# Copying the giles in front end folder to working directory
COPY ./my-app ./

RUN npm install

CMD if [ ${APP_ENV} = production ]; \
	then \
	npm install -g http-server && \
	npm run build && \
	cd build && \
	hs -p 3000; \
	else \
	npm run start; \
fi