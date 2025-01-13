require 'httparty'
require 'json'
require 'fileutils'

# Configuration
AUTH_HEADER = ENV['HARDCOVER_AUTH_HEADER']
USER_ID = 25464  # Replace with your actual user ID
OUTPUT_DIR = '_data'
OUTPUT_FILE = File.join(OUTPUT_DIR, 'hardcover_currently_reading.json')
GRAPHQL_ENDPOINT = 'https://api.hardcover.app/v1/graphql'

# GraphQL query
GRAPHQL_QUERY = <<-GRAPHQL
query CurrentlyReadingBooks($userId: Int!, $limit: Int, $offset: Int) {
  list_books(
    distinct_on: book_id
    limit: $limit
    offset: $offset
    where: {
      user_books: {
        user_id: { _eq: $userId },
        user_book_status: { status: { _eq: "Currently Reading" } }
      }
    }
  ) {
    book {
      title
      pages
      release_date
      cached_image
    }
  }
}
GRAPHQL

# Ensure the _data directory exists
FileUtils.mkdir_p(OUTPUT_DIR) unless Dir.exist?(OUTPUT_DIR)

# Fetch books from the API
response = HTTParty.post(
  GRAPHQL_ENDPOINT,
  headers: {
    'Authorization' => AUTH_HEADER,
    'Content-Type' => 'application/json'
  },
  body: {
    query: GRAPHQL_QUERY,
    variables: { userId: USER_ID, limit: 10, offset: 0 }
  }.to_json
)

# Parse and extract book data
books = if response.code == 200
          data = response.parsed_response.dig('data', 'list_books') || []
          data.map do |entry|
            book = entry['book']
            {
              title: book['title'],
              pages: book['pages'],
              release_date: book['release_date'],
              cached_image_url: book.dig('cached_image', 'url')
            }
          end
        else
          puts "Error fetching data: #{response.code} - #{response.body}"
          []
        end

# Save to JSON file
if books.any?
  File.write(OUTPUT_FILE, JSON.pretty_generate(books))
  puts "Hardcover data saved to #{OUTPUT_FILE}"
else
  puts "No books to save."
end

