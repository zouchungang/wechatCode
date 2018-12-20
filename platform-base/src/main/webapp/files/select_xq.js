if(navigator.userAgent.indexOf("MSIE")>0){
  //document.getElementById('qy').attachEvent("onpropertychange",txChange);
  document.getElementById('qy').attachEvent("onchange",txChange);
}else if(navigator.userAgent.indexOf("Firefox")>0){
  $("#qy").bind("change", txChange);
}

function txChange(){
  var o = document.getElementById('qy');
  //alert(o.options[o.selectedIndex].value);
  ChangeDistrict(document.getElementById('form2'),o.options[o.selectedIndex].value)
}

function checked(){
  if($('#combox').val()){
		$('#qy')[0].value = $('#combox option:selected').attr('qy');
		/*if(navigator.userAgent.indexOf("Firefox")>0){
		  txChange();
		}*/
		txChange();
		if($('[name="xqy"]')[0])$('[name="xqy"]')[0].value = $('#combox option:selected').attr('xqy');
		if($('[name="house_id"]')[0])$('[name="house_id"]')[0].value = $('#combox').val();
		if($('[name="xqy"]')[0])$('[name="xqy"]')[0].value = $('#combox option:selected').attr('xqy');
		if($('[name="address"]')[0])$('[name="address"]')[0].value = $('#combox option:selected').attr('address');
		if($('[name="wylx"]')[0])$('[name="wylx"]')[0].value = $('#combox option:selected').attr('house_lx');
		if($('[name="house_name"]')[0])$('[name="house_name"]')[0].value = $('#combox option:selected').text();
  }
}