class SessionsController < Devise::SessionsController
  layout 'login'
  skip_authorize_resource
end