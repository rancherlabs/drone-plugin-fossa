# drone-plugin-fossa

Drone plugin for FOSSA.

## Usage

The following snippet should be applied to the `.drone.yml` file:

```
kind: pipeline
name: fossa

steps:
- name: fossa  
  image: rancher/drone-fossa:latest
  settings:
    api_key:
      from_secret: FOSSA_API_KEY
```
