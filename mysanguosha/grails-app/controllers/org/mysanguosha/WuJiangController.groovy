package org.mysanguosha

import grails.plugin.springsecurity.annotation.Secured

@Secured("ROLE_USER")
class WuJiangController {
	def index(){

	}
	def addWin(){
		def wuJiang=WuJiang.get(params.id)
		wuJiang.win++
		wuJiang.save()
		redirect(action:"index")
	}
	def minusWin(){
		def wuJiang=WuJiang.get(params.id)
		wuJiang.win--
		wuJiang.save()
		redirect(action:"index")
	}
	def addLost(){
		def wuJiang=WuJiang.get(params.id)
		wuJiang.lost++
		wuJiang.save()
		redirect(action:"index")
	}
	def minusLost(){
		def wuJiang=WuJiang.get(params.id)
		wuJiang.lost--
		wuJiang.save()
		redirect(action:"index")
	}
	def changeRequired(){
		def wuJiang=WuJiang.get(params.id)
		wuJiang.required=!wuJiang.required
		wuJiang.save()
		println wuJiang.name+" has change its required to "+wuJiang.required
	}
}
