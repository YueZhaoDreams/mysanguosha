<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>记录</title>
<g:javascript library="jquery" plugin="jquery"></g:javascript>
<asset:javascript src="record.js" />
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<g:form>
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
							<div id="collapse${i }"
								class="panel-collapse collapse ${shiLi?(shiLi==item.code?"in":""):(i==0?"in":"") }">
								<div class="panel-body">
									<div class="row">
										<g:each
											in="${org.mysanguosha.WuJiang.findAllByShiLi(item,[sort:"winningPercentage",order:"desc"]) }">
											<div class="col-md-3">
												<div class="checkbox">
													<label> <input type="checkbox" value="${it.id}"
														hidden id="wuJiang${it.id }"
														onchange="pickWuJiang(${it.id });" />
														<table>
															<tr>
																<td colspan="6">
																	${it.name}
																</td>
															</tr>
															<tr>
																<td>胜：</td>
																<td>
																	${org.mysanguosha.UserWuJiang.findOrSaveByUserAndWuJiang(user,it).win }
																</td>
																<td style="padding-left: 10px;">负：</td>
																<td>
																	${org.mysanguosha.UserWuJiang.findOrSaveByUserAndWuJiang(user,it).lost }
																</td>
																<td style="padding-left: 10px;">总：</td>
																<td>
																	${org.mysanguosha.UserWuJiang.findOrSaveByUserAndWuJiang(user,it).appearance }
																</td>
															</tr>
															<tr>
																<td colspan="2">胜率：</td>
																<td colspan="4"><g:formatNumber
																		number="${org.mysanguosha.UserWuJiang.findOrSaveByUserAndWuJiang(user,it).winningPercentage }"
																		format="##0.##%" /></td>
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
	</div>
	<g:javascript>
	activeLink("recordLink");
	var zhuFuList=[];
	${remoteFunction(action: 'index',controller:'simulator',update:'result')}
	</g:javascript>
</body>
</html>
