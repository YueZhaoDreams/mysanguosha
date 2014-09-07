/**
 * 
 */

pickWuJiang = function(id) {
	var wuJiangCheckBox = document.getElementById("wuJiang" + id)
	if (wuJiangCheckBox.checked) {
		if (zhuFuList.indexOf(id) == -1) {
			zhuFuList.push(id);
			if (zhuFuList.length > 2) {
				var uncheckId=zhuFuList[0];
				document.getElementById("wuJiang"+uncheckId).checked=false;
				zhuFuList.splice(0, 1);
			}
		}
	} else {
		var index = zhuFuList.indexOf(id);
		zhuFuList.splice(index, 1);
	}
	var i = 0;
	if (i < zhuFuList.length) {
		$("#zhuJiang").val(zhuFuList[i]);
		$("#zhuJiangDiv").text($("#wuJiangName" + zhuFuList[i]).val());
	} else {
		$("#zhuJiang").val("");
		$("#zhuJiangDiv").text("");
	}
	i++;
	if (i < zhuFuList.length) {
		$("#fuJiang").val(zhuFuList[i]);
		$("#fuJiangDiv").text($("#wuJiangName" + zhuFuList[i]).val());
	} else {
		$("#fuJiang").val("");
		$("#fuJiangDiv").text("");
	}
}