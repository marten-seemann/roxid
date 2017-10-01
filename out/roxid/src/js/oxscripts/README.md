# Modifications for ROXID

  - *oxajax.js*: enable the submission of form values in input[type="radio"] and selects
  - *oxdropdown.js*: adjust, *this.selectedValueLabel*, comment out some function blocks
  - *oxpayment.js*: add some code to disable required form elements when they get hidden
  - *oxcompare.js*: just take the current version. Heavily modified.
  - *oxarticlevariant.js*: call *lazyLoader()* after an AJAX request
  - *oxtag.js*: mainly keep up with the HTML modifications for ROXID, use .tags instead of #tags selector to make it compatible with the smartphone version
