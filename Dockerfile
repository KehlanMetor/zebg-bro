FROM node:8-alpine

LABEL maintainer "iCrawl <icrawltogo@gmail.com>"

# Add package.json for Yarn
WORKDIR /usr/src/Commando
COPY package.json yarn.lock ./

#  Install dependencies
RUN apk add --update \
&& apk add --no-cache ffmpeg opus pixman cairo pango giflib ca-certificates \
&& apk add --no-cache --virtual .build-deps git curl pixman-dev cairo-dev pangomm-dev libjpeg-turbo-dev giflib-dev python g++ make \
\
# Install node.js dependencies
&& yarn install \
\
# Clean up build dependencies
&& apk del .build-deps

# Add project source
COPY . .

ENV TOKEN=process.env.TOKEN \
	COMMAND_PREFIX=? \
	OWNERS=684444122609614865 \
	DB=mongodb+srv://KehlanMetor:skinnyfdp1@bot-discord.zbg8s.mongodb.net/Discord3 \
	REDIS= \
	EXAMPLE_CHANNEL= \
	WEATHER_API= \
	GOOGLE_API=AIzaSyDT81wm2xadFC6OfjV0KqYTbOpqoKJp_-c \
	GOOGLE_CUSTOM_SEARCH=AIzaSyB_JUGSezD5QnFutCmZX4Dk_v_6R_TIQDg \
	GOOGLE_CUSTOM_SEARCH_CX=AIzaSyB_JUGSezD5QnFutCmZX4Dk_v_6R_TIQDg \
	SOUNDCLOUD_API= \
	SHERLOCK_API= \
	PAGINATED_ITEMS= \
	DEFAULT_VOLUME= \
	MAX_LENGTH= \
	MAX_SONGS= \
	PASSES= 

CMD ["node", "Commando.js"]
