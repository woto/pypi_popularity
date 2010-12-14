import urllib2, time, sys
 
from BeautifulSoup import BeautifulSoup
 
BASE_URL = 'http://pypi.python.org/pypi/'
 
soup = BeautifulSoup(urllib2.urlopen('http://pypi.python.org/simple/'))
 
for i, a in enumerate(soup('a')):
    name = a.contents[0]
    url = a.attrs[0][1]
    url = BASE_URL + url
 
    try:
        package_soup = BeautifulSoup(urllib2.urlopen(url))
        try:
            values = (int(td.contents[0]) for td in package_soup('td', style='text-align: right;') if td.contents and td.contents[0].isdigit())
        except Exception:
            values = [-1]
    except Exception:
        values = [-2]
 
    print sum(values), name
    sys.stdout.flush() # So that I can tee to file and watch stdout
 
    # Be nice and don't hit PyPI too frequently
    time.sleep(1)
 
    # Break early when you are debugging the script
    # Uncomment this once you are ready to run for real
    if i > 9:
                break
 
print 'Fetched statistics from %d packages' % (i + 1)
