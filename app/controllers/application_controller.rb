class ApplicationController < ActionController::Base
 before_filter :authenticate_user!

def index
  if current_user.collections.empty?
    current_user.collections.create(:name => "Default collection")
  end
end


def show
end

end
