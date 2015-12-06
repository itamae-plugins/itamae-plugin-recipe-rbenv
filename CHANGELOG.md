## v0.3.4
### Added

- Add osx support for dependency installation
  *Thanks to @dex1t*

## v0.3.3
### Added

- Add support for non-git scheme
  *Thanks to @katsyoshi*

## v0.3.2
### Added

- Add support for rbenv-gem-rehash
  *Thanks to @dex1t*

## v0.3.1
### Added

- Add git package installation
  *Thanks to @takai*

## v0.3.0
### Changed

- Change platform finder from `os[:family]` to `node[:platform]`
  *Thanks to @muratayusuke*
- Require itamae ~> v1.2

## v0.2.2
### Added

- Widen supported platforms for dependency installation
  *Thanks to @sue445*

## v0.2.1
### Added

- Allow installing gems by default using rbenv-default-gems
  *Thanks to @sue445*

## v0.2.0
### Added

- Allow specifying `RBENV_ROOT` by `node[:rbenv][:rbenv_root]`
  *Thanks to @sue445*

## v0.1.2
### Fixed

- Add libffi-devel package depended by Ruby 2.2
  *Thanks to @kwappa*

## v0.1.1
### Fixed

- Prevent error when `node[:'ruby-build']` is nil

## v0.1.0
### Added

- Support updating ruby-build's revision by `node[:'ruby-build'][:revision]`

## v0.0.1
### Added

- Clone rbenv and ruby-build by default
- Support ruby-build
  - installing multiple rubies using ruby-build
  - `rbenv global`
