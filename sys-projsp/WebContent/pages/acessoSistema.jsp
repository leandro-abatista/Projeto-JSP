<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*, java.text.*" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">
<meta name="description" content="Sistema Web com JSP">
<meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0">
<link rel="stylesheet" href="../resources/css/estiloMenu.css">
<link rel="icon" href="../resources/img/icon.png"/>
<title>Menu</title>

</head>

<body>

	<hr>
	
	<nav class="menu">

		<ul>

			<li><a href="#">Home</a>

				<ul>

					<li><a href="#">Início</a></li>

				</ul>
				
			</li>

			<li><a href="#">Cadastro</a>

				<ul>

					<li><a href="servletUsuario?acao=listartodos">Usuários</a></li>
					<li><a href="servletCliente?acao=listartodos">Clientes</a></li>
					<li><a href="servletMedico?acao=listartodos">Médicos</a></li>
					<li><a href="servletProduto?acao=listartodos">Produtos</a></li>
					<li><a href="servletProdutoCsv?acao=listartodos">Produtos CSV</a></li>
					<li><a href="servletBandeira?acao=listartodos">Bandeiras</a></li>
					<li><a href="servletCategoria?acao=listartodos">Categorias</a></li>
					<li><a href="servletEspecialidade?acao=listartodos">Especialidades</a></li>

				</ul>
			
			</li>

			<li><a href="#">Relatório</a></li>

			<li><a href="#">Consulta</a>

				<ul>

					<li><a href="servletConsCli?acao=listartodos">Clientes</a></li>
					<li><a href="#">Médicos</a></li>
					<li><a href="servletConsPro?acao=listartodos">Produtos</a></li>
					<li><a href="#">Produtos CSV</a></li>

				</ul>
				
			</li>

			<li><a href="#">Agendamento</a></li>

			<li><a href="#">Sobre</a>

				<ul>

					<li><a href="#">Sistema</a></li>
					<li><a href="#">Desenvolvedor</a></li>

				</ul>
				
			</li>

			<li><a href="#">Sair</a>

				<ul>

					<li><a href="servletAutenticar?deslogar=true">Logout</a></li>

				</ul>
				
			</li>
			
		</ul>

	</nav>

</body>

</html>