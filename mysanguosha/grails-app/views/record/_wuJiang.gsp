<div class="checkbox">
	<label> <input type="checkbox" value="${it.id}" hidden
		id="wuJiang${it.id }" onchange="pickWuJiang(${it.id });" />
		<table>
			<tr>
				<td colspan="3">
					${it.name}
				</td>
			</tr>
			<g:if
				test="${org.mysanguosha.UserWuJiang.findOrSaveByUserAndWuJiang(user,it).appearance }">
				<tr>
					<td>我的胜率：</td>
					<td><g:formatNumber
							number="${org.mysanguosha.UserWuJiang.findOrSaveByUserAndWuJiang(user,it).winningPercentage }"
							format="##0.##%" /></td>
					<td>(${org.mysanguosha.UserWuJiang.findOrSaveByUserAndWuJiang(user,it).win }/${org.mysanguosha.UserWuJiang.findOrSaveByUserAndWuJiang(user,it).appearance })
					</td>
				</tr>
			</g:if>
			<g:else>
				<tr>
					<td>参考胜率：</td>
					<td><g:formatNumber number="${it.winningPercentage }"
							format="##0.##%" /></td>
				</tr>
			</g:else>
		</table> <g:hiddenField name="wuJiangName" id="wuJiangName${it.id }"
			value="${it.name }" />

	</label>
</div>
