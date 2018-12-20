//所提交页面的输出字符串为返回值，应注意所提交页面的编码，否则会出现乱码
//
	var http_request=false;
	var updatelayer="";
	function Fsend_request(url,slayer){//初始化、指定处理函数、发送请求的函数
		http_request=false;
		updatelayer=slayer;
//		http_request = createXMLHttp();
		//开始初始化XMLHttpRequest对象
		if(window.XMLHttpRequest){//Mozilla浏览器
			http_request=new XMLHttpRequest();
			if(http_request.ovverrideMimeType){//设置MiME类别
			http_request.overrideMimeType("text/xml;charset=UTF-8");
			}
		}
		else if(window.ActiveXObject){//IE浏览器
			try{
				http_request=new ActiveXObject("Msxml2.XMLHTTP");
			}catch(e){
				try{
					http_request=new ActiveXObject("Microsoft.XMLHTTP");
				}catch(e){}
			}
		}
		if(!http_request){//异常,创建对象实例失败
			window.alert("不能创建XMLHttpRequest对象实例");
			return false;
		}
		http_request.onreadystatechange=FprocessRequest;
		//确定发送请求的方式和URL以及是否同步执行下段代码
		http_request.open("POST",url,true);
		http_request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
		http_request.send(null);
	}
	//处理返回信息的函数
	function FprocessRequest(){
		if(http_request.readyState==4){//判断对象状态
			if(http_request.status==200){//判断已经成功返回,开始处理信息

				document.getElementById(updatelayer).innerHTML=http_request.responseText;
			}else{//页面不正常
				alert("您所请求的页面有异常.");
			}
		}
	}
	
	/*
	
	function createXMLHttp() {
	if (window.XMLHttpRequest) {
		var objXMLHttp = new XMLHttpRequest();
		if (objXMLHttp.readyState == null) {
			objXMLHttp.readyState = 0;
			objXMLHttp.addEventListener(
			"load",
			function () {
				objXMLHttp.readyState = 4;
				if (typeof(objXMLHttp.onreadystatechange) == "function") {
					objXMLHttp.onreadystatechange();
				}
			},
			false
			);
		}
		return objXMLHttp;
	} else if (s_XMLHttpNameCache != null) {
		return new ActiveXObject(s_XMLHttpNameCache);
	} else {
		var MSXML = [
			'MSXML2.XMLHTTP.6.0',
			'MSXML2.XMLHTTP.5.0',
			'MSXML2.XMLHTTP.4.0',
			'MSXML2.XMLHTTP.3.0',
			'MsXML2.XMLHTTP.2.6',
			'MSXML2.XMLHTTP',
			'Microsoft.XMLHTTP.1.0',
			'Microsoft.XMLHTTP.1',
			'Microsoft.XMLHTTP'
		];
		var n = MSXML.length;
		for (var i = 0; i < n; i++) {
			try {
				objXMLHttp = new ActiveXObject(MSXML[i]);
				s_XMLHttpNameCache = MSXML[i];
				return objXMLHttp;
			}
			catch(e) {}
		}
		return null;
	}
}
*/
	
