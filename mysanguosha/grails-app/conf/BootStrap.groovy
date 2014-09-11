import org.mysanguosha.Pair
import org.mysanguosha.User
import org.mysanguosha.UserPair
import org.mysanguosha.UserWuJiang
import org.mysanguosha.WuJiang


class BootStrap {

	def init = { servletContext ->
//		def wuJiangs=WuJiang.list()
//		def pairs=Pair.list()
//		def user=User.get(1)
//		for(item in wuJiangs){
//			def userWuJiang=new UserWuJiang(user:user,wuJiang:item,win:item.win,lost:item.lost,winningPercentage:item.winningPercentage,appearance:item.appearance,used:item.required,open:item.open)
//			userWuJiang.save()
//		}
//		for(item in pairs){
//			def userPair=new UserPair(user:user,pair:item,win:item.win,lost:item.lost,winningPercentage:item.winningPercentage,appearance:item.appearance)
//			userPair.save()
//		}
	}
	def destroy = {
	}
}
