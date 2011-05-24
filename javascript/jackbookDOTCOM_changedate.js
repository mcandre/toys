function jackbookDOTCOM_changeDate(thedate) {
	var newdate = jackbookDOTCOM_dateformat(thedate);
	document.write (newdate);
}

function jackbookDOTCOM_dateformat(dateformat) {
	// Tuesday, July 17, 2008
	dateformat = trim(dateformat);
	if(dateformat.length>0) {
		var vpostdate= dateformat.split(",")
		vpostdate = trim(vpostdate[1]);
		var vpostdate= vpostdate.split(" ");
		var vresult = vpostdate[0].substring(0, 3) + '<div>' + vpostdate[1] + '</div>';
		return vresult;
	}
}

 //thanks to webtoolkit.info for this trim snippet,
function trim(str, chars) {
	return ltrim(rtrim(str, chars), chars);
}

function ltrim(str, chars) {
	chars = chars || "\\s";
	return str.replace(new RegExp("^[" + chars + "]+", "g"), "");
}

function rtrim(str, chars) {
	chars = chars || "\\s";
	return str.replace(new RegExp("[" + chars + "]+$", "g"), "");
}

function jackbookDOTCOM_getdate() {
	var divs = document.getElementsByTagName('DIV');
	for(var no=0;no<divs.length;no++){
		if(divs[no].className=='jackbookDOTCOM_date'){
			var logos = divs[no].innerHTML;
			if(logos.length>0) {
				var newdate = jackbookDOTCOM_dateformat(logos);
				divs[no].innerHTML = newdate;
			}
		}
	}
}

jackbookDOTCOM_getdate();
