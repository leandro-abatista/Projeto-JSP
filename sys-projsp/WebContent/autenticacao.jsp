<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>


<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">
<link href="resources/css/estiloLogin.css" type="text/css" rel="stylesheet"/>

<title>Autenticação</title>
</head>

<body>
	
	<div class="form">
	
		<h1>Login</h1>
		
			<form action="servletAutenticar" method="post">
			
				<input id="url" name="url" type="hidden" readonly="readonly" value="<%= request.getParameter("url")%>"/>
				
				<label>Usuário:</label>
				<input type="text" id="login" name="login" placeholder="Informe o usuário" required="required"/>
					
				<label>Senha:</label>
				<input type="password" id="senha" name="senha" placeholder="Informe a senha" required="required"/>
					
				<button type="submit" class="btn" value="logar">Acessar</button>
			
			</form>
	
	</div>

</body>

</html>