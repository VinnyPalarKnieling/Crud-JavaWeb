
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LISTAGEM DE PRODUTOS</title>
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
		position: absolute;
		margin: 20px 400px;
		font-size: 50px;
	}
	th{
		color: white;
		padding: 5px;
	}
	td{
		color:olive;
		text-align: center;
		padding: 5px;
	}
	a{
		text-decoration: none;
		color: green;
	}
	table{
		font-size: 25px;
		color: #7FFF00;
		border-color: white;
		position: absolute;
		margin: 150px 247px;
	}
	img{
		position: absolute;
		margin: 90px 158px;
		height: 600px;
		width: 1000px;
	}
	h5{
		color: #7FFF00;
		position: absolute;
		display: inline-block;
		margin: 500px 155px;
		font-size: 10px;
	}
</style>
</head>
<body>

	<img src="https://th.bing.com/th/id/R.f6da3c0dbdedad03b94048c286a1a0d9?rik=AYvUaVDwGvfjNA&riu=http%3a%2f%2fpluspng.com%2fimg-png%2f-2472.png&ehk=Yxu2jBqfCXGb7D0AvDK4vh3jXNWlkdiDVH0DFgtjGSo%3d&risl=&pid=ImgRaw&r=0"/>
	
	<%@ page import="com.projeto1.dao.ProdutoDao,com.projeto1.bean.*,java.util.*"%> <!-- manipulando código Java em JSP --> 
	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
	<div class="lc">
    
    <h1 class="fonte-externa">Listagem de Produtos</h1>
    
    <%
        List<Produto> list = ProdutoDao.getAllProdutos();
                    request.setAttribute("list", list);
        %>
    
   <!-- construindo tabela -->
    <table border="1">
   	<tr>
   		<th>Codigo</th>
   		<th>Nome</th>
   		<th>Categoria</th>
   		<th>Valor</th>
   		<th>Quantidade</th>
   		
   	</tr>
    <c:forEach items="${list}" var="produto">
	<tr>
		<td>${produto.getId()}</td>
		<td>${produto.getNome()}</td>
		<td>${produto.getCategoria()}</td>
		<td>${produto.getValor()}</td>
		<td>${produto.getQuantidade()}</td>
		<td><a href="editform.jsp?id=${produto.getId()}">Editar</a></td>
		<td><a href="deleteproduto.jsp?id=${produto.getId()}">Excluir</a></td>
	</tr>
    </c:forEach>
    </table>
   
   	<h5><a href="home.html"> VOLTAR</a></h5>
   </div>
</body>
</html>

			