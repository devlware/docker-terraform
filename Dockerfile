
FROM alpine:3.9 AS builder
USER root
RUN apk add --no-cache curl unzip
RUN curl -O https://releases.hashicorp.com/terraform/0.12.6/terraform_0.12.6_linux_amd64.zip && \
    unzip terraform_0.12.6_linux_amd64.zip -d /usr/local/bin/

FROM alpine:3.9
COPY --from=builder /usr/local/bin/terraform /usr/local/bin/terraform
ENTRYPOINT ["terraform"]