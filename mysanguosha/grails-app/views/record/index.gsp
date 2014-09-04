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
			<g:form>
				<div class="row">
					<div class="col-md-2">
						<g:actionSubmit name="winBtn" value="Win" class="btn form-control"
							action="addWin" />
					</div>
					<div class="col-md-2">
						<g:actionSubmit name="lostBtn" value="Lost"
							class="btn form-control" action="addLost" />
					</div>
				</div>
				<g:each in="${org.mysanguosha.ShiLi.list() }" var="item">
					<div class="row">
						<div class="col-md-12">
							${item.name}
						</div>
					</div>
					<div class="row">
						<g:each in="${org.mysanguosha.WuJiang.findAllByShiLi(item) }">
							<div class="col-md-2">
								<g:checkBox name="wuJiang" value="${it.id}"
									id="wuJiang${it.id }" checked="false" class="wuJiang" />
								${it.name}
							</div>
						</g:each>
					</div>
					<div class="row">&nbsp;</div>
				</g:each>
			</g:form>
		</div>
	</div>
	<g:javascript>
	activeLink("recordLink");
	</g:javascript>
</body>
</html>
