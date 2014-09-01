<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>Welcome to Grails</title>
<g:javascript library="jquery" plugin="jquery"></g:javascript>
</head>
<body>
	<div class="jumbotron" style="margin-bottom:0px;">
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
				<div class="col-md-6">
					<g:render template="wuJiangList"
						bean="${org.mysanguosha.WuJiang.findAllByShiLi(org.mysanguosha.ShiLi.findByName('魏'),[sort:'winningPercentage',order:'desc']) }" />
				</div>
				<div class="col-md-6">
					<g:render template="wuJiangList"
						bean="${org.mysanguosha.WuJiang.findAllByShiLi(org.mysanguosha.ShiLi.findByName('蜀'),[sort:'winningPercentage',order:'desc']) }" />
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<g:render template="wuJiangList"
						bean="${org.mysanguosha.WuJiang.findAllByShiLi(org.mysanguosha.ShiLi.findByName('吴'),[sort:'winningPercentage',order:'desc']) }" />
				</div>
				<div class="col-md-6">
					<g:render template="wuJiangList"
						bean="${org.mysanguosha.WuJiang.findAllByShiLi(org.mysanguosha.ShiLi.findByName('群'),[sort:'winningPercentage',order:'desc']) }" />
				</div>
			</div>

		</div>
	</div>
	<g:javascript>
	activeLink("wuJiangLink");
	</g:javascript>
</body>
</html>
