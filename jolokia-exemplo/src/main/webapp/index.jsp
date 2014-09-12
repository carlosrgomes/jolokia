<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<script src="./resources/js/jquery-1.7.2.min.js"></script>
<script src="./resources/js/json2.js"></script>
<script src="./resources/js/jolokia.js"></script>
<script src="./resources/js/jolokia-simple.js"></script>
<script src="./resources/js/d3.js"></script>
<script src="./resources/js/cubism.js"></script>
<script src="./resources/js/jolokia-cubism.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	//Create a top-level Cubism Context
	var context = cubism.context();

	// Create a source for Jolokia metrics pointing to the agent 
	// at 'http://jolokia.org/jolokia'
	var jolokia = context.jolokia("http://localhost:8080/jolokia-exemplo/jolokia");

	// Create a metric for the absolute Heap memory usage
	var memoryAbs = jolokia.metric({
	                    type: 'read', 
	                    mbean: 'java.lang:type=Memory',
	                    attribute: 'HeapMemoryUsage',
	                    path: 'used'
	                },"HeapMemory Usage");

	 // Use d3 to attach the metrics with a specific graph type 
	 // ('horizon' in this case) to the document
	 d3.select("#charts").call(function(div) {
	     div.append("div")
	         .data([memoryAbs])
	         .call(context.horizon())
	 });
	});


</script>


</head>
<body>
<div id="charts">
	
</div>

</body>
</html>
