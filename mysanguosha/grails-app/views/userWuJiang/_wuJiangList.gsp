<div class="table-responsive">
	<table class="table">
		<tr>
			<th>排名</th>
			<th>开通</th>
			<th>武将</th>
			<th colspan="3">获胜</th>
			<th colspan="3">失败</th>
			<th>出场</th>
			<th>胜率</th>
			<th>包</th>
			<g:each in="${it }" var="wuJiang" status="i">
				<tr>
					<td>
						${i+1 }
					</td>
					<td><g:checkBox name="wuJiang.required"
							checked="${wuJiang.open }" value="true"
							onclick="${remoteFunction(action:'changeOpen',controller:'userWuJiang', id:wuJiang.id ) }" /></td>
					<td>
						${wuJiang.wuJiang.name }
					</td>
					<td>
						${wuJiang.win }
					</td>
					<td><g:link action="addWin" id="${wuJiang.id }">
							<span class="glyphicon glyphicon-plus"></span>
						</g:link></td>
					<td><g:link action="minusWin" id="${wuJiang.id }">
							<span class="glyphicon glyphicon-minus"></span>
						</g:link></td>
					<td>
						${wuJiang.lost }
					</td>
					<td><g:link action="addLost" id="${wuJiang.id }">
							<span class="glyphicon glyphicon-plus"></span>
						</g:link></td>
					<td><g:link action="minusLost" id="${wuJiang.id }">
							<span class="glyphicon glyphicon-minus"></span>
						</g:link></td>
					<td>
						${wuJiang.appearance }
					</td>
					<td><g:formatNumber number="${wuJiang.winningPercentage }"
							format="#0.00%" /></td>
					<td>
						${wuJiang.wuJiang.wuJiangGroup?.name }
					</td>
				</tr>
			</g:each>
	</table>
</div>