# Checklist - How to release new YouTrack build

## Development stage

1. Create new git branch using this template: `git checkout -b release-2017.3.build_number`
1. Delete local and remote tag **latest**: `git tag -d latest && git push --delete origin latest`
1. Add to README.md new build / version, change release date
1. Change **YOUTRACK_BUILD** variable in Dockerfile
1. Add changes to stage area and commit: `git commit -m "Add new build 2017.3.build_number"`
1. Push branch to remote: `git push -u origin release-2017.3.build_number`
1. Proceed to **Github stage p.1 and p.2** of this checklist...
1. Pull changes from remote (with merge commit at the moment)
1. Add **latest** tag: `git tag -a latest -m "latest"`
1. Add build tag: `git tag -a 2017.3.build_number -m "Youtrack 2017.3.build_number"`
1. Push tags: `git push origin latest && git push origin 2017.3.build_number`

## Github stage

1. Open a pull request with comment: `New release based on YouTrack 2017.3.build_number`
1. Merge PR to master
1. Add new release with fresh build tag: https://github.com/pythoninja/docker-youtrack-base/releases/new
1. Title: **2017.3.build_number**
1. Text: **YouTrack build: 2017.3.build_number** and optionally add another changes
