package org.mysanguosha

class RecordController {

    def index() { 
	}
	def addWin(){
		def zhuJiang=WuJiang.get(params.zhuJiang)
		def fuJiang=WuJiang.get(params.fuJiang)
		zhuJiang.win++
		fuJiang.win++
		zhuJiang.save()
		fuJiang.save()
		redirect(controller:"wuJiang")
	}
	def addLost(){
		def zhuJiang=WuJiang.get(params.zhuJiang)
		def fuJiang=WuJiang.get(params.fuJiang)
		zhuJiang.lost++
		fuJiang.lost++
		zhuJiang.save()
		fuJiang.save()
		redirect(controller:"wuJiang")
	}
}
