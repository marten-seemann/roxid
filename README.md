# ROXID One

## Using the development version

Clone this repository directly into the OXID shop root directory.

ROXID requires a few additional database entries. The easiest way to add those for the development version is building a productive version, and run the *sql/install.sql*.

## Building

ROXID needs npm to build.
Run `npm install` in the root directory.

Build the template by running `build/build.sh`. This script builds a production-ready version for ROXID into the direction *build/productive*. The template can then be installed as described in the [install instructions](https://oxid-responsive.gitbooks.io/roxid/).
