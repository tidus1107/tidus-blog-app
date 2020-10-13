class ApplicationController < ActionController::Base

  def current_user
    ActiveDecorator::Decorator.instance.decorate(super) if super.present?
    super
    # deviceとactiveDecoratorを組み合わせた際に必要になるメソッドだと思っておけば良さそう
  end
end
