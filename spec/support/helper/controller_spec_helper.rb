module Helper
  module ControllerSpec
    def sign_in_user
      before(:each) do
        @user = create(:user)
        sign_in @user
      end
    end

    def sign_in_admin
      before(:each) do
        @user = create(:is_admin)
        sign_in @user
      end
    end
  end
end
