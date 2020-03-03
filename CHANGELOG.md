## v0.8.1
### Added
- Support Debian Testing

## v0.8.0
### Changed
- [breaking change] Optionalize development dependencies. Set `install_development_dependency: true` to enable them.

## v0.7.3
### Added
- Support Debian 10 buster
- Install subversion for source build dependency

## v0.7.2
### Added
- Install `autoconf` and `bison` on RedHat platforms [#26](https://github.com/k0kubun/itamae-plugin-recipe-rbenv/pull/26)
  *Thanks to @hsbt*

## v0.7.1
### Added
- Install `make` on RedHat platforms [#25](https://github.com/k0kubun/itamae-plugin-recipe-rbenv/pull/25)
  *Thanks to @hsbt*

## v0.7.0
### Changed
- [breaking change] Raise NotImplementedError on an unknown platform
- Initial support of OpenBSD

## v0.6.11
### Fixed
- Avoid unnecessary `rbenv global` [#24](https://github.com/k0kubun/itamae-plugin-recipe-rbenv/pull/24)
  *Thanks to @pocke*

## v0.6.10
### Fixed
- Fix undefined variable error and installation requirement in `node[:rbenv][:plugins]` feature [#23](https://github.com/k0kubun/itamae-plugin-recipe-rbenv/pull/23)
  *Thanks to @mozamimy*

## v0.6.9
### Added
- Add `node[:rbenv][:plugins]` to install arbitrary rbenv plugins [#21](https://github.com/k0kubun/itamae-plugin-recipe-rbenv/pull/21)
  *Thanks to @Yuki-Inoue*

## v0.6.8
### Added
- Add `install_dependency` node option [#20](https://github.com/k0kubun/itamae-plugin-recipe-rbenv/pull/20)
  *Thanks to @sue445*

## v0.6.7
### Fixed
- Fix package installation error on Debian [#19](https://github.com/k0kubun/itamae-plugin-recipe-rbenv/pull/19)
  *Thanks to @hanachin*

## v0.6.6
### Fixed
- Support installing 2.1.10 when 2.1.1 is installed as well [#17](https://github.com/k0kubun/itamae-plugin-recipe-rbenv/pull/17)
  *Thanks to @chiastolite*

## v0.6.5
### Fixed
- Support Ubuntu 18.04 [#18](https://github.com/k0kubun/itamae-plugin-recipe-rbenv/pull/18)
  *Thanks to @swanmatch*

## v0.6.4
### Added
- Suport Amazon Linux [#16](https://github.com/k0kubun/itamae-plugin-recipe-rbenv/pull/16)
  *Thanks to @kawakubox*

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
