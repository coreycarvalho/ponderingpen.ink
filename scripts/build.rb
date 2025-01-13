#!/usr/bin/env ruby

# Define paths to your scripts (adjust if they're in a different directory)
currently_reading_script = "scripts/hardcover_currently_reading.rb"
read_script = "scripts/hardcover_read.rb"

# Run the "Currently Reading" script
puts "Running hardcover_currently_reading.rb..."
unless system("ruby #{currently_reading_script}")
  puts "Error fetching currently reading books. Exiting build process."
  exit 1
end
puts "Successfully fetched currently reading books."

# Run the "Books Read in 2025" script
puts "Running hardcover_read.rb..."
unless system("ruby #{read_script}")
  puts "Error fetching books read in 2025. Exiting build process."
  exit 1
end
puts "Successfully fetched books read in 2025."

# Build the Jekyll site
puts "Building the Jekyll site..."
unless system("jekyll build")
  puts "Jekyll build failed."
  exit 1
end
puts "Jekyll build succeeded."

