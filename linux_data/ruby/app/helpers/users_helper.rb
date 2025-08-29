module UsersHelper

    # 引数で与えられたユーザーのGravatar画像を返す
    def gravatar_for(user, options = { size: 80 })
        #size         = options[:size]
        #gravatar_id  = Digest::MD5::hexdigest(user.email.downcase)
        #gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        #image_tag(gravatar_url, alt: user.name, class: "gravatar")
        imgId = "default.ico"
        image_tag(imgId, alt: user.name, class: "gravatar", width: "60px", height: "60px")
    end
end
  