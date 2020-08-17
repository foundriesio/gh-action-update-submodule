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

### `submodule-path` (argument)
Path to this repository in the remote repository. e.g. ./container-submod

### `remote-branch` (argument)
Branch on the remote repository to checkout/push to. e.g. `devel`.

## Example usage
```yaml
      - name: Clone repo
        uses: actions/checkout@v2
      - name: Update containers.git
        uses: foundriesio/gh-action-update-submodule@master
        with:
	  remote-repo: https://source.foundries.io/factories/andy-corp/containers.git
	  api-token: ${{ secrets.FOUNDRIES_API_TOKEN }}
	  submodule-path: ./containers-submod
	  remote-branch: ${GITHUB_REF##*/}
```
