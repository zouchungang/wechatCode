var Zly = {
//获取对象
	$ : function(objName){
		  if(document.getElementById){
			  return eval('document.getElementById("'+objName+'")')
		  }else{
		      return eval('document.all.'+objName)
		  }
	},
//是否IE浏览器
	isIE : document.all ? true : false,

//添加事件监控
	addEvent : function(obj,eventType,func){
		if(obj.attachEvent){
			obj.attachEvent("on" + eventType,func);
		}else{
			obj.addEventListener(eventType,func,false)
		}
	},
//删除事件监控
	delEvent : function(obj,eventType,func){
		if(obj.detachEvent){
		    obj.detachEvent("on" + eventType,func)
		}else{
			obj.removeEventListener(eventType,func,false)
		}
	},
//读取cookie
	readCookie : function(l){
		var i="",I=l+"=";if(document.cookie.length>0){var offset=document.cookie.indexOf(I);if(offset!=-1){offset+=I.length;var end=document.cookie.indexOf(";",offset);if(end==-1)end=document.cookie.length;i=unescape(document.cookie.substring(offset,end))}};return i},
//写入cookie
	writeCookie : function(O,o,l,I){var i="",c="";if(l!=null){i=new Date((new Date).getTime()+l*3600000);i="; expires="+i.toGMTString()};if(I!=null){c=";domain="+I};document.cookie=O+"="+escape(o)+i+c},
//属性赋值
	attr : function(type,val){
	  
	}
};

Zly.ajax = function( o ){
	var settings = {
	   type    : "POST",  //提交方式
	   url     : "",      //提交URL
	   data    : "",      //提交数据
	   async   : true,    //true异步,false同步   
	   success : null,    //成功回调函数
	   error   : null     //失败回调函数
	};
	  for(k in o)settings[k] = o[k];
	  
	  var xmlhttp = "",type = settings.type,url = settings.url,data = settings.data,success = settings.success,error = settings.error,async = settings.async;
	  var isIE = document.all ? true : false;
	  send();
//初始化XML
	function xmlhttp_init() {
	   if(isIE) {
			browser = "ie";
			xmlhttp=new ActiveXObject("MSXML2.XMLHTTP.3.0");
		}else {
			xmlhttp=new XMLHttpRequest();
			browser = "other";
		}
		return xmlhttp;
	}
//发送请求
	function send(){
	  xmlhttp_init();
	  if(type=='GET')xmlhttp.open(type,url+"?"+data+"&time="+new Date().getTime(),async);else xmlhttp.open(type,url,async);
	  xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	  if(type=='GET')xmlhttp.send(null);else xmlhttp.send(data);
	  xmlhttp.onreadystatechange=function(){
	    if (xmlhttp.readyState==4 || xmlhttp.readyState=="complete"){
		  if(xmlhttp.status!=200){
		    if(error)error.apply(this,[]);return;
		  }
		  if(success)success.apply(this,[xmlhttp.responseText]);
		}
	   };
	  if(!async){
		  if(xmlhttp.status!=200){
		    if(success)error.apply(this,[]);return;
		  }
		  if(error)success.apply(this,[xmlhttp.responseText]);
	  }
	}
}