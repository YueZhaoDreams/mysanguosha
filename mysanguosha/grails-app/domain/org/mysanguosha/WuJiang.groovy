package org.mysanguosha

class WuJiang {
	String name
	ShiLi shiLi
	int win=0
	int lost=0
	boolean required
	double winningPercentage
	int appearance
	WuJiangGroup wuJiangGroup
	WuJiangGuoGroup wuJiangGuoGroup
    static constraints = {
		wuJiangGroup nullable:true
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
