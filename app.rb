require "./lib/scraper"
require "./lib/student"

student_scraper = Scraper.new("http://flatironschool-bk.herokuapp.com/")

names = student_scraper.get_name
twitters = student_scraper.twitter_url
blogs = student_scraper.get_students_blogs


students = []
28.times do |i|
        students << Student.new(names[i], twitters[i], blogs[i])
end

puts students