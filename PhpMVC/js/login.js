/**
 * 使用JQuery，显示错误信息
 */
function errMessage() {
	var queryString = window.top.location.search.substring(1); 

	switch (getParameter(queryString, 'err')) {
		case '1':
			$("#errMessage").html("验证码不对");
			break;
		case '2':
			$("#errMessage").html("用户名为空");
			break;
		case '3':
			$("#errMessage").html("用户不存在");
			break;
		case '4':
			$("#errMessage").html("密码错");
			break;
	}
} 

/**
 * 从URL的GET方式传递的查询串中取某个值
 * @param queryString		查询串(url中?之后的部分，不含问号)
 * @param parameterName		要查询的名称
 * @returns					查询到的值
 */
function getParameter(queryString, parameterName) {  
	// Add "=" to the parameter name (i.e. parameterName=value)  
	var parameterName = parameterName + "=";  

	if (queryString.length > 0) {  
		// Find the beginning of the string  
		begin = queryString.indexOf(parameterName);  
		// If the parameter name is not found, skip it, otherwise return the value  
		if (begin != -1) {  
			// Add the length (integer) to the beginning  
			begin += parameterName.length;  
			// Multiple parameters are separated by the "&" sign  
			end = queryString.indexOf("&", begin);  
			if (end == -1) {  
				end = queryString.length  
			}  

			// Return the string  
            return unescape(queryString.substring(begin, end));  
		}
	}  

    // Return "null" if no parameter has been found  
    return "null";  
} 