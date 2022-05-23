require 'ruby2d'

set title: "Yahtzee"
set width: 1000
set height: 800
set background: "#f1f1f1"
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

BUTTON_UP_IMAGE = "./images/button_up.png"
BUTTON_DOWN_IMAGE = "./images/button_down.png"

SCORESHEET = "./images/scoresheet.png"

# Rolls
roll1 = Image.new(DIE_BOX, x: 20, y: 250, width: 100, height: 100)
roll2 = Image.new(DIE_BOX, x: 140, y: 250, width: 100, height: 100)
roll3 = Image.new(DIE_BOX, x: 260, y: 250, width: 100, height: 100)
roll4 = Image.new(DIE_BOX, x: 380, y: 250, width: 100, height: 100)
roll5 = Image.new(DIE_BOX, x: 500, y: 250, width: 100, height: 100)

# Keeps
keep1 = Image.new(DIE_BOX, x: 20, y: 370, width: 100, height: 100)
keep2 = Image.new(DIE_BOX, x: 140, y: 370, width: 100, height: 100)
keep3 = Image.new(DIE_BOX, x: 260, y: 370, width: 100, height: 100)
keep4 = Image.new(DIE_BOX, x: 380, y: 370, width: 100, height: 100)
keep5 = Image.new(DIE_BOX, x: 500, y: 370, width: 100, height: 100)

# Button
button = Image.new(BUTTON_UP_IMAGE, x: 215, y: 500, width: 190, height: 72, z: 0)
button_text = Text.new("Roll Dice", x: 245, y: 515, font: FONT, size: 35, color: "black", z: 1)

# Scoresheet
scores = Image.new(SCORESHEET, x: 620, y: 20, width: 360, height: 760)

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

# Starting Values
roll_dice_down = false

def roll_dice 
    rolls = Array.new(5) { rand 1..6 }

    roll1.remove 
    roll2.remove 
    roll3.remove 
    roll4.remove 
    roll5.remove 
    roll6.remove 

    # roll1 = Image.new( 

    # )
end

# Mouse Down Events
on :mouse_down do |event|
    x = event.x
    y = event.y 

    # Roll Dice Button
    if x.between?(215, 405) and y.between?(500, 572)
        roll_dice_down = true
        button.remove
        button = Image.new(
            BUTTON_DOWN_IMAGE,
            x: 215, y: 500,
            width: 190, height: 72
        )
        button_text.y = 518

        roll_dice
    end
end

# Mouse Up Events
on :mouse_up do |event|

    # Roll Dice Button
    if roll_dice_down
        button.remove
        button = Image.new(
            BUTTON_UP_IMAGE,
            x: 215, y: 500, 
            width: 190, height: 72
        )
        button_text.y = 515
        roll_dice_down = false
    end
end

show