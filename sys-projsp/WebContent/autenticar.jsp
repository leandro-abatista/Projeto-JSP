<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<title>Autenticar</title>
</head>

<body>

	<h1>Autenticar Para Acesso ao Sistema</h1>
	
	<form id="formulario" action="servletAutenticacao" method="post">
	
		<input type="hidden" id="url" name="url" value="<%= request.getParameter("url")%>">
		
		<table>
			<!-- primeira linha da tabela -->
			<tr>
			
				<td>Login: </td>
				<td><input type="text" id="login" name="login"></td>			
			
			</tr>
			<!-- segunda linha da tabela -->
			<tr>
			
				<td>Senha: </td>
				<td><input type="password" id="senha" name="senha"></td>			
			
			</tr>
			
			<!-- terceira linha da tabela -->
			<tr>
			
				<td></td>
				<td><input type="submit" id="logar" name="logar" value="Logar"></td>			
			
			</tr>
		
		</table>
	</form>

</body>

</html>