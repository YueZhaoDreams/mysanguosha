<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>Welcome to Grails</title>
<g:javascript library="jquery" plugin="jquery"></g:javascript>
<asset:javascript src="record.js" />
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<g:form>
				<div class="row">
					<div class="col-md-3 form-group">
						<label class="col-sm-4" for="zhuJiang">主将：</label>
						<div class="col-sm-8">
							<input type="hidden" id="zhuJiang" name="zhuJiang"></input>
							<div id="zhuJiangDiv"></div>
						</div>
					</div>
					<div class="col-md-3 form-group">
						<label class="col-sm-4" for="fuJiang">副将：</label>
						<div class="col-sm-8">
							<input type="hidden" id="fuJiang" name="fuJiang"></input>
							<div id="fuJiangDiv"></div>
						</div>
					</div>
					<div class="col-md-2">
						<g:actionSubmit name="winBtn" value="Win" class="btn form-control"
							action="addWin" />
					</div>
					<div class="col-md-2">
						<g:actionSubmit name="lostBtn" value="Lost"
							class="btn form-control" action="addLost" />
					</div>
				</div>
				<div class="panel-group" id="accordion">
					<g:each in="${org.mysanguosha.ShiLi.list() }" var="item" status="i">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse${i }"> ${item.name }
									</a>
								</h4>
							</div>
							<div id="collapse${i }" class="panel-collapse collapse ${i==0?"in":"" }">
								<div class="panel-body">
									<div class="row">
										<g:each in="${org.mysanguosha.WuJiang.findAllByShiLi(item) }">
											<div class="col-md-2">
												<div class="checkbox">
													<label> <input type="checkbox" value="${it.id}"
														id="wuJiang${it.id }" onchange="pickWuJiang(${it.id });" />
														<g:hiddenField name="wuJiangName"
															id="wuJiangName${it.id }" value="${it.name }" /> ${it.name}
													</label>
												</div>
											</div>
										</g:each>
									</div>
								</div>
							</div>
						</div>
					</g:each>
				</div>
			</g:form>
		</div>
	</div>
	<g:javascript>
	activeLink("recordLink");
	var zhuFuList=[];
	</g:javascript>
</body>
</html>
