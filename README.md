# hxgm30.mush

[![Build Status][gh-actions-badge]][gh-actions]
[![LFE Versions][lfe-badge]][lfe]
[![Erlang Versions][erlang-badge]][versions]
[![Tag][github-tag-badge]][github-tag]

[![Project Logo][logo]][logo-large]

*An LFE application*

##### Table of Contents

* [About](#about-)
* [Dependencies](#dependencies-)
* [Build](#build-)
* [Start the Project REPL](#start-the-repl-)
* [Tests](#tests-)
* [Usage](#usage-)
* [License](#license-)

## About [&#x219F;](#table-of-contents)

TBD

## Dependencies [&#x219F;](#table-of-contents)

Languages and tools:

* a recent release of Erlang (e.g., Erlang 23)
* `rebar`, `make`, and `git`

Infrastructure:

* a PostgreSQL-compatible database

## Build [&#x219F;](#table-of-contents)

```shell
$ rebar3 build
```

## Start the Project REPL [&#x219F;](#table-of-contents)

This will also bring up all the applications configured for the release:

```shell
$ rebar3 lfe repl
```

## Tests [&#x219F;](#table-of-contents)

```shell
$ rebar3 lfe test
```

## Usage [&#x219F;](#table-of-contents)

TBD

## License [&#x219F;](#table-of-contents)

Apache License, Version 2.0

Copyright © 2020, Duncan McGreggor <oubiwann@gmail.com>.

<!-- Named page links below: /-->

[logo]: https://raw.githubusercontent.com/hexagram30/resources/master/branding/logo/h30-logo-2-long-with-text-x695.png
[logo-large]: https://raw.githubusercontent.com/hexagram30/resources/master/branding/logo/h30-logo-2-long-with-text-x3440.png
[github]: https://github.com/hexagram30/mush
[travis]: https://travis-ci.org/hexagram30/mush
[travis-badge]: https://img.shields.io/travis/hexagram30/mush.svg
[gh-actions-badge]: https://github.com/hexagram30/mush/workflows/ci%2Fcd/badge.svg
[gh-actions]: https://github.com/hexagram30/mush/actions
[lfe]: https://github.com/rvirding/lfe
[lfe-badge]: https://img.shields.io/badge/lfe-2.0-blue.svg
[erlang-badge]: https://img.shields.io/badge/erlang-19%20to%2023-blue.svg
[versions]: https://github.com/hexagram30/mush/blob/master/.travis.yml
[github-tag]: https://github.com/hexagram30/mush/tags
[github-tag-badge]: https://img.shields.io/github/tag/hexagram30/mush.svg
[github-downloads]: https://img.shields.io/github/downloads/hexagram30/mush/total.svg
