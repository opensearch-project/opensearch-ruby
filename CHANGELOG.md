# CHANGELOG
Inspired from [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)

## [Unreleased]
### Added
### Changed
- Bump GitHub Actions ([#248](https://github.com/opensearch-project/opensearch-ruby/pull/248))
### Deprecated
### Removed
### Fixed
### Security

## [3.2.0]
### Added
- Added support for Ruby 3.3 ([#220](https://github.com/opensearch-project/opensearch-ruby/pull/220))
- Added `search_pipeline` parameter to `search` API ([#227](https://github.com/opensearch-project/opensearch-ruby/pull/227))
### Changed
- Pass in an initial admin password, required by security after 2.12.0 release ([#217](https://github.com/opensearch-project/opensearch-ruby/issues/217))
### Deprecated
### Removed
- Removed dependency on the base64 gem ([#221](https://github.com/opensearch-project/opensearch-ruby/pull/221))
- Removed logging of hosts in `transport` base ([#227](https://github.com/opensearch-project/opensearch-ruby/pull/227))
- Remove duplicated `delete_by_query_rethrottle` to prevent a Ruby warning ([#230](https://github.com/opensearch-project/opensearch-ruby/issues/230))

### Fixed
- Switch back to the latest OpenSearch version when testing in CI ([#219](https://github.com/opensearch-project/opensearch-ruby/pull/219))
- Don't emit Ruby warnings when requiring `opensearch-dsl` ([#231](https://github.com/opensearch-project/opensearch-ruby/issues/231))
- Fix release workflow ([#232](https://github.com/opensearch-project/opensearch-ruby/issues/232))
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
