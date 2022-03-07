require 'json'

require_relative 'livestock'
require_relative 'barn'


livestock = JSON.parse(File.read('./animals.json'),symbolize_names: true)[:livestock]
# I used this to convert the JSON to a readable ruby hash. ":livestock" was needed in order to acess eveverything within the livestock key. Which leaves us with an array of hashes. 
livestock_by_barn = livestock.group_by{|k| k[:barn]}
# the barns are now grouped by the key of barn 
livestock_by_barn


livestock_by_barn.each do |color, stocks| 
  #this each loop is used to access the color keys that have the value of an array of hashes of animals and there corresponding barn preferences. 

  # puts "the #{color} barn has:"
  # puts stocks.map{|stock| stock[:animal]} 
  # uncomment lines 17 and 18 for easier visualization 

  barn = { 'barn' => nil, 'animals' => [] }
  barn_holder = []
  #the code will need to render as JSON therefore I have created a hash that will later be stored in an array. 

  
  # puts "the #{color} barn has:"
  # puts stocks.map{|stock| stock[:animal]}

  count = 1 #withing the loop where the color and stocks wills accessed a counter is added to keep count for the lop that is to follow below
  stocks.map do |stock|    
    #as noted on line 15 stock is an array of hashes grouped by the animals barn preference. In order to access the specific animal within the hash the key :animal must be attached to stock like so: stock[:animal]
    if barn["animals"].length >= 4 
      #a barn should not have more than 4 animals therefore this condition is in place to determing if the length is less than or equal to 4. When starting. The barn animals key is an empty array when this first starts
        barn_holder << barn
        barn = {}
        count += 1
        barn["barn"] = "Barn_#{color}_#{count}"
        barn["animals"] = [stock[:animal]]
    else
      #since the barn has nothing in it yet the else condition will continue to run and add the color and count to the value of barn. Then the currenty animal is added as a value to the array in the animals key 
        barn["barn"] = "Barn_#{color}_#{count}"
        barn["animals"] << stock[:animal]
    end 
  end 
  barn_holder << barn 
  puts barn_holder.to_json
  

  puts ""
  puts ""
  puts ""

  
end


# [
#   {"barn": "Barn_Green_1", "animals": ["Duck", “Cow”, “Sheep”, “Donkey”]},
#   {"barn": "Barn_Green_2", "animals": ["Goat"]},
#   {"barn": "Barn_Brown_1", "animals": ["Goat", "Duck"]}
# ]

# p barn_holder

# p livestock[0]
# pp livestock_by_barn

# barn = Barn.new('silver','chick')

# p barn
# p barn.livestock
# p barn.add_livestock
