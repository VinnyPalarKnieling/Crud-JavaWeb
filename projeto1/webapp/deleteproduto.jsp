<%@ page import="com.projeto1.dao.ProdutoDao"%>
<jsp:useBean id="p" class="com.projeto1.bean.Produto"></jsp:useBean>
<jsp:setProperty property="*" name="p"/>

<%
	ProdutoDao.deletarProduto(p);
	response.sendRedirect("viewprodutos.jsp");
%>