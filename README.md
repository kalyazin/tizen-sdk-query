tizen-sdk-query
===============

[![Build Status](https://travis-ci.org/kalyazin/tizen-sdk-query.svg?branch=master)](https://travis-ci.org/kalyazin/tizen-sdk-query)

Utilities for querying Tizen SDK packages
- tsq belongs  - list what package file belongs to
- tsq depends  - show depending packages
- tsq info     - show package information
- tsq depgraph - show package's install dependencies
- tsq files    - list all files installed by package
- tsq pkglist  - list all packages
- tsq grep     - grep filename in packages
- tsq tree     - show package dependency tree

You need to have [Tizen SDK 2.2.1](https://developer.tizen.org/downloads/tizen-sdk) installed to use the utilities.
For test run use FAKE_SDK env variable pointing to ./tests/fixtures.
