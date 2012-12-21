class Admin::ApplicationController < ApplicationController
  inherit_resources
  defaults :route_prefix => 'admin'
  layout 'admin'
end
