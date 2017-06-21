# Docker Google SDK

This docker image allows you to build other docker images and also push them to Google Cloud Platform (GCP) using the Google SDK.

The main use for this so far has been to build images in platforms like Gitlab CI, and then publish these built images to Google Cloud Platform.

## Example uses

An example Gitlab CI block might look like:

```
frontend_deploy:
  image: docker-google-cloud
  stage: publish
  script:
    - echo "$GOOGLE_KEY" > key.json
    - gcloud auth activate-service-account --key-file key.json
    - docker build --no-cache=true -t "gcr.io/{your-gcp-project}/{app}:{version}" {path_to_dockerfile}
    - gcloud docker -- push "gcr.io/{your-gcp-project}/{app}:{version}"
```
