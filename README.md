# Barn Animal Sorter

## General Thoughts ##
  
* It was essential to group the parsed JSON file in a way that made sense. I chose to group my livestock by barn color preference because that is how they would need to be sorted.
* Grouping the livestock by barn color also helped make performing the each loop more seamless than trying to run it on the ungrouped state of the livestock. 
* Storing the barn as a hash and storing that in the barn holder array was best in order to return in JSON as advised.  


## Future Implementations ##
* Create barns before distribution of animals begins. Currently the barns are created AS the animals are added. In future implementations making the barns first then adding animaal will aid in the ability for the barns to have even distribution. I envision this working by adding a block of code that would determine the amount of barns needed based on the amount of animals and then create the barns first. See below code: 

```
total_animals = stocks.map{|stock| stock[:animal]}.length
  p total_animals

  barns_needed = (total_animals/4.0).ceil
  #9 animals would generate 3 barns 
```
  
From this point the barns would begin to distribute the animals similar to how cards are dealt. 

* Added Barn Class. Classes will be built to manage the barn creation and updating processed thus reducing the code in the runner.rb file. 
