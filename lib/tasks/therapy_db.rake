desc "DB"
task :ther => :environment do
  require 'nokogiri'
  require 'open-uri'

i = 1
19.times do
  if i <= 19
  url = 'http://scpc.cl/socios/lista-de-socios/?page='+i.to_s
  doc = Nokogiri::HTML(open(url))
  num = doc.css("html body#bp-default.page div#page div#container div#content div.padder div#members-dir-list.members ul#members-list.item-list li").count
  tnum = 25
  a = 1
  doc.css("html body#bp-default.page div#page div#container div#content div.padder div#members-dir-list.members ul#members-list.item-list li")[0..tnum].each do |item|
    begin
      a = 1
      t = Therapist.new
      t.name = item.css(".item-title").text.to_s.gsub("\n","").gsub("\t","")

      item.css( "div.item-meta strong").each do |attr|
         case a
         when 1
          a = a +1
         when 2
          t.speciality = attr.text.to_s
          a = a +1
         when 3
          t.address = attr.text.to_s
          a = a +1
         when 4
          t.phone = attr.text.to_s
          a = a +1
         when 5
          t.email = attr.text.to_s
          a = 1
         end
      end

      t.save
      puts "---FIN- TERAPEUTA--"
    #t=Therapist.new
    rescue => ex
      puts ex.backtrace.join("\n")
    end
  end
  i = 1 +1
  end
end

end
