<%@page import="com.projeto1.dao.ProdutoDao"%>
<jsp:useBean id="p" class="com.projeto1.bean.Produto"></jsp:useBean>
<jsp:setProperty property="*" name="p"/>

<%
int i = ProdutoDao.updateProduto(p);
response.sendRedirect("viewprodutos.jsp");
%>