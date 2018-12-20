// JavaScript Document
var ajax1;
function Ajax(sUrl,sRecvTyp,sQueryString,oResultFunc) {
	this.Url = sUrl;
	this.QueryString = sQueryString;
	this.XmlHttp = this.createXMLHttpRequest();
	if (this.XmlHttp == null) {
		alert("erro");
		return;
	}
var objxml = this.XmlHttp;
objxml.onreadystatechange = function (){
	Ajax.handleStateChange(objxml,sRecvTyp,oResultFunc)};
}

Ajax.prototype.createXMLHttpRequest = function() {
	try { return new ActiveXObject("Msxml2.XMLHTTP"); } catch(e) {}
	try { return new ActiveXObject("Microsoft.XMLHTTP"); } catch(e) {}
	try { return new XMLHttpRequest(); } catch(e) {}
	return null;
}

Ajax.prototype.createQueryString = function () {
	var queryString = this.QueryString;
	return queryString;
}

Ajax.prototype.get = function () {
	sUrl = this.Url;
	var queryString = sUrl+"?timeStamp=" + new Date().getTime() + "&" + this.createQueryString();
	this.XmlHttp.open("GET",queryString,true);
	this.XmlHttp.send(null);
}

Ajax.prototype.post = function() {
	sUrl = this.Url;
	var sUrl = sUrl + "?timeStamp=" + new Date().getTime();
	var queryString = this.createQueryString();
	this.XmlHttp.open("POST",sUrl,true);
	this.XmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	this.XmlHttp.send(queryString);
}

Ajax.handleStateChange = function (XmlHttp,sRecvTyp,oResultFunc) {
	if (XmlHttp.readyState == 4) {
	if (XmlHttp.status == 200) {
		oResultFunc(sRecvTyp?XmlHttp.responseXML:XmlHttp.responseText);
	} 
	else {
	alert("您所请求的页面有异常。");
	}
	}
} 

function ajax(sUrl,sRecvTyp,sQueryString,oResultFunc)
{
	ajax1 = new Ajax(sUrl,sRecvTyp,sQueryString,oResultFunc);
	ajax1.get();
	}