## gh-action-update-submodule

Used to update another repository that includes this project as a submodule.

E.g.
https://source.foundries.io/factories/andy-corp/containers.git has a git
submodule git@github.com/doanac/container-submod

When changes are pushed to container-submod, this action will run and update
the reference in containers.git to have this new version.

## Inputs

### `remote-repo` (argument)
The repository to clone/update with the submodule reference.
e.g. https://source.foundries.io/factories/andy-corp/containers.git

### `api-token` (argument)
API token from https://app.foundries.io/settings/token that can access the
remote repo.

You can make the token availble to your action with:

  * Go to the Github page for the repository that you push from, click on "Settings"
  * On the left hand side pane click on "Secrets"
  * Click on "Add a new secret" and name it "FOUNDRIES_API_TOKEN"


### `submodule-path` (argument)
Path to this repository in the remote repository. e.g. ./container-submod

### `remote-branch` (argument)
Branch on the remote repository to checkout/push to. e.g. `devel`.

## Example usage
```yaml
# .github/workflows/source-fio-update.yml

name: Update source.foundries.io

on:
  push:
    branches: [ master ]

jobs:
  update:
    runs-on: ubuntu-latest
    steps:
    # Checks-out your repository under $GITHUB_WORKSPACE
    - uses: actions/checkout@v2
    - uses: doanac/gh-action-update-submodule@master
      with:
        remote-repo: https://source.foundries.io/factories/andy-corp/containers.git
        api-token: ${{ secrets.FOUNDRIES_API_TOKEN }}
        submodule-path: "./container-submod"
        remote-branch: ${{ github.ref }}
```
