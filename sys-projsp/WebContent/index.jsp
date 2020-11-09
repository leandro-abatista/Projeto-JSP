<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>


<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<title>Insert title here</title>

</head>

<body>

	<h2>Recursos Avançados em Java Usando JSP</h2>
	
	<table>
		<tbody>
		
			<tr>
			
				<td><a href="pages/capturarExcecoes.jsp"></a>Captura exceções</td>
				
			</tr>
			
			<tr>
				
				<td><a href="pages/acessoSistema.jsp">Acessar o sistema</a></td>
			
			</tr>
			
			<tr>
			
				<td><a href="pages/paginaPai.jsp">Load jQuery</a></td>
				
			</tr>
			
		</tbody>
	</table>

</body>

<script type="text/javascript">

		function testarExceção() {
			valorInformado = $('#txtValor').val();


			/*Usando ajax do jQuery*/
			$.ajax({

				method: "POST",
				url: "servletCapturarExcecao",//para qual servlet?
				//data: {"variavel" : "valor"}
				data: {valorParam : valorInformado}

			})
			.done(function(response){//sempre capta um retorno, ou sucess ou fail

				alert("Sucesso: " + response);//resposta sucess

			})
			.fail(function(xhr, status, errorThrown){//sempre capta um retorno, ou sucess ou fail

				alert("Erro: " + xhr.responseText);//resposta fail

				//fazer alfo se der errado

			});
			
		}

	</script>

</html>