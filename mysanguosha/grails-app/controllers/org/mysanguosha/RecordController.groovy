package org.mysanguosha

import grails.plugin.springsecurity.annotation.Secured

@Secured("ROLE_USER")
class RecordController {
	def springSecurityService
	@Secured("permitAll")
    def index() { 
		def user=springSecurityService.currentUser
		return [user:user]
	}
	def addWin(){
		def user=springSecurityService.currentUser
		def zhuJiang=WuJiang.get(params.zhuJiang)
		def fuJiang=WuJiang.get(params.fuJiang)
		def pair=Pair.findOrSaveByZhuJiangAndFuJiang(zhuJiang, fuJiang)
		def userZhuJiang=UserWuJiang.findOrSaveByUserAndWuJiang(user,zhuJiang)
		def userFuJiang=UserWuJiang.findOrSaveByUserAndWuJiang(user,fuJiang)
		def userPair=UserPair.findOrSaveByUserAndPair(user,pair)
		userPair.win++
		userZhuJiang.win++
		userFuJiang.win++
		userZhuJiang.save()
		userFuJiang.save()
		userPair.save()
		render(view:"index",model:[shiLi:zhuJiang.shiLi.code,user:user])
	}
	def addLost(){
		def user=springSecurityService.currentUser
		def zhuJiang=WuJiang.get(params.zhuJiang)
		def fuJiang=WuJiang.get(params.fuJiang)
		def pair=Pair.findOrSaveByZhuJiangAndFuJiang(zhuJiang, fuJiang)
		def userZhuJiang=UserWuJiang.findOrSaveByUserAndWuJiang(user,zhuJiang)
		def userFuJiang=UserWuJiang.findOrSaveByUserAndWuJiang(user,fuJiang)
		def userPair=UserPair.findOrSaveByUserAndPair(user,pair)
		userPair.lost++
		userZhuJiang.lost++
		userFuJiang.lost++
		userZhuJiang.save()
		userFuJiang.save()
		userPair.save()
		render(view:"index",model:[shiLi:zhuJiang.shiLi.code,user:user])
	}
}
