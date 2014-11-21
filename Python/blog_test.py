import pymongo
import bottle
from tweepy import API

@bottle.route('/')
def index():
    from pymongo import Connection
    connection = Connection('localhost',27017)
    db = connection.twitter
    names = db.names

    item = names.find_one()
    return 'Hello %s' % item['name']

@bottle.post('/gettweets')
def post_gettweets():
    page = 1
    keyword = bottle.request.forms.get("tweetKeyword")
    maxPage = bottle.request.forms.get("pages")
    print keyword
    print maxPage
    results =[]
    twitter_api = API()
    for page in range(int(maxPage)):
        tweets = twitter_api.search(keyword, page=page)
        for tweet in tweets:
            result.append(tweet)
    print len(result)
    
@bottle.get('/gettweets')
def get_gettweets():
    return bottle.template("gettweets_template", dict(tweetKeyword="",pages=1, errors=""))
    

bottle.debug(True)
bottle.run(host='localhost',port=8083)
