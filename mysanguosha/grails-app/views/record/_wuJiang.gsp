<div class="checkbox">
	<label> <input type="checkbox" value="${it.id}" hidden
		id="wuJiang${it.id }" onchange="pickWuJiang(${it.id });" />
		<table>
			<tr>
				<td colspan="5">
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
		</table> <g:hiddenField name="wuJiangName" id="wuJiangName${it.id }"
			value="${it.name }" />

	</label>
</div>
