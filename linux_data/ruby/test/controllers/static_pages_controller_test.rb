require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
    def setup
        @base_title = "Micropost Maker"
    end

    test "should get root" do
        get root_path #static_pages_home_url # GETリクエストをhomeアクションに対して発行
        assert_response :success # リクエストに対するレスポンスは［成功］になるはず
        assert_select "title", "#{@base_title}"
    end
    
    test "should get home" do # Homeページのテスト
        get root_path # GETリクエストをhomeアクションに対して発行
        assert_response :success # リクエストに対するレスポンスは［成功］になるはず
        assert_select "title", "#{@base_title}"
    end

    test "should get help" do
        get help_path
        assert_response :success
        assert_select "title", "Help | #{@base_title}"
    end

    test "should get about" do # StaticPagesControllerTest#test_should_get_about:
        get about_path
        assert_response :success
        assert_select "title", "About | #{@base_title}"
    end

    test "should get contact" do # Contactページのテスト
        get contact_path # GETリクエストをcontactアクションに対して発行
        assert_response :success # リクエストに対するレスポンスは［成功］になるはず
        assert_select "title", "Contact | #{@base_title}"
    end
end
