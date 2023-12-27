# CHANGELOG
Inspired from [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)

## [Unreleased]
### Added
- Added base64 gem to gemspec (#218)[https://github.com/opensearch-project/opensearch-ruby/pull/218]
### Changed
### Deprecated
### Removed
### Fixed
### Security

## [3.1.0]
### Added
- Added `http.get`, `http.post`, `http.patch`, `http.put`, `http.trace`, `http.head`, `http.options`, `http.connect`, and `http.delete`  ([#211](https://github.com/opensearch-project/opensearch-ruby/pull/211))
- Added a guide and a sample for `http` namespace ([#211](https://github.com/opensearch-project/opensearch-ruby/pull/211))
### Changed
### Deprecated
### Removed
### Fixed
- Fixed the response body being force-encoded when it was already in UTF-8 ([#212](https://github.com/opensearch-project/opensearch-ruby/issues/212))
### Security

## [3.0.1]
### Added
### Changed
### Deprecated
### Removed
### Fixed
- Fixed missing version require [#205](https://github.com/opensearch-project/opensearch-ruby/issues/205) ([#206](https://github.com/opensearch-project/opensearch-ruby/pull/206))
### Security

## [3.0.0]
### Added
- Added `remote_store.restore` action ([#176](https://github.com/opensearch-project/opensearch-ruby/pull/176))
- Added API Generator ([#139](https://github.com/opensearch-project/opensearch-ruby/issues/139))
- Added Security API through API Generator ([#179](https://github.com/opensearch-project/opensearch-ruby/pull/179))
### Changed
- Merged `opensearch-transport`, `opensearch-api`, and `opensearch-dsl` into `opensearch-ruby` ([#133](https://github.com/opensearch-project/opensearch-ruby/issues/133))
- Bumped `mocha` gem from 1.x.x to 2.x.x ([#178](https://github.com/opensearch-project/opensearch-ruby/pull/178))
- Temporarily downgraded OS version in main` workflow from `latest` to `2.8.0` to avoid `2.9.0` breaking changes ([#178](https://github.com/opensearch-project/opensearch-ruby/pull/178))
### Deprecated
### Removed
### Fixed
### Security
