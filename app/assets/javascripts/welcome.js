// Regular JS

// A function to toggle an element between showing and hiding
function toggle(obj) {
	// TODO: Better error handling
	var el = document.getElementById(obj);

	if (el.className != 'hide') {
		el.className = 'hide';
	} else {
		el.className = '';
	}
}

// A function to switch *between* two objects
function toggleBetween(obj1, obj2) {
	toggle(obj1);
	toggle(obj2);
}
