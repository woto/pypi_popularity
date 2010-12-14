namespace :application do

  task :scrap => :environment do

    ROOT_URL = 'http://pypi.python.org/'

    agent = Mechanize.new
    page  = agent.get("#{ROOT_URL}pypi?:action=index")
    doc = Nokogiri::HTML(page.body)
    doc.xpath('/html/body/div[5]/div/div/div[3]/table/tr').each do |tr|
      begin
        p = Package.new()
        p.title = tr.at_xpath('td[1]').content
        p.link = tr.at_xpath('td[1]/a').attribute('href').value
        p.description = tr.at_xpath('td[2]').content
        inner_page  = agent.get("#{ROOT_URL}#{p.link}")
        inner_doc = Nokogiri::HTML(inner_page.body)
        debugger
        p.save
      rescue
        next
      end
    end

  end

end
