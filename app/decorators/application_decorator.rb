class ApplicationDecorator < SimpleDelegator
  def object
    __getobj__
  end
end
