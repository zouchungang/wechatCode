<!--
function CheckIsNull(obj,msg)
{
	if(obj.value=="")
	{
		alert(msg);
		obj.focus();
		return false;
	}
	return true;
}
function CheckIsNumeric(obj,msg)
{
	var reg=/^[0-9]*$/
	if(!reg.exec(obj.value))
	{
		alert(msg);
		obj.focus();
		return false;
	}
	return true;
}
function fontZoom(size)
{
	document.getElementById('fontzoom').style.fontSize=size+'px'
}

function openwin(page,size)
{
window.open(page,"newuser","toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,"+ size);
} 

function mOvr(src,clrOver) { if (!src.contains(event.fromElement)){ src.bgColor = clrOver; }}function mOut(src,clrIn){ if (!src.contains(event.toElement)) { src.style.cursor = 'hand'; src.bgColor = clrIn; }} function mClk(src) { if(event.srcElement.tagName=='TD'){src.children.tags('A')[0].click();} }

function getObj(name)
{
	var obj = null;
  if (document.getElementById)
    obj = document.getElementById(name);
  else if (document.layers)
    obj = document.layers[name];
  else if (document.all)
    obj = document.all[name];

	return obj;
}

function showObj(name, show)
{
	obj = getObj(name);
	obj.style.visibility = (show)?visible:hidden;
}
function ChgView(id)
{
	if(id)
	{
		getObj('gj').className='yshow';
		getObj('st').className='nshow';
	}
	else
	{
		getObj('gj').className='nshow';
		getObj('st').className='yshow';
	}
}

function check_num(pObj,errMsg){
	var obj = eval(pObj);
	strRef = "1234567890.";
//	if(!isEmpty(pObj,errMsg))return false;
	for (i=0;i<obj.value.length;i++) 
	{
		tempChar= obj.value.substring(i,i+1);
		if (strRef.indexOf(tempChar,0)==-1) 
		{
			if (errMsg == null || errMsg =="")
			{alert("数据不符合要求,请检查");}
			else{alert(errMsg);}
			if(obj.type=="text"){obj.focus();}
			return false; 
		}
	}
	return true;
}

-->