class LocalitiesController < ApplicationController
  skip_before_filter :authenticate_user!
  layout false

  def index
    respond_to &:js
  end
end
