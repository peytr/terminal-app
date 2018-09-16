# RESISTOR VALUE CALCULATOR
BY PETER AND MIKE
# Background
A resistor is a component that limits the flow of current in an electrical circuit.<br>
- Some Resistors are not labeled with their resistance value.<br>
- On some Resistors their resistance value is represented by coloured bands.
The app allows the user to input the colour of the resistor bands, the app will then calculate and return the resistance value of the resistor in Ohms.

# Dependencies
The Value Calculator Terminal app depends on two Gems.
- Colorize  0.8.1 <br >https://rubygems.org/gems/colorize<br>
```
gem install colorize
```
- Terminal Tables 1.8.0<br>
 https://rubygems.org/gems/terminal-table<br>
```
gem install terminal-table
```

# How to use.
In terminal navigate to the directory containing the application file.

then enter 
```
ruby terminal-app-0.0.6.rb
```
to run the application (must have ruby installed).

Follow the simple prompts, enter the first, second and third band colour names (Ignore the last gold or silver tolerance band).

The Terminal app will calculate the value of the resistor from the colours entered by the user.
# Challenges
The original plan was to use an Array to hold the resistor data and a Hash containing the multiplier data.<br>
The original idea was that the Array index position represented the value of the band colour. The Hash contained the band multiplier values.<br>
This made it difficult to retrieve data out of the Array and the Hash.<br>
We overcame this by having the band data inside a Hash within an Array. This allowed us to easily loop through the data retrieving the items required.
We used the terminal-table and colorize gems to improve the user output.
# Future Development
- Solve the colour  display in the final table output
- Include a tolerance calculation
- Add an option for a five band resistor
- Add an Ohms law calculator