<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*, java.text.*" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0">
<link rel="stylesheet" href="../resources/css/estiloMenu.css">
<title>Menu</title>

</head>

<body>

	<nav class="menu">

		<ul>

			<li><a href="#">Home</a>

				<ul>

					<li><a href="#">Início</a></li>

				</ul>
				
			</li>

			<li><a href="#">Cadastro</a>

				<ul>

					<li><a href="#">Cadastro Usuários</a></li>
					

				</ul>
			
			</li>

			<li><a href="#">Relatório</a></li>

			<li><a href="#">Consulta</a>

				<ul>

					

				</ul>
				
			</li>

			<li><a href="#">Agendamento</a></li>

			<li><a href="#">Sobre</a>

				<ul>

					<li><a href="#">Sobre o Sistema</a></li>
					<li><a href="#">Sobre o Desenvolvedor</a></li>

				</ul>
				
			</li>

			<li><a href="#">Sair</a>

				<ul>

					<li><a href="pages/servletAutenticar?deslogar=true">Logout</a></li>

				</ul>
				
			</li>
			
		</ul>

	</nav>

</body>

</html>