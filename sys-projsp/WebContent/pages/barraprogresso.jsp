<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../resources/css/estiloBarraProgresso.css">
<title></title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	
	<h1>Barra de progresso com javaScript</h1>
	
	<div id="fundoBarProgress">
	
		<div id="carregamento">
		
		</div>
	
	</div>
	<br>
	
	<button onclick="exibirBarra();">Iniciar Barra de Progresso</button>
	
	
	<br>
	<h1>Barra de progresso com jQuery</h1>
	
	<div id="progressbar">
	
		<div class="progress-label">
		
			Carregando...
			
		</div>
	
	</div>

</body>



<script type="text/javascript">

	/*script da barra de progresso com javascript*/
	function exibirBarra() {
		var elem = document.getElementById("carregamento");
		var width = 1;
		var id = setInterval(frame, 10);
			
		function frame() {
			if (width >= 100) {
				clearInterval(id);
			} else {
				width++;
				elem.style.width = width + "%";
			}
		}
	}

	/*script da barra de progresso com jQuery*/
	$(function() {
		var progressbar = $("#progressbar"), progresslabel = $(".progress-label");

		progressbar.progressbar ({//cria a barra no div
			value : false,
			change : function() {
				progresslabel.text(progressbar.progressbar('value') + "%");
			},
			complete: function () {
				progresslabel.text('Completo!');
			}
		});

		function progress() {
			var val = progressbar.progressbar("value") || 0;
			progressbar.progressbar("value", val + 2);
			if (val < 99) {
				setTimeout(progress, 80);/*80 milisegundos*/
			} 
		}

		setTimeout(progress, 2000);/*tempo de 2 segundos para poder iniciar | chmando ao abrir a tela*/
	});

</script>

</html>