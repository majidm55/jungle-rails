class Admin::BaseController < ApplicationController
    http_basic_authenticate_with name: ENV['ADMIN_USER'].to_s, password: ENV['ADMIN_PASS'].to_s

end