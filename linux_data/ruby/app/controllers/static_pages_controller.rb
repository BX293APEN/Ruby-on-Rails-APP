class StaticPagesController < ApplicationController
    def home # http://localhost:3000/static_pages/home にアクセスして最初に実行される
        if logged_in?
            @micropost  = current_user.microposts.build
            @feed_items = current_user.feed.paginate(page: params[:page])
        end
    end # ビューを表示

    def help
    end

    def about
        print("Hello World!\n")
    end

    def contact
    end
    
end
