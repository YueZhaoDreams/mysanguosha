<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><g:layoutTitle default="Grails" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<asset:stylesheet src="application.css" />
<g:layoutHead />
<asset:javascript src="common.js" />
</head>
<body class="soria">
	<nav class="navbar navbar-default" role="navigation"
		style="margin-bottom: 0px;">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">mysanguosha.org</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li id="homeLink"><g:link controller="home">主页</g:link></li>
					<li id="recordLink"><g:link controller="record">记录</g:link></li>
					<li id="wuJiangLink"><g:link controller="wuJiang">武将</g:link></li>
					<li id="userWuJiangLink"><g:link controller="userWuJiang">我的武将</g:link></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><g:link controller="logout" action="">Logout</g:link></li>
				</ul>
			</div>
		</div>
	</nav>
	<g:layoutBody />
	<asset:javascript src="application.js" />
</body>
</html>
