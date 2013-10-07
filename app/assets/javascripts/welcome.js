// Regular JS

// A function to toggle an element between showing and hiding
function toggle(obj) {
	toggle_helper(obj, false);
}

// A function to hide an element
function hide_obj(obj) {
	toggle_helper(obj, true);
}

// Helper function for toggle(...) and hide_obj(...)
function toggle_helper(obj, force_hide) {
	// TODO: Better error handling
	var el = document.getElementById(obj);

	if (force_hide || is_shown(el)) {
		el.style.display = 'none';
	} else {
		e.style.display = '';
	}
}

// A function to switch *between* two objects
function toggle_between(obj1, obj2) {
	toggle(obj1);
	toggle(obj2);
}
