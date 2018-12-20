function Zfloat( id ) {
	function $(id){
	  return document.getElementById(id);
	};

 	var diffY;   

	var demo = $(id);

	var lastScrollYChat = 0;


	function ofloat(){ 
		if (document.documentElement && document.documentElement.scrollTop)
			diffY = document.documentElement.scrollTop;
		else if (document.body)
			diffY = document.body.scrollTop
		else{
			//Netscape stuff;
		}
		percent=.1*(diffY-lastScrollYChat); 
		//alert(diffY);clearInterval(roll);
		if(percent>0)percent=Math.ceil(percent); 
		else percent = Math.floor(percent);
//		demo.style.top = parseInt(demo.offsetTop)+percent+"px";
		//clearInterval(roll);
		lastScrollYChat = lastScrollYChat+percent;
	}
	setInterval(ofloat,1);
}
