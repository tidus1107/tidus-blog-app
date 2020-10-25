class ApplicationController < ActionController::Base
  before_action :set_local
  def current_user
    ActiveDecorator::Decorator.instance.decorate(super) if super.present?
    super
    # deviceとactiveDecoratorを組み合わせた際に必要になるメソッドだと思っておけば良さそう
  end

  def default_url_options
    { locale: I18n.locale }
  end
  
  private 
  def set_local
    I18n.locale = params[:locale] || I18n.default_locale
  end
end