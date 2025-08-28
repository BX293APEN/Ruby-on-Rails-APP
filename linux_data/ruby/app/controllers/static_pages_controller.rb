class StaticPagesController < ApplicationController
    def home # http://localhost:3000/static_pages/home にアクセスして最初に実行される
    end # ビューを表示

    def help
    end

    def about
        print("Hello World!\n")
    end

    def contact
    end
    
end
