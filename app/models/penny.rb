require "csv"
class Penny < ActiveRecord::Base

  searchkick fields: [:site, :body, :title]

  def self.filtered_csv(penny)
    CSV.generate do |csv| 
      csv << ["Title", "Body", "Location", "Image"]
      penny.each do |penny| 
        csv << [penny.title, penny.body, penny.contact, penny.image]
      end
    end 
  end 

  def self.to_csv
    CSV.generate do |csv| 
      csv << ["Title", "Body", "Location", "Image"]
      Penny.all.each do |penny| 
        csv << [penny.title, penny.body, penny.contact, penny.image]
      end
    end 
  end 

end
