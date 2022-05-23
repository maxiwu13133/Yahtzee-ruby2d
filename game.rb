require 'ruby2d'

set title: "Yahtzee"
set width: 1000
set height: 800
set background: "#ccc0ba"
set borderless: true

# Fonts
FONT = "./fonts/MomcakeBold.otf"

# Assets
DIE_BOX = "./images/DIE_BOX.png"
DIE1 = "./images/die1.png"
DIE2 = "./images/die2.png"
DIE3 = "./images/die3.png"
DIE4 = "./images/die4.png"
DIE5 = "./images/die5.png"
DIE6 = "./images/die6.png"

DIE = [DIE_BOX, DIE1, DIE2, DIE3, DIE4, DIE5, DIE6]

BUTTON_UP_IMAGE = "./images/button_up.png"
BUTTON_DOWN_IMAGE = "./images/button_down.png"

SCORESHEET = "./images/scoresheet.png"

class Dice 
    attr_accessor :rolls, :keeps
    def initialize
        @rolls = [0, 0, 0, 0, 0]
        @keeps = [0, 0, 0, 0, 0]
    end

    def draw 
        x = 20

        for i in 0..4
            Image.new(DIE[@rolls[i]], x: x, y: 250, width: 100, height: 100)
            Image.new(DIE[@keeps[i]], x: x, y: 370, width: 100, height: 100)
            x += 120
        end
    end

    def roll_dice
        @rolls = Array.new(5) {rand 1..6}
    end
end

class DiceButton 
    attr_accessor :button_up 
    def initialize 
        @button_up = true 
    end

    def draw 
        if @button_up 
            @button = Image.new(BUTTON_UP_IMAGE, x: 215, y: 500, width: 190, height: 72, z: 0)
            @text = Text.new("Roll Dice", x: 245, y: 515, font: FONT, size: 35, color: "black", z: 1)
        else
            @button = Image.new(BUTTON_DOWN_IMAGE, x: 215, y: 500, width: 190, height: 72, z: 0)
            @text = Text.new("Roll Dice", x: 245, y: 518, font: FONT, size: 35, color: "black", z: 1)
        end
    end
end

class ScoreSheet 
    attr_accessor :scores 
    def initialize
        @scores = {
            :aces => nil, 
            :twos => nil, 
            :threes => nil, 
            :fours => nil, 
            :fives => nil, 
            :sixes => nil, 
            :bonus => nil, 
            :threeKind => nil, 
            :fourKind => nil, 
            :smStraight => nil, 
            :lgStraight=> nil, 
            :fullhouse => nil, 
            :yahtzee => nil,  
            :chance => nil
        }
    end

    def draw 
        @sheet = Image.new(SCORESHEET, x: 620, y: 20, width: 360, height: 760)
    end

    
end

dice = Dice.new 
dice_button = DiceButton.new
scores = ScoreSheet.new

update do 
    clear
    dice.draw
    dice_button.draw
    scores.draw
    labels = [
        Text.new("CATEGORIES", x: 670, y: 32, font: FONT, size: 30, color: "black"),
        Text.new("SCORES", x: 874, y: 32, font: FONT, size: 30, color: "black"),
        Text.new("ACES", x: 710, y: 78, font: FONT, size: 30, color: "black"),
        Text.new("TWOS", x: 706, y: 125, font: FONT, size: 30, color: "black"),
        Text.new("THREES", x: 700, y: 172, font: FONT, size: 30, color: "black"),
        Text.new("FOURS",x: 706, y: 219, font: FONT, size: 30, color: "black"),
        Text.new("FIVES", x: 711, y: 267, font: FONT, size: 30, color: "black"),
        Text.new("SIXES", x: 710, y: 314, font: FONT, size: 30, color: "black"),
        Text.new("BONUS", x: 704, y: 361, font: FONT, size: 30, color: "black"),
        Text.new("3 of a KIND", x: 680, y: 408, font: FONT, size: 30, color: "black"),
        Text.new("4 of a KIND", x: 678, y: 455, font: FONT, size: 30, color: "black"),
        Text.new("FULL HOUSE", x: 678, y: 502, font: FONT, size: 30, color: "black"),
        Text.new("SM STRAIGHT", x: 670, y: 549, font: FONT, size: 30, color: "black"),
        Text.new("LG STRAIGHT", x: 670, y: 597, font: FONT, size: 30, color: "black"),
        Text.new("YAHTZEE", x: 690, y: 644, font: FONT, size: 30, color: "black"),
        Text.new("CHANCE", x: 693, y: 691, font: FONT, size: 30, color: "black"),
        Text.new("TOTAL", x: 700, y: 738, font: FONT, size: 30, color: "black")
    ]

