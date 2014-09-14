package org.mysanguosha

class RefreshWuJiangsAndPairsJob {
	static triggers = {
		simple name:'simpleTrigger', startDelay:10000, repeatInterval: 30000, repeatCount: -1
		cron name: 'myTrigger', cronExpression: "0 0 14 * * ?"
	}
	def group = "MyGroup"
	def description = "Example job with Cron Trigger"
	def execute(){
		def wuJiangs=WuJiang.list()
		def pairs=Pair.list()
		for(item in wuJiangs){
			def userWuJiangWinSum=UserWuJiang.executeQuery(
					'select sum(win) from UserWuJiang u where u.wuJiang=:wuJiang',
					[wuJiang: item])[0]
			def userWuJiangLostSum=UserWuJiang.executeQuery(
					'select sum(lost) from UserWuJiang u where u.wuJiang=:wuJiang',
					[wuJiang: item])[0]
			item.win=userWuJiangWinSum
			item.lost=userWuJiangLostSum
			item.save()
		}
		for(item in pairs){
			def userPairWinSum=UserPair.executeQuery(
					'select sum(win) from UserPair u where u.pair=:pair',
					[pair: item])[0]
			def userPairLostSum=UserWuJiang.executeQuery(
					'select sum(lost) from UserPair u where u.pair=:pair',
					[pair: item])[0]
			item.win=userPairWinSum
			item.lost=userPairLostSum
			item.save()
		}
		print "Job run!"
	}
}
