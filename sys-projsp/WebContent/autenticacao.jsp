<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">
<meta name="description" content="Sistema Web com JSP">
<link rel="stylesheet" type="text/css" href="resources/css/estiloAutenticar.css">
<link rel="icon" href="resources/img/icon.png"/>
<title>Tela Autenticar</title>
</head>

<body>

	<h1>Seja Bem Vindo ao Sistema de Gerenciamento WEB em JSP</h1>

	<div class="caixaLogin">
	
		<div class="img-user">
			<img alt="" src="resources/img/user-login.png">
		</div>
		
		<h2>Logar no Sistema</h2>
		
		<form action="servletAutenticar" method="post">
		
			<input id="url" name="url" type="hidden" readonly="readonly" value="<%= request.getParameter("url")%>"/>
		
			<div class="campo">
				<input type="text" id="login" name="login" required="required">
				<label>Usuário</label>
			</div>
			
			<div class="campo">
				<input type="password" id="senha" name="senha" required="required">
				<label>Senha</label>
			</div>
			
			<input type="checkbox" checked="checked" class="checkbox">
			<label class="checkbox2">Lembrar-me</label><br><br>
			
			<button type="submit" value="logar">Acessar</button>
			
			<p id="cadastro">Efetuar Cadastro</p>
			
		</form>
	
	</div>
	
	<div>
		
		<h5></h5>
	
	</div>

</body>

</html>