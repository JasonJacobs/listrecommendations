class MobileAppsController < ApplicationController

  def index
    mobile_apps
  end

private

  def mobile_apps
    @mobile_apps ||= MobileApp.all
  end

end
