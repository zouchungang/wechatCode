// JavaScript Document
function CloseThis()
{
	parent.ScreenClean(0,'none');parent.cerrform.style.display='none';	
}


	function moveit() //这个函数用于把层放到浏览器中间
	{
	var dde = document.documentElement;
	if (window.innerWidth){
		var ww = window.innerWidth;
		var wh = window.innerHeight;
		var bgX = window.pageXOffset;
		var bgY = window.pageYOffset;
	}else{
		var ww = dde.offsetWidth;
		var wh = dde.offsetHeight;
		var bgX = dde.scrollLeft;
		var bgY = dde.scrollTop;
	}
		if(document.getElementById('cerrform')){
		  document.getElementById('cerrform').style.left=(bgX + ((ww - 400)/2));
		  document.getElementById('cerrform').style.top=(bgY + ((wh - 400)/2));
		}
	}
 
		function Scrover(){
		var browser = new Browser();
		var objScreen = document.getElementById("ScrOver");
		if(!objScreen) 
		var objScreen = document.createElement("div");
		var oS = objScreen.style;
		objScreen.id = "ScrOver";
		oS.display = "block";
		oS.top = oS.left = oS.margin = oS.padding = "0px";
		if (document.body.clientHeight)	{
			var wh = document.body.clientHeight + "px";
		}
		else if (window.innerHeight){
			var wh = window.innerHeight + "px";
		}else{
			var wh = "100%";
		}
		oS.width = "100%";
		oS.height = wh;
		oS.position = "absolute";oS.zIndex = "3";
		if ((!browser.isSF) && (!browser.isOP))
		{
			oS.background = "#cccccc";
		}else{
			oS.background = "#cccccc";
		}
		oS.filter = "alpha(opacity=40)";
		oS.opacity = 40/100;
		oS.MozOpacity = 40/100;
		document.body.appendChild(objScreen);
		}
		function ScrClean(){
		var objScreen = document.getElementById("ScrOver");
		if (objScreen) {
		objScreen.style.display = "none";
		document.getElementById('cerrform').style.display='none';}
	}
		function ScrClean2(){
		document.getElementById('prodiv').style.display='none';}

	function Browser(){
		var ua, s, i;
		this.isIE = false;
		this.isNS = false;
		this.isOP = false;
		this.isSF = false;
		ua = navigator.userAgent.toLowerCase();
		s = "opera";
		if ((i = ua.indexOf(s)) >= 0){
			this.isOP = true;return;
		}
		s = "msie";
		if ((i = ua.indexOf(s)) >= 0) {
			this.isIE = true;return;
		}
		s = "netscape6/";
		if ((i = ua.indexOf(s)) >= 0) {
			this.isNS = true;return;
		}
		s = "gecko";
		if ((i = ua.indexOf(s)) >= 0) {
			this.isNS = true;return;
		}
		s = "safari";
		if ((i = ua.indexOf(s)) >= 0) {
			this.isSF = true;return;
		}
	}
	
	/*
	
	function moveit(width,height) //这个函数用于把层放到浏览器中间
{
var dde = document.documentElement;
if (window.innerWidth){
	var ww = window.innerWidth;
	var wh = window.innerHeight;
	var bgX = window.pageXOffset;
	var bgY = window.pageYOffset;
}else{
	var ww = dde.offsetWidth;
	var wh = dde.offsetHeight;
	var bgX = dde.scrollLeft;
	var bgY = dde.scrollTop;
}
	cerrform.style.left=(bgX + ((ww - width)/2));
	cerrform.style.top=(bgY + ((wh - height)/2));
}
*/