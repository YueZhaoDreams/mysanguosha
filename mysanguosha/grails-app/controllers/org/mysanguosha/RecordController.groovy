package org.mysanguosha

import grails.plugin.springsecurity.annotation.Secured

@Secured("ROLE_USER")
class RecordController {

    def index() { 
	}
	def addWin(){
		def zhuJiang=WuJiang.get(params.zhuJiang)
		def fuJiang=WuJiang.get(params.fuJiang)
		def pair=Pair.findOrSaveByZhuJiangAndFuJiang(zhuJiang, fuJiang)
		pair.win++
		zhuJiang.win++
		fuJiang.win++
		zhuJiang.save()
		fuJiang.save()
		pair.save()
		render(view:"index",model:[shiLi:zhuJiang.shiLi.code])
	}
	def addLost(){
		def zhuJiang=WuJiang.get(params.zhuJiang)
		def fuJiang=WuJiang.get(params.fuJiang)
		def pair=Pair.findOrSaveByZhuJiangAndFuJiang(zhuJiang, fuJiang)
		pair.lost++
		zhuJiang.lost++
		fuJiang.lost++
		zhuJiang.save()
		fuJiang.save()
		pair.save()
		render(view:"index",model:[shiLi:zhuJiang.shiLi.code])
	}
}
