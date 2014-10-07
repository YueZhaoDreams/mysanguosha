package org.mysanguosha

class UserPair {
	User user
	Pair pair
	int win=0
	int lost=0
	double winningPercentage=0d
	int appearance=0
	static constraints = {
		importFrom WuJiang
		pair unique:'user'
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
