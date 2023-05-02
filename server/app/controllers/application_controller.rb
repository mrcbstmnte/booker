# frozen_string_literal: true

class ApplicationController < ActionController::API
  {
    Booker::BadRequest => :bad_request,
    Booker::NotFound => :not_found
  }.each do |klass, status|
    rescue_from klass do |exception|
      data = {
        message: exception.message
      }

      render json: data, status: status
    end
  end
end
