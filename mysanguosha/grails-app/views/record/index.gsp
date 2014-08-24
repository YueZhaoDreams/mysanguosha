<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>Welcome to Grails</title>
<g:javascript library="jquery" plugin="jquery"></g:javascript>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<div class="row">
				<div class="col-md-2">
					<button type="button" class="btn btn-default">
						<g:remoteLink controller="simulator" action="index"
							update="result">Simulate</g:remoteLink>
					</button>
				</div>
				<div class="col-md-10" id="result"></div>
			</div>
			<div class="row">
				<div class="col-md-3">
					<g:radio name="shiLi" value="0" />
					魏
				</div>
				<div class="col-md-3">
					<g:radio name="shiLi" value="1" />
					蜀
				</div>
				<div class="col-md-3">
					<g:radio name="shiLi" value="2" />
					吴
				</div>
				<div class="col-md-3">
					<g:radio name="shiLi" value="3" />
					群
				</div>
			</div>
			<div class="row" id="pairList">
				<div class="col-md-6">
					<g:each
						in="${org.mysanguosha.WuJiang.findAllByShiLi(org.mysanguosha.ShiLi.findByName('Wei'),[sort:'winningPercentage',order:'desc']) }">
						<div class="row">
							<g:radio name="zhuJiang" value="${it.id }" />
							${it.name}
						</div>
					</g:each>
				</div>
				<div class="col-md-6">
					<g:each
						in="${org.mysanguosha.WuJiang.findAllByShiLi(org.mysanguosha.ShiLi.findByName('Wei'),[sort:'winningPercentage',order:'desc']) }">
						<div class="row">
							<g:radio name="fuJiang" value="${it.id }" />
							${it.name}
						</div>
					</g:each>
				</div>
			</div>
		</div>
	</div>
	<g:javascript>
	activeLink("recordLink");
	</g:javascript>
</body>
</html>
