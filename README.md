# ROXID One

If you want to install ROXID (and not contribute to the development), please [download a release](https://github.com/marten-seemann/roxid/releases). The template can then be installed as described in the [install instructions](https://oxid-responsive.gitbooks.io/roxid/).

In addition to the template files, ROXID also requires you to install the [ROXID module](https://github.com/marten-seemann/roxid-module). You can install the module by running
```bash
composer require seemannit/roxid
```

ROXID uses the [mmenu](https://mmenujs.com/) for the mobile navigation menu on smartphones. You need to [purchase a license](https://mmenujs.com/download.html) if you want to use ROXID commercially.

## Using the development version

Clone this repository directly into the OXID shop root directory.

ROXID requires a few additional database entries. The easiest way to add those for the development version is building a productive version, and run the *sql/install.sql*.

## Building

ROXID needs npm to build.
Run `npm install` in the root directory.

Build the template by running `build/build.sh`. This script builds a production-ready version for ROXID into the direction *build/productive*. 
