<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>


<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">
<meta name="description" content="Sistema Web com JSP">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="resources/css/estiloIndex.css" type="text/css" rel="stylesheet"/>
<link rel="icon" href="resources/img/icon.png"/>

<title>Index</title>

</head>

<body>
	
	<nav>
	 
	 	<p>Sistema WEB com JSP, SERVLET, JDBC E BANCO DE DADOS POSTGRESQL</p>
	 	
	 	<ul>
	 		
	 		<li><a href="#">ACESSO AO SISTEMA</a>
	 		
	 			<ul>
	 			
	 				<li><a href="pages/acessoSistema.jsp">Acessar Sistema</a></li>
	 			
	 			</ul>
	 		
	 		</li>
	 		
	 	</ul>
	 	
	</nav>
	

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