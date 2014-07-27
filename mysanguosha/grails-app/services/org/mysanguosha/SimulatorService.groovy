package org.mysanguosha

import grails.transaction.Transactional
import org.apache.commons.math3.util.CombinatoricsUtils

@Transactional
class SimulatorService {

	def calculate2(){
		def c = WuJiang.createCriteria()
		def results = c.list {
			and {
				between("balance", 500, 1000)
				eq("branch", "London")
			}
			maxResults(10)
			order("holderLastName", "desc")
		}
	}

	def calculate() {
		def winningPercentage=0d

		def weiShiLi=ShiLi.findByName("Wei")
		def shuShiLi=ShiLi.findByName("Shu")
		def wuShiLi=ShiLi.findByName("Wu")
		def qunShiLi=ShiLi.findByName("Qun")

		def weiRequired=WuJiang.findAllByShiLiAndRequired(weiShiLi,true)
		def shuRequired=WuJiang.findAllByShiLiAndRequired(shuShiLi,true)
		def wuRequired=WuJiang.findAllByShiLiAndRequired(wuShiLi,true)
		def qunRequired=WuJiang.findAllByShiLiAndRequired(qunShiLi,true)

		def sortedWeiNotRequired=WuJiang.findAllByShiLiAndRequiredAndWinGreaterThan(weiShiLi,false,0,[sort:"winningPercentage",order:"desc"])
		def sortedShuNotRequired=WuJiang.findAllByShiLiAndRequiredAndWinGreaterThan(shuShiLi,false,0,[sort:"winningPercentage",order:"desc"])
		def sortedWuNotRequired=WuJiang.findAllByShiLiAndRequiredAndWinGreaterThan(wuShiLi,false,0,[sort:"winningPercentage",order:"desc"])
		def sortedQunNotRequired=WuJiang.findAllByShiLiAndRequiredAndWinGreaterThan(qunShiLi,false,0,[sort:"winningPercentage",order:"desc"])

		//		def weiNotRequiredList=getCombinationList(weiNotRequired)
		//		def shuNotRequiredList=getCombinationList(shuNotRequired)
		//		def wuNotRequiredList=getCombinationList(wuNotRequired)
		//		def qunNotRequiredList=getCombinationList(qunNotRequired)

		//		weiNotRequiredList.add(new ArrayList())
		//		shuNotRequiredList.add(new ArrayList())
		//		wuNotRequiredList.add(new ArrayList())
		//		qunNotRequiredList.add(new ArrayList())

		def weiNotRequiredList=makeList(sortedWeiNotRequired)
		def shuNotRequiredList=makeList(sortedShuNotRequired)
		def wuNotRequiredList=makeList(sortedWuNotRequired)
		def qunNotRequiredList=makeList(sortedQunNotRequired)

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
						def netRequiredNames=getNotRequiredNames(wei+shu+wu+qun)
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
		def notRequiredBestWuJiangNames=getNotRequiredNames(bestList)
		println "------------------------------"
		println winningPercentage+" "+notRequiredBestWuJiangNames
		return notRequiredBestWuJiangNames
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
			if(item.required==false){
				notRequiredWuJiangNames.add(item.name)
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
