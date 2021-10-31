FROM julia:1.6

# Unlike the dockerfile in the examples folder, this mimics the typical flow for a project that
# uses Joseki. 

# Cloud platforms usually run as non-root users, so avoid doing anything as root
RUN useradd --create-home --shell /bin/bash myuser
RUN mkdir /home/myuser/joseki_on_gcp

# Add files
COPY . /home/myuser/joseki_on_gcp/
WORKDIR /home/myuser/joseki_on_gcp
RUN chown myuser:myuser -R * 

USER myuser

# Install dependencies
RUN julia --project -e 'using Pkg; Pkg.instantiate(); Pkg.precompile()'
ENV JULIA_DEPOT_PATH "/home/myuser/.julia"

# Briefly run the server to trigger precompilation
RUN julia --project warmup.jl

CMD julia --project -e 'include("server_definition.jl"); HTTP.serve(router, "0.0.0.0", port)'
