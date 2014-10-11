package org.mysanguosha

import java.util.Date;

class User extends SecUser{
	Date lastRecommended
    static constraints = {
		lastRecommended nullable:true
    }
}
