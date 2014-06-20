class LockerGame

  def run
   create_lockers
   toggle_lockers
   print_lockers
  end
  
  private

  def create_lockers
    @lockers = [false] * 10
  end

  def toggle_lockers
    1.upto(100) do |student_id|
      1.upto(100) do |locker_id|
        if locker_id % student_id == 0
         @lockers[locker_id - 1] = !@lockers[locker_id - 1]
        end
      end
    end
  end

  def print_lockers
    @lockers.each_with_index do |locker_open, id|
      print "#{id + 1}. "
      if locker_open
         print"open "
      else 
         print "closed "
      end
    end
  end
end

game = LockerGame.new
game.run
