// Regular JS

// A simple function to toggle an element between showing and hiding
function toggle(obj) {
	var el = document.getElementById(obj);

	if (el.style.display != 'none') {
		el.style.display = 'none';
	} else {
		el.style.display = '';
	}
}
