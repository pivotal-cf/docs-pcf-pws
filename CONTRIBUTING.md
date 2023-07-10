# Contributing to docs-pcf-pws

The docs-pcf-pws project team welcomes contributions from the community. Before you start working with
docs-pcf-pws, please
read our [Developer Certificate of Origin](https://cla.vmware.com/dco). All contributions to this repository must be
signed as described on that page. Your signature certifies that you wrote the patch or have the right to pass it on
as an open-source patch.

## Contribution flow

This is a rough outline of what a contributor's workflow looks like:

- Create a topic branch from where you want to base your work
- Make commits of logical units
- Make sure your commit messages are in the proper format (see the following)
- Push your changes to a topic branch in your fork of the repository
- Submit a pull request

Example:

``` shell
git remote add upstream https://github.com/vmware/@(project).git
git checkout -b my-new-feature main
git commit -a
git push origin my-new-feature
```

### Updating pull requests

If your PR fails to pass CI or needs changes based on code review, you'll most likely want to squash these changes into
existing commits.

If your pull request contains a single commit or your changes are related to the most recent commit, you may amend the commit.

You ahould add a comment to the PR indicating your new changes are ready to review, as GitHub does not generate a
notification when you Git push.

### Formatting commit messages

VMware requires everyone to follow the conventions on [Conventional Commits](https://www.conventionalcommits.org/) and
[How to Write a Git Commit Message](http://chris.beams.io/posts/git-commit/).

Include any related GitHub issue references in the commit message.  See
[GFM syntax](https://guides.github.com/features/mastering-markdown/#GitHub-flavored-markdown) for referencing issues
and commits.
