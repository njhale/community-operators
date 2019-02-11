FROM quay.io/openshift/origin-operator-registry

WORKDIR /registry
COPY ./community-operators/. manifests
RUN /bin/initializer -o ./bundles.db

ENTRYPOINT ["/bin/registry-server"]
CMD ["--database", "/registry/bundles.db"]