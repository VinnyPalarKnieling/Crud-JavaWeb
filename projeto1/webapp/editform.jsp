<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ALTERAÇÃO DO PRODUTO</title>
<style>
	@font-face{
		font-family: Londrina Shadow;
		src: url('Londrina Shadow.ttf');
	}
	.fonte-externa {
		font-family: Londrina Shadow;
	}
	html body {
		background-color: black;
		color: #7FFF00;
	}
	body div{
		display: flex;
	    width: 90%;
	    height: 123px;
	    margin: 0 auto;
	    border: 2px dashed black;
	}
	h1{
		color:white;
		position: fixed;
		margin: 5px 520px;
		font-size: 50px;
		margin-right: auto;
	}
	form{
		margin: 150px auto;
		position: absolute;
		margin-left: 500px;
	}
	th{
		color: white;
		padding: 5px;
	}
	td{
		color: black;
		text-align: center;
		padding: 5px;
		font-size: 25px;
	}
	input[type=text]{
		border-radius: 6px;
		background-color: lightblue;
	    padding: 6px 20px;
	    margin: 10px 0px;
	    width: 200px;
	    font-size: 20px;
		}
	input[type=submit]{
		border-radius: 6px;
		padding: 8px 15px;
		font-size: 20px;
		align-items: center;
		position: absolute;
		margin-left: 55%;
		margin-top: 290px;
		background-color: #191970;
		color: white;
	}
	a{
		color: green;
	}
	h5{
		position: absolute;
		display: inline-block;
		margin: 330px -30px;
		font-size: 10px;
	}
	img {
		position: fixed;
		margin: -80px 128px;
		height: 900px;
		width: 1000px;
	}
</style>

</head>
<body>
<%@page import="com.projeto1.bean.Produto, com.projeto1.dao.ProdutoDao" %>

<%
	String id = request.getParameter("id");
	Produto produto = ProdutoDao.getRegistroById(Integer.parseInt(id));
%>

<img src="https://sakamobi.com/wp-content/uploads/2021/05/0e7c405ac38f8d776078083a003f2725.png"/>

<h1 class="fonte-externa" >ALTERAÇÃO DO PRODUTO</h1>

<form action="editproduto.jsp" method="post">
	<input type="hidden" name="id" value="<%=produto.getId()%>"/>
	<table>
		<tr>
			<td>Nome: </td>
			<td><input type="text" name="nome" value="<%=produto.getNome()%>"/></td>
		</tr>
		<tr>
			<td>Categoria: </td>
			<td><input type="text" name="categoria" value="<%=produto.getCategoria()%>"/></td>
		</tr>
		<tr>
			<td>Valor: </td>
			<td><input type="text" name="valor" value="<%=produto.getValor()%>"/></td>
		</tr>
		<tr>
			<td>Quantidade: </td>
			<td><input type="text" name="quantidade" value="<%=produto.getQuantidade()%>"/></td>
		<tr>
			<td colspan="2">
			</tr>
			<input type="submit" value="Editar"></input></td>
		</tr>
		
		<h5><a href="home.html"> VOLTAR</a></h5>
	</table>
</form>

</body>
</html> 