# ----- Etape 1 : "build" --------------------------------------
# Parent image from debian distribution
FROM debian:stable-slim AS build

# Installer les outils C++ (une seule commande = une seule couche)
RUN apt-get update \
	&& apt-get upgrade -y --no-install-recommends cmake ninja-build g++\
	&& rm -rf /var/lib/apt/lists/*

# Copy source code dans /src
WORKDIR /src
COPY . .


# Configure, compiler, tester puis installer dans  /install
RUN cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=Release \
	&& cmake --build build \
	&& ctest --test-dir build --output-on-failure \
	&& cmake --install build --prefix /install
	
# ----- Etape 2 : image finale --------------------------------------
# On repart d'une image propre : ni compilateur, ni code source
FROM debian:stable-slim
COPY --from=build /install/bin/greet /usr/local/bin/greet
# Commande lancee par "docker run"
CMD ["greet"]
