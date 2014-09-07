function activeLink(linkName){
	var el=document.getElementById(linkName);
	el.className += el.className ? ' active' : 'active';
}