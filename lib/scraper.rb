#require the libraries that we need 
require 'open-uri' #open the file on the internet
require 'Nokogiri'  

class Scraper
	attr_reader :html

	def initialize(url)
		download = open(url)
		@html = Nokogiri::HTML(download)
	end

	# def get_students_names
	# 	html.search("h3").text
	# end

	def get_names
	    face = html.search(".student .card")
	    students = []
	    face.collect do |element|
	      students << element.text
	    end
	 end

  def get_students_blogs
    #href attribute <html element attributes (=)
    
    blog_url = html.search("ul.social a.blog")
    blog_url_array = []

    blog_url.each do |index|
            blog_url_array << index["href"]
            debugger
    end
    blog_url_array
  end
    # def get_name
    #             #not instance variable, method cuz of :html attr_reader
    #             #all_the_h3s = html.search("h3") #search returns back the tags and everything inside of it "a" all the <a>s. Return a a html object to all_the_h3s.
    #             #all_the_h3s.text #.text is a method that gives the content of the tag. Can be called on the special Nokogiri object. Returns a object of String. 
                
    #             all_the_h3s = @html.search("h3").to_s.gsub(" ", "*").gsub("</h3>", "<h3>").gsub("<h3>", " ").split
    #         all_the_h3s.collect do |name|
    #                   name.gsub("*", " ")
    #         end
    # end

	def twitter_url
		twitter = []
		text = html.search("a").text.split(" ")
		text.each do |element|
			if element.to_s.match(/@/)
				twitter << element
			end
		end
			return twitter
	end

	
	def blog_url

	end

end




my_scraper = Scraper.new("http://flatironschool-bk.herokuapp.com/")
puts my_scraper.get_students_blogs
#everytime we build a scraper we need to give it a url.
# folder 
# -> sub-folder

#class 
#->class method
#->constant

# class::class_method
# class::constant