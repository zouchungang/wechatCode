function setTag(jtags){
		var taglenth;
		if ( document.getElementById("tag").value == "" ){
			document.getElementById("tag").value = jtags;
		}
		else if (document.getElementById("tag").value.indexOf(jtags) > -1){
			return false;
		}
		else {
			taglenth=document.getElementById("tag").value + " " + jtags;
			if (taglenth.length < 50){
				document.getElementById("tag").value += " " + jtags;
			}		
		}
	}
function setTag2(jtags){
		if ( document.getElementById("furniture").value == "" ){
			document.getElementById("furniture").value = jtags;
		}
		else if (document.getElementById("furniture").value.indexOf(jtags) > -1){
			return false;
		}
		else {
				document.getElementById("furniture").value += " " + jtags;
		}
	}
	

function SearchForProperty(SID)
{	if (SID!=''){
	document.getElementById("prolist").innerHTML='<font color=red>请稍等，数据加载中……</font>';
	Fsend_request('group.php?key='+SID,"prolist");
	document.getElementById("prodiv").style.display='';
	}else{
		document.getElementById("prolist").innerHTML='';
		document.getElementById("prodiv").style.display='none';
		}
}

function SearchForProperty2(SID)
{	if (SID!=''){
	document.getElementById("prolist").innerHTML='<font color=red>请稍等，数据加载中……</font>';
	Fsend_request('group2.php?key='+SID,"prolist");
	document.getElementById("prodiv").style.display='';
	}else{
		document.getElementById("prolist").innerHTML='';
		document.getElementById("prodiv").style.display='none';
		}
}

function selectedone(thone,thid,thla,thbs)
{
	if(thone.options[thone.selectedIndex].value=="")
	{	if(confirm('易居网发布房源采取的是先选择一个楼盘(或小区)，然后再发布房源的方法。\n如果您要发布房源的楼盘在列表中不存在，请先添加该楼盘。\n\n(注：添加楼盘时请不要出现和楼盘名称无关的文字或符号。)\n\n您确认需要添加楼盘或小区吗？')){
			Scrover();
			AddProperty();
		}
	}
	else
	{
		document.getElementById(thid).value=thone.options[thone.selectedIndex].value;
		document.getElementById(thbs).value=thone.options[thone.selectedIndex].text.substring(0,thone.options[thone.selectedIndex].text.lastIndexOf("[")-1);
		document.getElementById(thla).style.display='none';
	}
}

function selectedone_new(thone,thid,thla,thbs)
{
	    id = thone.options[thone.selectedIndex].value;
//新加,读取小区图片数
if(document.getElementById('xq_pic_num')){
	Zly.ajax({
	   type: "POST",
	   url: "get_pic.php?time="+new Date().getTime(),
	   data: "id="+id+"&action=getnum&model=xiaoqu",
	   success : function( msg ){
		 var data = eval('('+msg+')');
		 if(data.num>0){
	       var html = "<input value='小区图共"+data.num+"张,点击展开' type='button' onclick='look_xq_pic()'>";
		   document.getElementById('xq_pic_num').innerHTML = html;
		   document.getElementById('xq_pic_num').style.display = 'block';
		   document.getElementById('xq_pic_num').className = 'click1';
		 }else{
		   document.getElementById('xq_pic_num').innerHTML = '';
		   document.getElementById('xq_pic_num').style.display = 'none';
		 }
		 if(data.num > 30){
		   u_num = 30;
		 }else{
		   u_num = data.u_num;
		 }
		 if(u_num>=5){
		   if(data.num > 30){
			 $('#xiaoqu_msg').append('<span id="num_msg" style="color:#FF0000">小区图片已超过30张,已无法上传,请从小区图片集中选择</span>');	   
		   }else{
			 $('#xiaoqu_msg').append('<span id="num_msg" style="color:#FF0000">您今天已经上传了超过5张此小区图,请明天再上传</span>');
		   }
		   $('#xiaoqu_rm').html('');
		   $('#xiaoqu_add_input').html('');
		 }
	   },
	   error : function( msg ){
	   }
	});
}
//读取户型图片数
if(document.getElementById('hx_pic_num')){
	Zly.ajax({
	   type: "POST",
	   url: "get_pic.php?time="+new Date().getTime(),
	   data: "id="+id+"&action=getnum&model=huxing",
	   success : function( msg ){
		 if(msg>0){
	       var html = "<input value='户型图共"+msg+"张,点击展开' type='button' onclick='look_xh_pic()'>";
		   document.getElementById('hx_pic_num').innerHTML = html;
		   document.getElementById('hx_pic_num').style.display = 'block';
		   document.getElementById('hx_pic_num').className = 'click1';
		 }else{
		   document.getElementById('hx_pic_num').innerHTML = '';
		   document.getElementById('hx_pic_num').style.display = 'none';		 
		 }
	   },
	   error : function( msg ){
	   }
	});
}
	if(thone.options[thone.selectedIndex].value=="")
	{	if(confirm('易居网发布房源采取的是先选择一个楼盘(或小区)，然后再发布房源的方法。\n如果您要发布房源的楼盘在列表中不存在，请先添加该楼盘。\n\n(注：添加楼盘时请不要出现和楼盘名称无关的文字或符号。)\n\n您确认需要添加楼盘或小区吗？')){
			
			Scrover();
			AddProperty();
			
		}
	}
	else
	{
		//document.getElementById(thid).value=thone.options[thone.selectedIndex].value;
		//document.getElementById(thbs).value=thone.options[thone.selectedIndex].text.substring(0,thone.options[thone.selectedIndex].text.lastIndexOf("[")-1);
		document.getElementById(thla).style.display='none';
	}
}

function selectedone2(thone,thid,thla,thbs)
{
	if(thone.options[thone.selectedIndex].value=="")
	{	if(confirm('易居网发布房源采取的是先选择一个楼盘(或小区)，然后再发布房源的方法。\n如果您要发布房源的楼盘在列表中不存在，请先添加该楼盘。\n\n(注：添加楼盘时请不要出现和楼盘名称无关的文字或符号。)\n\n您确认需要添加楼盘或小区吗？')){
			Scrover();
			AddProperty2();
		}
	}
	else
	{
		document.getElementById(thid).value=thone.options[thone.selectedIndex].value;
		document.getElementById(thbs).value=thone.options[thone.selectedIndex].text.substring(0,thone.options[thone.selectedIndex].text.lastIndexOf("[")-1);
		document.getElementById(thla).style.display='none';
	}
}

function AddProperty()
	{	document.getElementById("cerrform").innerHTML="<iframe id=\"popDiv\" frameborder=\"0\" scrolling=\"no\"></iframe>";
		document.getElementById("cerrform").style.display='';		
		document.getElementById("popDiv").src="add_xq.php";		
		document.getElementById("popDiv").width="318";
		document.getElementById("popDiv").height="180";
	}


function AddProperty2()
	{	document.getElementById("cerrform").innerHTML="<iframe id=\"popDiv\" frameborder=\"0\" scrolling=\"no\"></iframe>";
		document.getElementById("cerrform").style.display='';		
		document.getElementById("popDiv").src="add_office.php";		
		document.getElementById("popDiv").width="318";
		document.getElementById("popDiv").height="180";
	}

