package org.mysanguosha

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
}
