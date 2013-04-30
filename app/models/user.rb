class User < ActiveRecord::Base
  attr_accessible :email, :name, :provider, :uid

 def self.create_with_omniauth(auth)
  create! do |user|
    user.provider = auth['provider']
    user.uid = auth['uid']
    if auth['info']
      user.name = auth['info']['name'] || ""
      user.email = auth['info']['email'] || ""
    end
  end
end


def facebook
    @facebook ||= Koala::Facebook::API.new('BAAIGh00LCBEBAJ8rTtbjwtUUdUKBRZBUOCWlVEZAS3ZCEyzHtJ7FyG7tYGjFMLEAMiKQnOvI0Gl4c7AWTpF5z2iKynfUGAKDb5F5GN4UG5QOrSsE8PCXlee6d3nsZCrGujL0SGGGnyI3XvPQQHNAbYtZAs15kF5f4N87h0JVD3jGcBm47ofsdWOgCUjUItz5AjFHuGACumJQYyq94lzR722lnszxah9GZApdGgzaoLqCwXPwyvJ7NZB')
    block_given? ? yield(@facebook) : @facebook
  rescue Koala::Facebook::APIError => e
    logger.info e.to_s
    nil
  end
  
  def friends_count
    facebook { |fb| fb.get_connection("me", "friends").size}
  end

 def friends_list
    facebook { |fb| fb.get_connection('me','friends',:fields=>"name,relationship_status,location")}
  end

   def status_single_friend
   # facebook { |fb| fb.get_connection('me','friends',:fields=>"name,gender,relationship_status")}
    facebook.fql_query("select uid, name, relationship_status from user WHERE relationship_status='married' AND uid in (select uid2 from friend where uid1 = me())")
  end
end
