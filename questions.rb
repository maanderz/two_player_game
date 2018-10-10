class Questions

  attr_accessor :correct_answer, :show

  def initialize
    @number1 = rand(1...20)
    @number2 = rand(1...20)
    @correct_answer = @number1 + @number2
    @show = "What is #{@number1} + #{@number2}?"  
  end 
  
end  