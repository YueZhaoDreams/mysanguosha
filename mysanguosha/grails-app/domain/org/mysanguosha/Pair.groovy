package org.mysanguosha

class Pair {
	WuJiang zhuJiang
	WuJiang fuJiang
	int win=0
	int lost=0
	double winningPercentage=0d
	int appearance

	static constraints = {
		importFrom WuJiang
		zhuJiang unique:'fuJiang'
		fuJiang validator:{ val, obj->
			if(val.shiLi!=obj.zhuJiang.shiLi){
				return "shiLiNotMatching"
			}
		}
	}

	def beforeInsert() {
		winningPercentage = calculateWinningPercentage(win,lost)
		appearance=win+lost
	}

	def beforeUpdate() {
		winningPercentage = calculateWinningPercentage(win,lost)
		appearance=win+lost
	}

	private calculateWinningPercentage(win,lost){
		double winningP
		if(win+lost){
			if(win+lost>=20d){
				winningP=(double)win/((double)win+(double)lost)
			}else{
				def zhuJiangWin=(double)zhuJiang.win-(double)win
				def zhuJiangLost=(double)zhuJiang.lost-(double)lost
				def zhuJiangWinningP=zhuJiangWin/(zhuJiangWin+zhuJiangLost)
				def fuJiangWin=(double)fuJiang.win-(double)win
				def fuJiangLost=(double)fuJiang.lost-(double)lost
				def fuJiangWinningP=fuJiangWin/(fuJiangWin+fuJiangLost)
				def referenceWinningP=Math.sqrt(zhuJiangWinningP*fuJiangWinningP)
				winningP=referenceWinningP*(20d-win+lost)/20d+(double)win/((double)win+(double)lost)*(win+lost)/20d
			}
		}else{
			winningP=0d
		}
		return winningP
	}
}
