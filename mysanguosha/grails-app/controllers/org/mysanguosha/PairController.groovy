package org.mysanguosha

import grails.plugin.springsecurity.annotation.Secured

@Secured("ROLE_USER")
class PairController {
	static scaffold=true
	def springSecurityService
	def show(){
		def user=springSecurityService.currentUser
		def zhuJiang=WuJiang.get(params.zhuJiangId)
		def fuJiang=WuJiang.get(params.fuJiangId)
		def pair=Pair.findOrCreateByZhuJiangAndFuJiang(zhuJiang, fuJiang)
		pair.save(flush:true)
		def userPair=UserPair.findOrSaveByUserAndPair(user, pair)
		render(template:"pair",bean:userPair)
	}
}
