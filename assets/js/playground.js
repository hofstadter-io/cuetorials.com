function playground(id) {
  var data = document.getElementById(id).value;
  fetch("/playground", {
    method: "POST",
    headers: { "Content-Type": "text/plain;" },
    body: data,
  }).then(resp => {
    if (!resp.ok) {
      throw new Error('Network response was not ok');
    }
    return resp.text()
  }).then(data => {
    var url = "https://cuelang.org/play/?id=" + data + "#cue@export@cue"
    window.open(url, "_blank")
  }).catch(error => {
    console.log("error:", error)
  })
}

new ClipboardJS('.btn');
