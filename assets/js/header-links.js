function addHeaderLinks() {
  var content = document.getElementById("main-content");
  var h3s = content.querySelectorAll("h3");

  h3s.forEach(h3 => {
    if (h3.parentNode == content) {
      var a = document.createElement("a");
      a.className = "ml-2 fas fa-link fa-xs";
      a.href = window.location.pathname + "#" + h3.id
      h3.className = "anchor"
      h3.appendChild(a);
    }
  })
}

addHeaderLinks();
