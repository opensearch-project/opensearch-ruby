- [Overview](#overview)
- [Branching](#branching)
  - [Release Branching](#release-branching)
  - [Feature Branches](#feature-branches)
- [Release Labels](#release-labels)
- [Releasing](#releasing)

## Overview

This document explains the release strategy for artifacts in this organization.

## Branching

### Release Branching

Given the current major release of 1.0, projects in this organization maintain the following active branches.

* **main**: The next _major_ release. This is the branch where all merges take place and code moves fast.
* **1.x**: The next _minor_ release. Once a change is merged into `main`, decide whether to backport it to `1.x`.
* **1.0**: The _current_ release. In between minor releases, only hotfixes (e.g. security) are backported to `1.0`.

Label PRs with the next major version label (e.g. `2.0.0`) and merge changes into `main`. Label PRs that you believe need to be backported as `1.x` and `1.0`. Backport PRs by checking out the versioned branch, cherry-pick changes and open a PR against each target backport branch.

### Feature Branches

Do not creating branches in the upstream repo, use your fork, for the exception of long lasting feature branches that require active collaboration from multiple developers. Name feature branches `feature/<thing>`. Once the work is merged to `main`, please make sure to delete the feature branch.

## Release Labels

Repositories create consistent release labels, such as `v1.0.0`, `v1.1.0` and `v2.0.0`, as well as `patch` and `backport`. Use release labels to target an issue or a PR for a given release. See [MAINTAINERS](MAINTAINERS.md#triage-open-issues) for more information on triaging issues.

## Releasing

The release process is standard across repositories in this org and is run by a release manager volunteering from amongst [MAINTAINERS](MAINTAINERS.md). For this client, there are 5 gems that can be released: `opensearch-api`, `opensearch-ruby`, `opensearch-transport`, `opensearch-dsl` and `opensearch-aws-sigv4`.

1. Create a tag for the releasing ruby gem, e.g. `opensearch-ruby/2.2.0`, and push it to the GitHub repo.
1. The [release_drafter.yml](.github/workflows/release_drafter.yml) will be automatically kicked off and is responsible for drafting a new release on GitHub containing release artifacts.
1. Before creating a draft release, this workflow creates a GitHub issue asking for approval from the [maintainers](MAINTAINERS.md). See sample [issue](https://github.com/gaiksaya/opensearch-ruby/issues/1). The maintainers need to approve in order to continue the workflow run.
1. This draft release triggers the [jenkins release workflow](https://build.ci.opensearch.org/job/opensearch-ruby-gems-release/) as a result of which opensearch-ruby client gem is released on rubygems.
1. Once the above release workflow is successful, the drafted release on GitHub is published automatically.
1. Increment "version" in related gems `version.rb` to the next patch release, e.g. v2.2.1.
