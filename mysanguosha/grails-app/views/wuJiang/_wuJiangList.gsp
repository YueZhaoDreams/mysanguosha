<div class="table-responsive">
	<table class="table">
		<tr>
			<th>排名</th>
			<th>必选</th>
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
							checked="${wuJiang.required }" value="true"
							onclick="${remoteFunction(action:'changeRequired',controller:'wuJiang', id:wuJiang.id ) }" /></td>
					<td>
						${wuJiang.name }
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
						${wuJiang.wuJiangGroup?.name }
					</td>
				</tr>
			</g:each>
	</table>
</div>