function getPagingData(pageNow, parameter) {
	$.ajax({
		type : "post", // 请求方式
		url : "../control/controler.php?fn=getPagingData&pageNow=2&listRows=1", // 发送请求地址
		dataType : "xml", // 返回数据为xml格式
		data : { // 发送给数据库的数据
			username : $("#username2").val()
		},
		// 请求成功后的回调函数
		success : function(xml) {
			$(xml).find("user").each(function(i){
				var name=$(this).children("name").text();
				var age=$(this).children("age").text();
				var salary=$(this).children("salary").text();
				var phonenumber=$(this).children("phonenumber").text();
				var email=$(this).children("email").text();
				var password=$(this).children("password").text();
				
				// 回填html中form相应的字段
				$("#data1_0").html(name);
				$("#data1_1").html(age);
				$("#data1_2").html(salary);
				$("#data1_3").html(phonenumber);
				$("#data1_4").html(email);
				$("#data1_5").html(password);		
			});
		}
	});
}