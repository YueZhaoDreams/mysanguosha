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
		<g:form>
			<div class="row">
				<div class="col-md-10">
					<div class="panel-group" id="accordion">
						<g:each in="${org.mysanguosha.ShiLi.list() }" var="item"
							status="i">
							<div class="panel panel-default">
								<div class="panel-heading">
									<div class="row">
										<div class="col-md-2">
											<h4 class="panel-title">
												<a data-toggle="collapse" data-parent="#accordion"
													href="#collapse${i }"> ${item.name }
												</a>
											</h4>
										</div>

										<g:each
											in="${org.mysanguosha.WuJiang.findAllByShiLi(item,[sort:"winningPercentage",order:"desc",max:3]) }"
											status="j" var="it">
											<div class="col-md-3">
												${j+1 }
												<g:render template="wuJiang" bean="${it }" />
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
													${j+4 }
													<g:render template="wuJiang" bean="${it }" />
												</div>
											</g:each>
										</div>
									</div>
								</div>
							</div>
						</g:each>
					</div>
				</div>
				<div class="col-md-2">
					<div class="row">
						<table>
							<tr>
								<td id="zhuJiangDiv"></td>
								<td><input type="hidden" id="zhuJiang" name="zhuJiang"></input><input
									type="hidden" id="fuJiang" name="fuJiang"></input></td>
								<td id="fuJiangDiv"></td>
							</tr>
							<tr>
								<td><g:actionSubmit name="winBtn" value="Win"
										class="btn form-control" action="addWin" /></td>
								<td></td>
								<td><g:actionSubmit name="lostBtn" value="Lost"
										class="btn form-control" action="addLost" /></td>
							</tr>
							<tr>
								<td id="pair" colspan="3"></td>
							</tr>
						</table>
					</div>
					<div class="row">
						<div class="col-md-2">
							<button type="button" class="btn btn-default">

								<g:remoteLink controller="simulator" action="index"
									update="result">Simulate</g:remoteLink>
							</button>
						</div>
						<div class="col-md-10" id="result"></div>
					</div>
					<g:each
						in="${org.mysanguosha.Pair.list([max:5,sort:"winningPercentage",order:"desc"]) }"
						var="it" status="i">
						<table>
							<tr>
								<td>
									${i+1 }
								</td>
								<td>
									${it.zhuJiang.name }
								</td>
								<td></td>
								<td>
									${it.fuJiang.name }
								</td>
							</tr>
							<tr>
								<td colspan="2">平均胜率：</td>
								<td colspan="4"><g:formatNumber
										number="${it.winningPercentage }" format="##0.##%" /></td>
							</tr>
							<tr>
								<td>我的胜率：</td>
								<sec:ifLoggedIn>
									<td><g:formatNumber
											number="${org.mysanguosha.UserPair.findOrSaveByUserAndPair(user,it).winningPercentage }"
											format="##0.##%" /></td>
									<td>(${org.mysanguosha.UserPair.findOrSaveByUserAndPair(user,it).win }/${org.mysanguosha.UserPair.findOrSaveByUserAndPair(user,it).appearance })
									</td>
								</sec:ifLoggedIn>
								<sec:ifNotLoggedIn>
									<td colspan="3">注册后输入</td>
								</sec:ifNotLoggedIn>
							</tr>
						</table>
					</g:each>
				</div>
			</div>
		</g:form>
	</div>
	<g:javascript>
		activeLink("recordLink");
		var zhuFuList=[];
		function updatePair(zhuJiangId, fuJiangId){
			${remoteFunction(action: 'show', controller:'pair', update:'pair', params: '{zhuJiangId:zhuJiangId,fuJiangId:fuJiangId}') }
		}
	</g:javascript>
</body>
</html>
