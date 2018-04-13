# Pronto runner for YAMLlint

[![Gem Version](https://badge.fury.io/rb/pronto-yamllint.svg)](https://badge.fury.io/rb/pronto-yamllint)

Pronto runner for [YAMLlint](https://yamllint.readthedocs.io). [What is Pronto?](https://github.com/prontolabs/pronto)

## Prerequisites

* [install](https://yamllint.readthedocs.io/en/latest/quickstart.html#installing-yamllint) YAMLlint
* Ensure it is your `$PATH`

## Installation

Run `gem install pronto-yamllint`

## Configuration

(If needed) set `YAMLLINT_OPTS` environment variable with yamllint [options](https://yamllint.readthedocs.io/en/latest/configuration.html). They will be passed to yamllint.

## Usage

Run `pronto`. Also it is quite nice to set git pre-push hook for pronto like in `.git/hooks/pre-push`:

```
#!/bin/sh

pronto run --exit-code
```

## Changelog

0.1.1 Misc small fixes
0.1.0 Initial public version. Based heavily on https://kevinjalbert.com/create-your-own-pronto-runner/
