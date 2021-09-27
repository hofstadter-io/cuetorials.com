function uuidv4() {
  let uuid = window.localStorage.getItem('uuid');
  if (uuid === null) {
    uuid = ([1e7]+-1e3+-4e3+-8e3+-1e11).replace(/[018]/g, c =>
      (c ^ crypto.getRandomValues(new Uint8Array(1))[0] & 15 >> c / 4).toString(16)
    );
    window.localStorage.setItem('uuid', uuid);
  }
  return uuid;
}

function pv() {

  var id = uuidv4();
  var page = window.location.pathname;

  let params = new URLSearchParams();
  params.append('id', id);
  let url = "/pv" + page + "?" + params.toString();

  fetch(url);
}

pv();
