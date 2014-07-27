<div class="row">
	<div class="col-md-1">排名</div>
	<div class="col-md-2">可选</div>
	<div class="col-md-2">武将</div>
	<div class="col-md-2">获胜</div>
	<div class="col-md-2">失败</div>
	<div class="col-md-1">出场</div>
	<div class="col-md-2">胜率</div>
</div>
<g:each in="${it }" var="wuJiang" status="i">
	<div class="row">
		<div class="col-md-1">
			${i+1 }
		</div>
		<div class="col-md-2">
			<g:checkBox name="wuJiang.required" checked="${wuJiang.required }"
				value="true" />
		</div>
		<div class="col-md-2">
			${wuJiang.name }
		</div>
		<div class="col-md-1">
			${wuJiang.win }
		</div>
		<div class="col-md-1">
			<g:link action="addWin" id="${wuJiang.id }">+</g:link>
			<g:link action="minusWin" id="${wuJiang.id }">-</g:link>
		</div>
		<div class="col-md-1">
			${wuJiang.lost }
		</div>
		<div class="col-md-1">
			<g:link action="addLost" id="${wuJiang.id }">+</g:link>
			<g:link action="minusLost" id="${wuJiang.id }">-</g:link>
		</div>
		<div class="col-md-1">
			${wuJiang.appearance }
		</div>
		<div class="col-md-2">
			${wuJiang.winningPercentage }
		</div>
	</div>
</g:each>