import newspaper
import feedparser

def rssLinks(url):
    all_links=[]
    feed = feedparser.parse(url)
    for i in range(len(feed['items'])):
        link=feed['items'][i]['links'][0]['href'].split("=")
        all_links.append(link[len(link)-1])
    return all_links


def rssTopicLinks(topic):
    url = "https://news.google.com/news?cf=all&hl=en&pz=1&ned=us&q="+topic+"&output=rss"
    return rssLinks(url)

def docMaker(links):
    article=newspaper.Article(links)
    article.download()
    article.parse()
    article.nlp()
    doc={"title":article.title,"text":article.text,"authors":article.authors,"summary":article.summary,
        "keywords":article.meta_keywords,"publish_date":article.publish_date,"url": links
        }
    return doc

def main():
    DB_FLAG="mongo"
    trump_links=rssTopicLinks("trump")
    clinton_links=rssTopicLinks("clinton")
    if (DB_FLAG == str)
    from pymongo import MongoClient
    client = MongoClient()
    client = MongoClient('mongodb://192.168.1.5:27017/')
    db = client['PR']
    trump_db = db['trump']
    clinton_db = db['clinton']

    for i in trump_links:
    doc= docMaker(i)
    fillter = {"title":doc["title"],"authors":doc["authors"],"publish_date":doc["publish_date"],"url":doc["url"]}
    trump_db.update_one(fillter,{'$setOnInsert': doc}, upsert=True)

    for i in clinton_links:
    doc= docMaker(i)
    fillter = {"title":doc["title"],"authors":doc["authors"],"publish_date":doc["publish_date"],"url":doc["url"]}
    clinton_db.update_one(fillter,{'$setOnInsert': doc}, upsert=True)



if __name__ == "__main__":
    main()
