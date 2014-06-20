class Lottery #assigning class Lottery
  attr_accessor :names

  def initialize(names)
    @names = []
  end

  def play
    print_instructions
    get_names
    print_winner
  end

  def print_instructions
    puts "Enter in a list of names followed by a blank like to start the lottery"
  end
  
  def get_names
    loop do 
      name = get_name
      if name.empty?
        break
      end
      names << name
    end
  end

  def get_name
    print "> "
    gets.chomp
  end

  def print_winner
    puts
    puts "#{names.sample} wins!"
  end
end

lotto = []
lottery = Lottery.new(lotto)#assigning instance method
lottery.play #calling method on instance
