require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!
  get '/reversename/:name' do 
    status 200
    "#{params[:name].reverse}"
  end

  get '/square/:number' do
      status 200
      @number = params[:number].to_i
      "#{@number * @number}"
  end

  get '/say/:number/:phrase' do 
    status 200
    @number = params[:number].to_i
    "#{params[:phrase] * @number}"
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    status 200
    @string = ''
    1.upto(5) do |index|
      p = "word#{index}"
      @string += "#{params[p]} "
    end
    @string.rstrip + '.'
  end

  get '/:operation/:number1/:number2' do
    @num1 = params[:number1].to_i
    @num2 = params[:number2].to_i
    case params[:operation]
    when 'add'
      @answer = @num1 + @num2
    when 'subtract'
      @answer = @num1 - @num2
    when 'multiply'
      @answer = @num1 * @num2
    when 'divide'
      @answer = @num1 / @num2
    end
    status 200
    "#{@answer}"
  end
end