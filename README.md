# yq-action-output
A GitHub Action to lookup information from YAML files using [yq](https://github.com/mikefarah/yq)

## Example Usage

```yml
      - uses: actions/checkout@v2
      - name: Get SDK Version from config
        id: lookupSdkVersion
        uses: devorbitus/yq-action-output@v1.1
        with:
          cmd: yq eval '.renutil.version' $(yq eval '.jobs.build.steps[] | select(.id == "buildStep") | .with.config-file' .github/workflows/release-action.yml)
      - name: Restore Cache
        id: restore-cache
        uses: actions/cache@v2
        with:
          path: ../renpy
          key:  ${{ runner.os }}-sdk-${{ steps.lookupSdkVersion.outputs.result }}
          restore-keys: |
            ${{ runner.os }}-sdk
      # ... more
```
