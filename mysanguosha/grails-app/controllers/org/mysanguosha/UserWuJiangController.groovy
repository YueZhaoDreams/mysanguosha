package org.mysanguosha

import grails.plugin.springsecurity.annotation.Secured

import org.apache.commons.io.FileUtils
import org.codehaus.groovy.grails.plugins.jasper.JasperExportFormat
import org.codehaus.groovy.grails.plugins.jasper.JasperReportDef

@Secured("ROLE_USER")
class UserWuJiangController {
	def springSecurityService
	def jasperService
	def index() {
		def suser=springSecurityService.currentUser
		def queryWei=UserWuJiang.where{user==suser && wuJiang.shiLi==ShiLi.findByCode("Wei")}
		def wei=queryWei.list(sort:'winningPercentage',order:'desc')
		def queryShu=UserWuJiang.where{user==suser && wuJiang.shiLi==ShiLi.findByCode("Shu")}
		def shu=queryShu.list(sort:'winningPercentage',order:'desc')
		def queryWu=UserWuJiang.where{user==suser && wuJiang.shiLi==ShiLi.findByCode("Wu")}
		def wu=queryWu.list(sort:'winningPercentage',order:'desc')
		def queryQun=UserWuJiang.where{user==suser && wuJiang.shiLi==ShiLi.findByCode("Qun")}
		def qun=queryQun.list(sort:'winningPercentage',order:'desc')
		[wei:wei,shu:shu,wu:wu,qun:qun]
	}
	def addWin(){
		def wuJiang=UserWuJiang.get(params.id)
		wuJiang.win++
		wuJiang.save()
		redirect(action:"index")
	}
	def minusWin(){
		def wuJiang=UserWuJiang.get(params.id)
		wuJiang.win--
		wuJiang.save()
		redirect(action:"index")
	}
	def addLost(){
		def wuJiang=UserWuJiang.get(params.id)
		wuJiang.lost++
		wuJiang.save()
		redirect(action:"index")
	}
	def minusLost(){
		def wuJiang=UserWuJiang.get(params.id)
		wuJiang.lost--
		wuJiang.save()
		redirect(action:"index")
	}
	def changeOpen(){
		def wuJiang=UserWuJiang.get(params.id)
		wuJiang.open=!wuJiang.open
		wuJiang.save()
		println wuJiang.wuJiang.name+" has change its open to "+wuJiang.open
	}
	def download(){
		def reportDef = new JasperReportDef(name:'wuJiang.jrxml',
		fileFormat:JasperExportFormat.PDF_FORMAT
		)
		FileUtils.writeByteArrayToFile(new File("/your/target/path/test.pdf"), jasperService.generateReport(reportDef).toByteArray())
	}
}
