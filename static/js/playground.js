function playground(id) {
  console.log("playground: ", id)
  var data = document.getElementById(id).value;
  console.log(data)
  fetch("/playground", {
    method: "POST",
    headers: { "Content-Type": "text/plain;" },
    body: data,
  }).then(resp => {
    console.log("resp:", resp)
    if (!resp.ok) {
      throw new Error('Network response was not ok');
    }
    return resp.text()
  }).then(data => {
    console.log("data:", data)
    var url = "https://cuelang.org/play/?id=" + data + "#cue@export@cue"
    window.open(url, "_blank")
  }).catch(error => {
    console.log("error:", error)
  })
}
