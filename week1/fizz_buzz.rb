class FizzBuzz
  def run
    1.upto(100) do |number|
      if number % 3 == 0 && number % 5 == 0
        puts "FizzBuzz"
      elsif number % 3 == 0 #divisible by 3
        puts "Fizz"
      elsif number % 5 == 0
        puts "Buzz"
      else
        puts number
      end
    end
  end
end

FizzBuzz.new.run
