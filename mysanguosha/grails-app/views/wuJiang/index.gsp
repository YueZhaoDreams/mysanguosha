<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>Welcome to Grails</title>
</head>
<body>
	<div class="jumbotron">
		<div class="container">

			<button type="button" class="btn btn-default">
				<g:link controller="simulator">Simulate</g:link>
			</button>
			<div class="row">
				<div class="col-md-6">
					<g:render template="wuJiangList"
						bean="${org.mysanguosha.WuJiang.findAllByShiLi(org.mysanguosha.ShiLi.findByName('Wei'),[sort:'winningPercentage',order:'desc']) }" />
				</div>
				<div class="col-md-6">
					<g:render template="wuJiangList"
						bean="${org.mysanguosha.WuJiang.findAllByShiLi(org.mysanguosha.ShiLi.findByName('Shu'),[sort:'winningPercentage',order:'desc']) }" />
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<g:render template="wuJiangList"
						bean="${org.mysanguosha.WuJiang.findAllByShiLi(org.mysanguosha.ShiLi.findByName('Wu'),[sort:'winningPercentage',order:'desc']) }" />
				</div>
				<div class="col-md-6">
					<g:render template="wuJiangList"
						bean="${org.mysanguosha.WuJiang.findAllByShiLi(org.mysanguosha.ShiLi.findByName('Qun'),[sort:'winningPercentage',order:'desc']) }" />
				</div>
			</div>

		</div>
	</div>
</body>
</html>
