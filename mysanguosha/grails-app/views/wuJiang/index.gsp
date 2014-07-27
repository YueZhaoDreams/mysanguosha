<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<asset:stylesheet src="application.css" />

<title>Welcome to Grails</title>
</head>
<body>
<i class="icon-user"></i>
	<g:render template="wuJiangList"
		bean="${org.mysanguosha.WuJiang.findAllByShiLi(org.mysanguosha.ShiLi.findByName('Wei'),[sort:'winningPercentage',order:'desc']) }" />
	<g:render template="wuJiangList"
		bean="${org.mysanguosha.WuJiang.findAllByShiLi(org.mysanguosha.ShiLi.findByName('Shu'),[sort:'winningPercentage',order:'desc']) }" />
	<g:render template="wuJiangList"
		bean="${org.mysanguosha.WuJiang.findAllByShiLi(org.mysanguosha.ShiLi.findByName('Wu'),[sort:'winningPercentage',order:'desc']) }" />
	<g:render template="wuJiangList"
		bean="${org.mysanguosha.WuJiang.findAllByShiLi(org.mysanguosha.ShiLi.findByName('Qun'),[sort:'winningPercentage',order:'desc']) }" />
	<button type="button" class="btn btn-default"><g:link controller="simulator">Simulate</g:link></button>
</body>
</html>
