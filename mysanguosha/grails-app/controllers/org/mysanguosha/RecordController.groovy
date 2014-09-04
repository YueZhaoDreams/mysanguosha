package org.mysanguosha

class RecordController {

    def index() { 
	}
	def addWin(){
		for(item in params.wuJiang){
			def wuJiang=WuJiang.get(item)
			println wuJiang.win
			wuJiang.win++
			println wuJiang.win
			wuJiang.save()
		}
		redirect(controller:"wuJiang")
	}
	def addLost(){
		for(item in params.wuJiang){
			def wuJiang=WuJiang.get(item)
			println wuJiang.lost
			wuJiang.lost++
			println wuJiang.win
			wuJiang.save()
		}
		redirect(controller:"wuJiang")
	}
}
