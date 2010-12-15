namespace :application do

  task :scrap => :environment do

    ROOT_URL = 'http://pypi.python.org/'

    agent = Mechanize.new
    page  = agent.get("#{ROOT_URL}pypi?:action=index")
    doc = Nokogiri::HTML(page.body)
    doc.css('html body div#content-body div#body-main div#content div.section table.list tr').each do |tr|
      begin
        p = Package.new()
        p.title = tr.at_xpath('td[1]').content
        p.link = tr.at_xpath('td[1]/a').attribute('href').value
        p.description = tr.at_xpath('td[2]').content
        inner_page  = agent.get("#{ROOT_URL}#{p.link}")
        inner_doc = Nokogiri::HTML(inner_page.body)
        if(inner_history = inner_doc.at_css('html body div#content-body div#body-main div#content div.section table.list'))
          inner_history.element_children.each_with_index do |e, i| 
            next if i == 0
            ph = PackageHistory.new(:package => p)
            ph.title = e.at_xpath('td[1]').content.to_s.strip
            ph.package_type = e.at_xpath('td[2]').content.to_s.strip
            ph.version = e.at_xpath('td[3]').content.to_s.strip
            ph.date = e.at_xpath('td[4]').content.to_s.strip
            ph.size = e.at_xpath('td[5]').content.to_s.strip
            ph.downloads = e.at_xpath('td[6]').content.to_s.strip
            ph.save
          end
        end
        sleep 1
      rescue
        next
      end
    end

  end

end
