package org.mysanguosha

class Pair {
	WuJiang zhuJiang
	WuJiang fuJiang
	int win=0
	int lost=0
	double winningPercentage
	int appearance

	static constraints = {
		fuJiang validator:{ val, obj->
			if(val.shiLi!=obj.zhuJiang.shiLi){
				return "shiLiNotMatching"
			}
		}
	}

	def beforeInsert() {
		double winningP
		if(win+lost){
			winningP=(double)win/((double)win+(double)lost)
		}else{
			winningP=0d
		}
		winningPercentage = winningP
		appearance=win+lost
	}

	def beforeUpdate() {
		double winningP
		if(win+lost){
			winningP=(double)win/((double)win+(double)lost)
		}else{
			winningP=0d
		}
		winningPercentage = winningP
		appearance=win+lost
	}
}
