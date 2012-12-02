class Therapist < ActiveRecord::Base
require 'nokogiri'
require 'open-uri'
  attr_accessible :address, :email, :name, :phone, :speciality


  def self.create_db
    i = 1
    1.times do
      url = 'http://scpc.cl/socios/lista-de-socios/?page='+i.to_s
      doc = Nokogiri::HTML(open(url))

      doc.css("html body#bp-default.page div#page div#container div#content div.padder div#members-dir-list.members ul#members-list.item-list li div.item div.item-meta strong").each do |item|
        a = item.text
        t=Therapist.new
        t.speciality = item.text
        t.address = item.text
        t.phone = item.text
        t.email = item.text
      end

    end

  end

end
