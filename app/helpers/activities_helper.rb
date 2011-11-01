module ActivitiesHelper
  def suma(modelo)
    i = 0
    modelo.map{|x| x.value }.each do |x|
      i+=x
    end
    i
  end
end