end

# Mouse Down Events 
on :mouse_down do |event|
    # Roll Dice Button 
    if event.x.between?(215, 405) and event.y.between?(500, 572)
        dice_button.button_up = false

    # Keep Dice
    elsif event.x.between?( 20, 120) and event.y.between?(250, 350) and dice.rolls[0] != 0
        dice.keeps[0] = dice.rolls[0]
        dice.rolls[0] = 0
    elsif event.x.between?(140, 240) and event.y.between?(250, 350) and dice.rolls[1] != 0
        dice.keeps[1] = dice.rolls[1]
        dice.rolls[1] = 0
    elsif event.x.between?(260, 360) and event.y.between?(250, 350) and dice.rolls[2] != 0 
        dice.keeps[2] = dice.rolls[2]
        dice.rolls[2] = 0
    elsif event.x.between?(380, 480) and event.y.between?(250, 350) and dice.rolls[3] != 0
        dice.keeps[3] = dice.rolls[3]
        dice.rolls[3] = 0
    elsif event.x.between?(500, 600) and event.y.between?(250, 350) and dice.rolls[4] != 0
        dice.keeps[4] = dice.rolls[4]
        dice.rolls[4] = 0

    # Unkeep Dice
    elsif event.x.between?( 20, 120) and event.y.between?(370, 470) and dice.keeps[0] != 0
        dice.rolls[0] = dice.keeps[0]
        dice.keeps[0] = 0
    elsif event.x.between?(140, 240) and event.y.between?(370, 470) and dice.keeps[1] != 0
        dice.rolls[1] = dice.keeps[1]
        dice.keeps[1] = 0
    elsif event.x.between?(260, 360) and event.y.between?(370, 470) and dice.keeps[2] != 0
        dice.rolls[2] = dice.keeps[2]
        dice.keeps[2] = 0
    elsif event.x.between?(380, 480) and event.y.between?(370, 470) and dice.keeps[3] != 0
        dice.rolls[3] = dice.keeps[3]
        dice.keeps[3] = 0
    elsif event.x.between?(500, 600) and event.y.between?(370, 470) and dice.keeps[4] != 0
        dice.rolls[4] = dice.keeps[4]
        dice.keeps[4] = 0

    # Choose category
    elsif event.x.between?(625, 975)
        if event.y.between?(73, 115)
            puts "aces"
        elsif event.y.between?(119, 161)
            puts "twos"
        elsif event.y.between?(166, 209)
            puts "threes"
        elsif event.y.between?(213, 257)
            puts "fours"
        elsif event.y.between?(260, 305)
            puts "fives"
        elsif event.y.between?(309, 351)
            puts "sixes"
        elsif event.y.between?(403, 445)
            puts "3"
        elsif event.y.between?(449, 492)
            puts "4"
        elsif event.y.between?(496, 539)
            puts "full"
        elsif event.y.between?(543, 586)
            puts "small"
        elsif event.y.between?(591, 634)
            puts "large"
        elsif event.y.between?(638, 682)
            puts "yahtzee"
        elsif event.y.between?(685, 728)
            puts "chance"
        end
    end
end

# Mouse Up Events
on :mouse_up do |event| 
    # Roll Dice Button 
    if !dice_button.button_up
        dice.roll_dice 
        dice_button.button_up = true
    end
end

show