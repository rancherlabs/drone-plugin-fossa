# drone-plugin-fossa

Drone plugin for FOSSA.

## Usage

### Basic

The following snippet should be applied to the `.drone.yml` file:

#### NOTE: This will run `fossa analyze` on every drone-pr AND drone-publish run

```
kind: pipeline
name: fossa

steps:
- name: fossa  
  image: rancher/drone-fossa:latest
  failure: ignore
  settings:
    api_key:
      from_secret: FOSSA_API_KEY
```

By default, this plugin will run the `analyze` command per the generic CI documentation for FOSSA.

### Advanced

#### Run Both `fossa analyze` and `fossa test` in the same Drone Pipeline and only drone-publish

```yaml
  - name: fossa-analyze
    image: rancher/drone-fossa:latest
    failure: ignore
    settings:
      api_key:
        from_secret: FOSSA_API_KEY
    when:
      instance:
        - drone-publish.rancher.io
      ref:
        include:
          - "refs/heads/*"
          - "refs/tags/v*"
          - "refs/pull/*"
      event:
        - push
        - tag

  - name: fossa-test
    image: rancher/drone-fossa:latest
    failure: ignore
    settings:
      api_key:
        from_secret: FOSSA_API_KEY
    commands: 
      - test
    when:
      instance:
        - drone-publish.rancher.io
      ref:
        include:
          - "refs/heads/*"
          - "refs/tags/v*"
      event:
        - push
        - tag
```        

#### How to Run `fossa test`

```
kind: pipeline
name: fossa

steps:
- name: fossa  
  image: rancher/drone-fossa:latest
  failure: ignore  
  settings:
    api_key:
      from_secret: FOSSA_API_KEY
    commands: 
      - test
```

#### Debug

```
kind: pipeline
name: fossa

steps:
- name: fossa  
  image: rancher/drone-fossa:latest
  settings:
    api_key:
      from_secret: FOSSA_API_KEY
    debug: true
```

## Reference

- [Drone Documentation: Example Bash Plugin](https://docs.drone.io/plugins/tutorials/bash)

- [FOSSA Documentation: Integrating FOSSA with a generic CI](https://docs.fossa.com/docs/generic-ci)

