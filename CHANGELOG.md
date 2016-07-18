## v0.6.3
### Fixed
- Fix the group of default-gems file [#14](https://github.com/k0kubun/itamae-plugin-recipe-rbenv/pull/14).
  *Thanks to @iyuuya*

## v0.6.2
### Fixed

- Fix the owner of user repository to rbenv:user [#13](https://github.com/k0kubun/itamae-plugin-recipe-rbenv/pull/13).
  *Thanks to @iyuuya*

## v0.6.1
### Added

- Support package download caching
  - Set `node[:rbenv][:cache]` true
  - See: https://github.com/rbenv/ruby-build#package-download-caching

## v0.6.0
### Changed

- Drop support for rbenv-gem-rehash since it's merged to rbenv core
  - See: https://github.com/rbenv/rbenv/pull/638
- Don't check base-devel group installation for Arch Linux
  - It's unnecessary for specinfra >= 2.50.2
  - See: https://github.com/mizzy/specinfra/pull/517

## v0.5.0
### Added

- Add support for Arch Linux, Linux Mint, OpenSUSE

### Fixed

- Add missing bzip2 dependency for RedHat, CentOS, Fedora

## v0.4.1
### Added

- rbenv's revision can be configurable with `node[:rbenv][:revision]`
  - To utilize optimization by https://github.com/itamae-kitchen/itamae/pull/182

## v0.4.0
### Added

- Support user-local rbenv installation by `rbenv::user`
- `rbenv_plugin` resource

### Changed

- Unused rbenv plugins are not `git clone`ed by default except ruby-build
  - You should explicitly set `install: true` if you want

## v0.3.4
### Added

- Add osx support for dependency installation.
  *Thanks to @dex1t*

## v0.3.3
### Added

- Add support for non-git scheme.
  *Thanks to @katsyoshi*

## v0.3.2
### Added

- Add support for rbenv-gem-rehash.
  *Thanks to @dex1t*

## v0.3.1
### Added

- Add git package installation.
  *Thanks to @takai*

## v0.3.0
### Changed

- Change platform finder from `os[:family]` to `node[:platform]`.
  *Thanks to @muratayusuke*
- Require itamae ~> v1.2

## v0.2.2
### Added

- Widen supported platforms for dependency installation.
  *Thanks to @sue445*

## v0.2.1
### Added

- Allow installing gems by default using rbenv-default-gems.
  *Thanks to @sue445*

## v0.2.0
### Added

- Allow specifying `RBENV_ROOT` by `node[:rbenv][:rbenv_root]`.
  *Thanks to @sue445*

## v0.1.2
### Fixed

- Add libffi-devel package depended by Ruby 2.2.
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
