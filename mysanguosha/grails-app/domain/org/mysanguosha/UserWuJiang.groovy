package org.mysanguosha

import java.util.Date;

class UserWuJiang {
	User user
	WuJiang wuJiang
	int win=0
	int lost=0
	double winningPercentage
	int appearance
	boolean open=false
	boolean recommended=false
	Date dateCreated
	Date lastUpdated	
	
	static constraints = {
		importFrom WuJiang
		wuJiang unique:'user'
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
