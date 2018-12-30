# Tim2460's Movie Ranks
A very simple Ruby script to summarize movie ranks in a single CSV as requested by Tim2460.

## parsemovies.rb
Opens the csvs in the input folder, transforms the data and outputs it to the specified destination csv.

### Usage
```
$ ruby parsemovies.rb
Usage: ruby parsemovies.rb [csvs_folder] output.csv
Example: ruby parsemovies.rb movies/ list.csv
```
### Example
```
$ ruby parsemovies.rb movies/ output.csv
Parsing: movies/100+american+independent+films+bfi+screen+guide.csv...
Parsing: movies/100+animated+feature+films+bfi+screen+guides.csv...
Parsing: movies/100+best+british+films.csv...
(...)
Parsing: movies/venice+film+festival+-+golden+lion.csv...
Parsing: movies/war.csv...
Parsing: movies/western.csv...
Parsing: movies/yle+news+best+finnish+films+of+all+time.csv...

Done! File output.csv contains 15029 movie entries (from 194 input csvs).
```
