window.toggleMenuItem = function (e) {
	e = e || window.event;
  var src = e.target || e.srcElement;
	console.log(e)

	children = src.parentNode.nextElementSibling;
	console.log(children)

	classes = src.className.split(" ");
	var open = classes.indexOf("fa-caret-down") >= 0
	if (open) {
		src.className = src.className.replace("down", "right")
		children.className += " d-none"
	} else {
		src.className = src.className.replace("right", "down")
		children.className = children.className.replace(" d-none", "")
	}


}
