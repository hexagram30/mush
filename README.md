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

This can be set up locally by running Postgres in a Docker container:

```shell
$ cd priv/docker/postgres/
$ make run
```

Then, to set up the database with the latest schemas, run this:

```shell
$ rebar3 migrate
```

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

At a high level, actual usage of the system as a MUSH server offering various games is this:

1. Telnet to the registration server
   1. view help, issue commands, etc., but ultimately:
   1. provide your email address and a public SSH key
   1. receive a confirmation email
   1. provide the confirmation code in the telnet session
   1. log out
1. SSH to the game server
   1. user id is the registered email address; access is by SSH key only
   1. view help, issue commands, etc., but ultimately:
   1. create a character
   1. select a game to join using a specificed character
   1. MUSH it up

PLayers with the `builder` role are able to add new areas to the game, create and place items, update existing areas, etc. All players may build one home in an available location (for areas that are approved for homes where there are available slots).

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
