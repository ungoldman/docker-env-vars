FROM alpine:latest

ARG NODE_ENV=test
ENV NODE_ENV=$NODE_ENV

# build time variables
RUN echo "The env var NODE_ENV is $NODE_ENV"

# run time variables (not the same!!!)
CMD [ "env" ]
