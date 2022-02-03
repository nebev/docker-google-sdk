FROM google/cloud-sdk

RUN apt-get update && apt-get install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     software-properties-common \
     apt-transport-https \
     gnupg lsb-release \
   && curl -fsSL https://aquasecurity.github.io/trivy-repo/deb/public.key | apt-key add - \
   && echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | tee -a /etc/apt/sources.list.d/trivy.list \
   && cat /etc/apt/sources.list \
   && curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
   && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
   && cat /etc/apt/sources.list \
   && apt-get update \
   && apt-get install -y \
     trivy \
     docker-ce \
   && rm -rf /var/lib/apt/lists/*

