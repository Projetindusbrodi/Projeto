class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def authenticate
    authenticate_or_request_with_http_basic("Application") do |ra, password|
      aluno = Aluno.find_by(ra: ra)
      aluno && aluno.authenticate(password)
    end
  end

  helper_method :authenticate
end
