require 'terminal-table'
require 'colorize'

# array of band hashes containing color, color value, multiplier and multiplier symbol
bands = [{
    color: :black,
    color_value: 0,
    resistor_multiplier: 1,
    multiplier_symbol: " ohm",
},
{
    color: :brown,
    color_value: 1,
    resistor_multiplier: 10,
    multiplier_symbol: " ohm",
},
{
    color: :red,
    color_value: 2,
    resistor_multiplier: 100,
    multiplier_symbol: " ohm",
},
{
    color: :orange,
    color_value: 3,
    resistor_multiplier: 1,
    multiplier_symbol: "K ohm",
},
{
    color: :yellow,
    color_value: 4,
    resistor_multiplier: 10,
    multiplier_symbol: "K ohm",
},
{
    color: :green,
    color_value: 5,
    resistor_multiplier: 100,
    multiplier_symbol: "K ohm",
},
{
    color: :blue,
    color_value: 6,
    resistor_multiplier: 1,
    multiplier_symbol: "M ohm",
},
{
    color: :violet,
    color_value: 7,
    resistor_multiplier: 10,
    multiplier_symbol: "M ohm",
},
{
    color: :grey,
    color_value: 8,
    resistor_multiplier: 100,
    multiplier_symbol: "M ohm",
},
{
    color: :white,
    color_value: 9,
    resistor_multiplier: 1000,
    multiplier_symbol: "M ohm",
}
]

# resistor band color selection table for user
rows = []
rows << ['BAND', 'COLOUR']
rows << :separator
rows << ['Black', "----------".colorize(:color => :black, :background => :black)]
rows << :separator
rows << ['Brown', "----------".colorize(:color => :yellow, :background => :yellow)]
rows << :separator
rows << ['Red', "----------".colorize(:color => :red, :background => :red)]
rows << :separator
rows << ['Orange', "----------".colorize(:color => :light_red, :background => :light_red)]
rows << :separator
rows << ['Yellow', "----------".colorize(:color => :light_yellow, :background => :light_yellow)]
rows << :separator
rows << ['Green', "----------".colorize(:color => :green, :background => :green)]
rows << :separator
rows << ['Blue', "----------".colorize(:color => :blue, :background => :blue)]
rows << :separator
rows << ['Violet', "----------".colorize(:color => :magenta, :background => :magenta)]
rows << :separator
rows << ['Grey', "----------".colorize(:color => :light_black, :background => :light_black)]
rows << :separator
rows << ['White', "----------".colorize(:color => :white, :background => :white)]

table = Terminal::Table.new :rows => rows
table.align_column(0, :center)
table.align_column(1, :center)

puts table
puts

def create_resistor bands
    resistor = []
    # user inputs first resistor band color
    # search bands array for color hash and push to resistor array
    puts "Please enter the color of the first band: "
    first_band = gets.strip.downcase.to_sym
    bands.map do |band|
        if band[:color] == first_band
            resistor << band
        end
    end
    # user inputs second resistor band color
    # search bands array for color hash and push to resistor array
    puts "Please enter the color of the second band: "
    second_band = gets.strip.downcase.to_sym
    bands.map do |band|
        if band[:color] == second_band
            resistor << band
        end
    end
    # user inputs third resistor band color
    # search bands array for color hash and push to resistor array
    puts "Please enter the color of the third band: "
    third_band = gets.strip.downcase.to_sym

    bands.map do |band|
        if band[:color] == third_band
            resistor << band
        end
    end

    # find the value of the first band color from the first band hash in the resistor array
    first_band_value = resistor[0][:color_value].to_s
    # find the value of the first band color from the second band hash in the resistor array
    second_band_value = resistor[1][:color_value].to_s
    # concatenate the first two values
    base_resistor_value = first_band_value + second_band_value 
    # find the value of the multiplier band color in the third band hash in the resistor array
    multiplier_band_value = resistor[2][:resistor_multiplier]
    # find the symbol of the third band color
    symbol = resistor[2][:multiplier_symbol]
    # create the final value, multiplying the base value by the multiplyer value
    final_value = base_resistor_value.to_i * multiplier_band_value
    # interpolate the calculated resistance value into the final ouput to the user
    final_value_output = "Your resistor is #{final_value}#{symbol}"


# table for the final ouput to the user
rows = []
rows << ["----".colorize(:color => first_band, :background => first_band), "----".colorize(:color => second_band, :background => second_band), "----".colorize(:color => third_band, :background => third_band)]
rows << :separator
rows << [first_band.capitalize, second_band.capitalize, third_band.capitalize]


table = Terminal::Table.new :title => final_value_output, :alignment => :center, :rows => rows
table.align_column(0, :center)
table.align_column(1, :center)
table.align_column(2, :center)

puts
puts
puts table
puts
end

create_resistor(bands)