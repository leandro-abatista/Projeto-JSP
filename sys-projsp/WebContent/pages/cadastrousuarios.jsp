
<%@page import="br.com.sysprojsp.classes.model.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" type="text/css" href="../resources/css/estiloCadastro.css"/>
<link rel="stylesheet" type="text/css" href="../resources/css/estiloTable.css"/>

<!-- ara a mascara funcionar tem que colocar estas bibliotecas abaixo -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<link rel="icon" href="../resources/img/icon.png">
<title>Cadastro de Usuários</title>
</head>

<body>

	<section>
	
		<form id="formulario" action="servletUsuario" method="post">
		
			<a class="div-a" href="acessoSistema.jsp"><img alt="home" src="../resources/img/home1.png"> Menu</a>
		
			<div class="div-cadastrousuario">
				<h1>[ - Cadastro de Usuários - ]</h1>
			</div>
			
			<div class="div-dadosusuario">
				<h2>[ - Dados do Usuário - ]</h2>
			</div>
			
			<div class="div-h4">
				<h4>Campos obrigatórios com (*)</h4>
			</div>
			
			<div id="div-mensagem" class="div-h3">
				<h3>${msg}</h3>
			</div>
			
			<!-- agrupa os campos -->
			<fieldset>
			
				<fieldset class="grupo">
						
					<div class="campo">
						
						<label for="id">Código:</label>
						<input type="text" id="id" name="id" style="width: 8em;" 
						value="${user.id}" readonly="readonly">
						
					</div>
						
				</fieldset>
				
				<fieldset class="grupo">
					
					<div class="campo">
						
						<label for="primeironome">Nome:*</label>
						<input type="text" id="primeironome" name="primeironome" style="width: 15em;" 
						value="${user.primeironome}" required="required" autofocus="autofocus">
						
					</div>
						
					<div class="campo">
						
						<label for="sobrenome">Sobrenome:*</label>
						<input type="text" id="sobrenome" name="sobrenome" style="width: 15em;" 
						value="${user.sobrenome}" required="required">
						
					</div>
						
					<div class="campo">
						
						<label for="ultimonome">Último Nome:*</label>
						<input type="text" id="ultimonome" name="ultimonome" style="width: 15em;" 
						value="${user.ultimonome}" required="required">
						
					</div>
				
				</fieldset>
				
				<fieldset class="grupo">
					
					<div class="campo">
						
						<label for="login">Usuário:*</label>
						<input type="text" id="login" name="login" style="width: 20em;" 
						value="${user.login}" required="required">
					
					</div>
					
					<div class="campo">
						
						<label for="senha">Senha:*</label>
						<input type="password" id="senha" name="senha" style="width: 20em;" 
						value="${user.senha}" required="required">
					
					</div>
				
				</fieldset>
				
				<fieldset class="grupo">
					
					<div class="campo">
						
						<label for="telefone">Tel. Celular:*</label>
						<input type="text" id="telefone" name="telefone" style="width: 10em;" 
						value="${user.telefone}" required="required"
						onkeypress="$(this).mask('(00) 9.0000-0000')">
					
					</div>
					
					<div class="campo">
						
						<label for="email">E-mail:*</label>
						<input type="text" id="email" name="email" style="width: 25em;" 
						value="${user.email}" required="required">
					
					</div>
				
				</fieldset>
				
				<fieldset class="grupo">
					
					<div class="campo">
						
						<label for="ativo">Ativo:</label>
						<input type="checkbox" id="ativo" name="ativo"
							<%
								if(request.getAttribute("user") != null){
									
									Usuario u = (Usuario) request.getAttribute("user");
									
									if(u.isAtivo()){
										out.print(" ");
										out.print("checked=\"checked\"");
										out.print(" ");
									}
								}
							%>
						>
						
					</div>
					
					<div class="campo">
						
						<label>Perfil:*</label>
						<select id="perfil" name="perfil">
						
							<option disabled="disabled" selected="selected">Selecine uma Opção</option>
							
							<option value="administrador"
								
								<%
									if(request.getAttribute("user") != null){
										
										Usuario u = (Usuario) request.getAttribute("user");
										
										if(u.getPerfil().equalsIgnoreCase("administrador")){
											out.print(" ");
											out.print("selected=\"selected\"");
											out.print(" ");
										}
									}
								%>
							
							>Administrador</option>
							
							<option value="usuario"
								
								<%
									if(request.getAttribute("user") != null){
										
										Usuario u = (Usuario) request.getAttribute("user");
										
										if(u.getPerfil().equalsIgnoreCase("usuario")){
											out.print(" ");
											out.print("selected=\"selected\"");
											out.print(" ");
										}
									}
								%>
							
							>Usuário</option>
							
							<option value="secretario"
								
								<%
									if(request.getAttribute("user") != null){
										
										Usuario u = (Usuario) request.getAttribute("user");
										
										if(u.getPerfil().equalsIgnoreCase("secretario")){
											out.print(" ");
											out.print("selected=\"selected\"");
											out.print(" ");
										}
									}
								%>
							
							>Secretario(a)</option>
							
							<option value="gerente"
								
								<%
									if(request.getAttribute("user") != null){
										
										Usuario u = (Usuario) request.getAttribute("user");
										
										if(u.getPerfil().equalsIgnoreCase("gerente")){
											out.print(" ");
											out.print("selected=\"selected\"");
											out.print(" ");
										}
									}
								%>
							
							>Gerente</option>
							
						</select>
					
					</div>
				
				</fieldset>
				
					
				<button id="addModal" type="submit" class="botao submit" value="Salvar">Salvar</button>
				
				<button type="submit" class="botao submit" value="Cancelar"
				onclick="document.getElementById('formulario').action = 'servletUsuario?acao=reset'">Cancelar</button>
				
			
			</fieldset>
		
		</form>
		
	</section>
	<!-- Inicio do campo de pesquisa -->
	<section>
		
		<form action="servletPesquisa" method="post">
			
			<fieldset class="grupo">
			
				<div class="campoPesquisar">
				
					<label for="descricaoconsulta">Pesquisar:</label>
					<input type="text" id="descricaoconsulta" name="descricaoconsulta">
					
				</div>
				
				<button type="submit" class="botaoPesquisar" value="Pesquisar">Buscar</button>
			
			</fieldset>
		
		</form>
	
	</section>
	<!-- Fim do campo de pesquisa -->	
	<section>
	
		<div class="caption">Usuários Cadastrados</div>
	
		<div class="tbl-header">
			
			<table>
			
					<thead>
					
						<tr>
							<th style="width: 8%; text-align: center;">Código</th>
							<th style="width: 25%; text-align: center;">Nome</th>
							<th style="width: 20%; text-align: center;">Login</th>
							<th style="width: 20%; text-align: center;">Senha</th>
							<th style="width: 15%; text-align: center;">Telefone</th>
							<th style="width: 20%; text-align: center;">E-mail</th>
							<th style="width: 8%; text-align: center;">#</th>
							<th style="width: 8%; text-align: center;">#</th>
							<th style="width: 8%; text-align: center;">#</th>
						</tr>
						
					</thead>
					
			</table>
			
		</div>
		
		<div class="tbl-content">
		
			<table>
			
				<tbody>
				
					<c:forEach items="${usuarios}" var="user">
					
						<tr>
							
							<td id="id${user.id}" style="width: 8%;"><c:out value="${user.id}"></c:out></td>				
							<td id="primeironome${user.id}" style="width: 25%;"><c:out value="${user.primeironome} ${user.sobrenome} ${user.ultimonome}"></c:out></td>				
							<td id="login${user.id}" style="width: 20%;"><c:out value="${user.login}"></c:out></td>				
							<td id="senha${user.id}" style="width: 20%;"><c:out value="${user.senha}"></c:out></td>				
							<td id="telefone${user.id}" style="width: 15%;"><c:out value="${user.telefone}"></c:out></td>				
							<td id="email${user.id}" style="width: 20%;"><c:out value="${user.email}"></c:out></td>				
							
							<td style="width: 8%;">
								<a href="servletUsuario?acao=update&user=${user.id}" type="button">
								<img alt="update" src="../resources/img/edit.png" title="Atualizar" 
								style="width: 24px; height: 24px;">
								</a>
							</td>	
							
										
							<td style="width: 8%;">
								<a href="servletUsuario?acao=delete&user=${user.id}" type="button"
								data-confirm='Tem certeza que deseja apagar o registro selecionado?'>
								<img alt="delete" src="../resources/img/excluir.png" title="Excluir" 
								style="width: 24px; height: 24px;">
								</a>
							</td>
							
							<td style="width: 8%;">
								<a href="servletUsuario?acao=delete&user=${user.id}" type="button" 
								class="btn btn-primary visualizar" data-toggle="modal" data-target="#dialogDados">
								<img alt="visualizar" src="../resources/img/documento.png" title="Visualizar" 
								style="width: 24px; height: 24px;">
								</a>
							</td>				
						
						</tr>
				
					</c:forEach>
				
				</tbody>
		
			</table>
		
		</div>
		
	</section>
	
	<div id="msg" class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header bg-success text-white">
		        <h5 class="modal-title" id="exampleModalLabel">Usuário</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		       <p>Registro Cadastrado com Sucesso!</p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-outline-info" data-dismiss="modal">Fechar</button>
		    
		      </div>
		    </div>
		  </div>
		</div>	
		
		
		
		<!-- Modal -->
		<div class="modal fade" id="dialogDados" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header bg-primary text-white">
		        <h5 class="modal-title" id="staticBackdropLabel">Dados do Usuário</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      
		      	
		      		
		      		<table id="tabelaDados">
		      		
		      		
		      			
		      		
		      		
		      		</table>
		      	
		      	
		      	
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
		      </div>
		    </div>
		  </div>
		</div>
	
	<script type="text/javascript">

		/*script para janela de confirmação de exclusão de registro*/
		$(document).ready(function() {
			$('a[data-confirm]').click(function(ev){
				var href = $(this).attr('href');
				if (!$('#confirm-delete').length) {
					$('body').append('<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"><div class="modal-dialog" role="document"><div class="modal-content"><div class="modal-header bg-danger text-white">Excluir Registro<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button></div><div class="modal-body">Tem certeza que deseja apagar o registro selecionado?</div><div class="modal-footer"><button type="button" class="btn btn-success" data-dismiss="modal">Cancelar</button><a type="button" class="btn btn-danger text-white" id="dataConfirmOK">Apagar</a></div></div></div></div>');
				}
				$('#dataConfirmOK').attr('href', href);
				$('#confirm-delete').modal({show:true});
				return false;

			}); 		
		});

		
		$().ready(function() {
			setTimeout(function () {
				$('#div-mensagem').hide(); // "foo" é o id do elemento que seja manipular.
			}, 3000); // O valor é representado em milisegundos.
		});

		
		/*===================================================================================================================================*/
			
		

		/*===================================================================================================================================*/
	</script>
	
</body>

</html>