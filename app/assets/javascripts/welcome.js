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

// A function to toggle the weather using AJAX
// TODO: Better error handling (for example, XMLHttpRequest isn't supported by all browsers, etc.)
function toggleAjax(obj) {
	var xmlHttp = new XMLHttpRequest();
	
	xmlHttp.onreadystatechange = function() {
		var el = document.getElementById(obj);
		
		if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
			el.innerHTML = xmlHttp.responseText;
		}
	}

	xmlHttp.open("GET", "http://localhost:3000/welcome/sf", true);
	xmlHttp.send();
}
