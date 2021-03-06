Modernizr.addTest('firefox', function () {
 return !!navigator.userAgent.match(/firefox/i);
});

Modernizr.addTest("formattribute", function(){
  var form = document.createElement("form"),
      input = document.createElement("input"),
      div = document.createElement("div"),
      id = "formtest",
      bool = false;

  form.id = id;
  input.setAttribute("form",id);

  div.appendChild(form);
  div.appendChild(input);

  document.documentElement.appendChild(div);

  bool = form.elements.length === 1;

  div.parentNode.removeChild(div);

  return bool;
});
