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
	boolean vipRequired=false
	boolean defaultRequired=false
	Short yinLiangPrice
	Short yuanBaoPrice
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		wuJiangGroup nullable:true
		win min:0
		lost min:0
		winningPercentage min:0d,max:1d
		appearance min:0
		yinLiangPrice nullable:true
		yuanBaoPrice nullable:true
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
