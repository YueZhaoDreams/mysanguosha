package org.mysanguosha

import org.apache.commons.math3.util.CombinatoricsUtils

class SimulatorService {
	def springSecurityService
	def calculate() {
		def user=springSecurityService.currentUser

		def winningPercentage=0d

		def weiShiLi=ShiLi.findByCode("Wei")
		def shuShiLi=ShiLi.findByCode("Shu")
		def wuShiLi=ShiLi.findByCode("Wu")
		def qunShiLi=ShiLi.findByCode("Qun")

		def weiCriteria = UserWuJiang.createCriteria()
		def weiRequired = weiCriteria.list{
			eq "user", user
			wuJiang{
				eq "shiLi",weiShiLi
				eq "required",true
			}
		}
		def shuCriteria = UserWuJiang.createCriteria()
		def shuRequired = shuCriteria.list{
			eq "user", user
			wuJiang{
				eq "shiLi",shuShiLi
				eq "required",true
			}
		}
		def wuCriteria = UserWuJiang.createCriteria()
		def wuRequired = wuCriteria.list{
			eq "user", user
			wuJiang{
				eq "shiLi",wuShiLi
				eq "required",true
			}
		}
		def qunCriteria = UserWuJiang.createCriteria()
		def qunRequired = qunCriteria.list{
			eq "user", user
			wuJiang{
				eq "shiLi",qunShiLi
				eq "required",true
			}
		}

		def weiOpenCriteria = UserWuJiang.createCriteria()
		def weiOpenUserWuJiangs = weiOpenCriteria.list{
			eq "user",user
			eq "open",true
			order("winningPercentage", "desc")
			wuJiang{
				eq "shiLi",weiShiLi
				eq "required",false
			}
		}
		def shuOpenCriteria = UserWuJiang.createCriteria()
		def shuOpenUserWuJiangs = shuOpenCriteria.list{
			eq "user",user
			eq "open",true
			order("winningPercentage", "desc")
			wuJiang{
				eq "shiLi",shuShiLi
				eq "required",false
			}
		}
		def wuOpenCriteria = UserWuJiang.createCriteria()
		def wuOpenUserWuJiangs = wuOpenCriteria.list{
			eq "user",user
			eq "open",true
			order("winningPercentage", "desc")
			wuJiang{
				eq "shiLi",wuShiLi
				eq "required",false
			}
		}
		def qunOpenCriteria = UserWuJiang.createCriteria()
		def qunOpenUserWuJiangs = qunOpenCriteria.list{
			eq "user",user
			eq "open",true
			order("winningPercentage", "desc")
			wuJiang{
				eq "shiLi",qunShiLi
				eq "required",false
			}
		}		
		def weiNotRequiredList=makeList(weiOpenUserWuJiangs)
		def shuNotRequiredList=makeList(shuOpenUserWuJiangs)
		def wuNotRequiredList=makeList(wuOpenUserWuJiangs)
		def qunNotRequiredList=makeList(qunOpenUserWuJiangs)

		def bestWei
		def bestShu
		def bestWu
		def bestQun

		def count=0

		for(itemWei in weiNotRequiredList){
			def wei=weiRequired+itemWei
			for(itemShu in shuNotRequiredList){
				def shu=shuRequired+itemShu
				for(itemWu in wuNotRequiredList){
					def wu=wuRequired+itemWu
					for(itemQun in qunNotRequiredList){
						def qun=qunRequired+itemQun
						def winningPercentageItem=getWinningPercentage(wei,shu,wu,qun)
						if(count%100==0){
							println count
						}
						if(winningPercentageItem>winningPercentage){
							println winningPercentageItem+" "+getNotRequiredNames(wei+shu+wu+qun)
							winningPercentage=winningPercentageItem
							bestWei=wei
							bestShu=shu
							bestWu=wu
							bestQun=qun
						}
						count++
					}
				}
			}
		}
		println count
		def bestList=bestWei+bestShu+bestWu+bestQun
		def notRequiredNames=getNotRequiredNames(bestList)
		println "------------------------------"
		println winningPercentage+" "+notRequiredNames
		return [wuJiangNames:notRequiredNames,winningPercentage:winningPercentage]
	}
	private makeList(wuJiangs){
		def list=new ArrayList()
		list.add(new ArrayList())
		for(int i=0;i<wuJiangs.size();i++){
			def itemList=new ArrayList()
			for(int j=0;j<i+1;j++){
				itemList.add(wuJiangs.get(j))
			}
			list.add(itemList)
		}
		println list
		return list
	}
	def getNotRequiredNames(wuJiangs){
		def notRequiredWuJiangNames=new ArrayList()
		for(item in wuJiangs){
			if(item.wuJiang.required==false){
				notRequiredWuJiangNames.add(item.wuJiang.name)
			}
		}
		return notRequiredWuJiangNames
	}
	def getWinningPercentage(wei,shu,wu,qun){
		def winningPercentage=(CombinatoricsUtils.binomialCoefficientDouble(wei.size(),2)*shiLiAvg(wei)+CombinatoricsUtils.binomialCoefficientDouble(shu.size(),2)*shiLiAvg(shu)+CombinatoricsUtils.binomialCoefficientDouble(wu.size(),2)*shiLiAvg(wu)+CombinatoricsUtils.binomialCoefficientDouble(qun.size(),2)*shiLiAvg(qun))/(CombinatoricsUtils.binomialCoefficientDouble(wei.size(),2)+CombinatoricsUtils.binomialCoefficientDouble(shu.size(),2)+CombinatoricsUtils.binomialCoefficientDouble(wu.size(),2)+CombinatoricsUtils.binomialCoefficientDouble(qun.size(),2))
		return winningPercentage
	}
	def shiLiAvg(shiLiWuJiangs){
		def winPctgList=new ArrayList()
		def count=0
		def totalPercentage=0.0
		for(i in 0..shiLiWuJiangs.size()-2){
			for(j in 1..shiLiWuJiangs.size()-1){
				def winPctg=Math.sqrt(shiLiWuJiangs[i].winningPercentage*shiLiWuJiangs[j].winningPercentage)
				totalPercentage=totalPercentage+winPctg
				count++
			}
		}
		def avg=totalPercentage/(count.toDouble())
		return avg
	}
	private getCombinationList(wuJiangs){
		def list=new ArrayList()
		if(wuJiangs.size()==1){
			list.add(wuJiangs)
		}else{
			def firstWuJiang=wuJiangs.remove(0)
			list.add([firstWuJiang])
			list.addAll(getCombinationList(new ArrayList(wuJiangs)))
			list.addAll(combine(firstWuJiang,getCombinationList(new ArrayList(wuJiangs))))
		}
		return list
	}
	def combine(firstElement,secondList){
		def list=new ArrayList()
		for(item in secondList){
			item.add(firstElement)
			list.add(item)
		}
		return list
	}
}
