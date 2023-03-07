<%@ tag body-content="scriptless" pageEncoding="UTF-8" %>
<%@ attribute name="title" %>
<%@ attribute name="colName" %>

<jsp:useBean id="product" class="chap10.Product" />

<h2><jsp:doBody /></h2>
<hr />
<h4>${title}</h4>

<table>
	<tr><th>${colName}</th></tr>
	
	<%
	for(String prod:product.getProductList()){
		out.println("<tr><td>" + prod + "</td></tr>");
	}
	%>
</table>


