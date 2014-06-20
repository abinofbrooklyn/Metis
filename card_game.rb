class Card
  attr_accessor :front, :back

  def initialize(attributes) 
    @front = attributes[:front]
    @back = attributes[:back]
  end

  def display_card 
    puts front
    puts back
  end
end

c = Card.new({:front=>"gato", :back=>"cat"})
c.display_card
