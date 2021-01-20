require 'csv'
require 'byebug'

if ARGV.length == 2
	csv_folder = ARGV[0]
	output_file = ARGV[1]
else
	puts "Usage: ruby parsemovies.rb [csvs_folder] output.csv"
	puts "Example: ruby parsemovies.rb movies/ list.csv"
	exit 1
end

input_csvs = Dir.glob(File.join(csv_folder, "*.csv"))
column_names = ["imdburl", "title", "year"] + input_csvs.map {|e| File.basename(e)}

movies = Hash.new

input_csvs.each do | csv_path |
	puts "Parsing: #{csv_path}..."
	CSV.foreach(csv_path, headers: true, :encoding => 'ISO-8859-1') do |csv_row| 
		unless movies.include?(csv_row["imdburl"])
			movies[csv_row["imdburl"]] = {"imdburl" => csv_row["imdburl"], "title" => csv_row["title"], "year" => csv_row["year"]}
		end
		movies[csv_row["imdburl"]][File.basename(csv_path)] = csv_row["rank"]
	end
end

CSV.open(output_file, "w", headers: column_names) do |csv|
	csv << column_names
	movies.each do |h|
		csv << h[1].values_at(*column_names)
	end
end
puts "\nDone! File #{output_file} contains #{movies.size} movie entries (from #{input_csvs.size} input csvs)."