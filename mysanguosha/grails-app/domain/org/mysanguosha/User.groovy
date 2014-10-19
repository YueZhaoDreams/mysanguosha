package org.mysanguosha

import java.util.Date;

class User extends SecUser{
	Date lastRecommended
	boolean isVIP=false
    static constraints = {
		lastRecommended nullable:true
    }
}