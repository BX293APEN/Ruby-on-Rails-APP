module UsersHelper

    # 引数で与えられたユーザーの画像を返す
    def user_img(user)
        imgId = "default.ico"
        image_tag(imgId, alt: user.name, class: "userImg", width: "80px", height: "80px")
    end
end
  