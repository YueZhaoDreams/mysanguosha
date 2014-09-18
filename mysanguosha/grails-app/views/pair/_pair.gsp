<table>
	<tr>
		<td>胜：</td>
		<td>
			${it.win }
		</td>
		<td style="padding-left: 10px;">负：</td>
		<td>
			${it.lost }
		</td>
		<td style="padding-left: 10px;">总：</td>
		<td>
			${it.appearance }
		</td>
	</tr>
	<tr>
		<td colspan="2">胜率：</td>
		<td colspan="4"><g:formatNumber number="${it.winningPercentage }"
				format="##0.##%" /></td>
	</tr>
</table>