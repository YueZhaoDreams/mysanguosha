<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>武将</title>
<g:javascript library="jquery" plugin="jquery"></g:javascript>
</head>
<body>
	<div class="jumbotron" style="margin-bottom: 0px;">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<g:render template="wuJiangList" bean="${wei}" />
				</div>
				<div class="col-md-6">
					<g:render template="wuJiangList" bean="${shu}" />
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<g:render template="wuJiangList" bean="${wu}" />
				</div>
				<div class="col-md-6">
					<g:render template="wuJiangList" bean="${qun}" />
				</div>
			</div>

		</div>
	</div>
	<g:javascript>
		activeLink("userWuJiangLink");
	</g:javascript>
</body>
</html>
