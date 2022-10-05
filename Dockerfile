FROM node:8.3 AS builder

RUN git clone --depth 1 --branch v0.6.0 https://github.com/mapbox/node-fontnik.git
RUN cd node-fontnik && npm install && make

FROM node:8.3
WORKDIR /node-fontnik
COPY --from=builder /node-fontnik/index.js     ./index.js
COPY --from=builder /node-fontnik/lib          ./lib
COPY --from=builder /node-fontnik/bin          ./bin
COPY --from=builder /node-fontnik/node_modules ./node_modules
