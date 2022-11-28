
# CHANGELOG
Inspired from [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)

## [Unreleased]
### Added
- Github workflow for changelog verification ([#102](https://github.com/opensearch-project/opensearch-ruby/pull/102))
- Added Sigv4 Support with `opensearch-aws-sigv4` gem ([#71](https://github.com/opensearch-project/opensearch-ruby/issues/71))
- "Draft Release" workflow for automated release ([113](https://github.com/opensearch-project/opensearch-ruby/issues/113))
- Jenkins release workflow and add step to sign the gems in GitHub Actions([118](https://github.com/opensearch-project/opensearch-ruby/pull/118))

### Changed
- Added @harshavamsi to maintainers ([#114](https://github.com/opensearch-project/opensearch-ruby/issues/114))
- Updated for inclusive naming and removing instances of `_type` since opensearch deprecation ([#112](https://github.com/opensearch-project/opensearch-ruby/issues/112))
- `release/build.sh` now only builds 1 gem at a time, then packages it into an artifact file for release ([113](https://github.com/opensearch-project/opensearch-ruby/issues/113))
- Renamed folder for `opensearch-ruby` gem from `opensearch` to `opensearch-ruby` ([116](https://github.com/opensearch-project/opensearch-ruby/issues/116))
- Update the public key ([118](https://github.com/opensearch-project/opensearch-ruby/pull/118))

### Deprecated

### Removed

### Fixed
- Locked Mocha Gem down to version 1.x.x in `opensearch-dsl` gem ([#108](https://github.com/opensearch-project/opensearch-ruby/pull/108))
 
### Security


[Unreleased]: https://github.com/opensearch-project/opensearch-ruby/compare/2.0...HEAD
