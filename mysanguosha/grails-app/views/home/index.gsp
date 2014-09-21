<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>mysanguosha.org</title>
<g:javascript library="jquery" plugin="jquery"></g:javascript>
<asset:javascript src="record.js" />
</head>
<body>
	<div class="jumbotron">
		<g:form>
			<div class="row">
				<div class="col-md-2 form-group">
					<label class="col-sm-6" for="zhuJiang">主将：</label>
					<div class="col-sm-6">
						<input type="hidden" id="zhuJiang" name="zhuJiang"></input>
						<div id="zhuJiangDiv"></div>
					</div>
				</div>
				<div class="col-md-2 form-group">
					<label class="col-sm-6" for="fuJiang">副将：</label>
					<div class="col-sm-6">
						<input type="hidden" id="fuJiang" name="fuJiang"></input>
						<div id="fuJiangDiv"></div>
					</div>
				</div>
				<div class="col-md-3" id="pair"></div>
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
							<div class="panel-title row">
								<div class="col-md-1">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse${i }"> ${item.name }
									</a>
								</div>
								<g:each
									in="${org.mysanguosha.WuJiang.findAllByShiLi(item,[sort:"winningPercentage",order:"desc",max:3]) }"
									status="j" var="it">
									<div class="col-md-3">
										<div class="checkbox">
											<label> <input type="checkbox" value="${it.id}"
												hidden id="wuJiang${it.id }"
												onchange="pickWuJiang(${it.id });" />
												<table>
													<tr>
														<td>
															${j+1 }
														</td>
														<td>
															${it.name}
														</td>
													</tr>
													<tr>
														<td>胜率：</td>
														<td><g:formatNumber number="${it.winningPercentage }"
																format="##0.##%" /></td>
													</tr>
												</table> <g:hiddenField name="wuJiangName" id="wuJiangName${it.id }"
													value="${it.name }" />
											</label>
										</div>
									</div>
								</g:each>
							</div>
						</div>
						<div id="collapse${i }" class="panel-collapse collapse">
							<div class="panel-body">
								<div class="row">
									<g:each
										in="${org.mysanguosha.WuJiang.findAllByShiLi(item,[sort:"winningPercentage",order:"desc",offset:3]) }"
										status="j" var="it">
										<div class="col-md-3">
											<div class="checkbox">
												<label> <input type="checkbox" value="${it.id}"
													hidden id="wuJiang${it.id }"
													onchange="pickWuJiang(${it.id });" />
													<table>
														<tr>
															<td>
																${j+4 }
															</td>
															<td>
																${it.name}
															</td>
														</tr>
														<tr>
															<td>胜率：</td>
															<td><g:formatNumber
																	number="${it.winningPercentage }" format="##0.##%" /></td>
														</tr>
													</table> <g:hiddenField name="wuJiangName"
														id="wuJiangName${it.id }" value="${it.name }" />
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
	<g:javascript>
		activeLink("homeLink");
		var zhuFuList=[];
		${remoteFunction(action: 'index',controller:'simulator',update:'result')}
		function updatePair(zhuJiangId, fuJiangId){
			${remoteFunction(action: 'show', controller:'pair', update:'pair', params: '{zhuJiangId:zhuJiangId,fuJiangId:fuJiangId}') }
		}
	</g:javascript>
</body>
</html>
