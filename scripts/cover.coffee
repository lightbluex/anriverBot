module.exports = (robot) ->
  robot.hear /^giphy (.+)/i, (msg) ->
    giphyKeyword = msg.match[1]
    if(!giphyKeyword)
      giphyKeyword = "lol"
    apikey = "dc6zaTOxFJmzC"
    apiurl = "http://api.giphy.com/v1/gifs/search?q=#{giphyKeyword}&api_key=#{apikey}"

    robot.http(apiurl)
      .get() (err, res, body) ->
        if res.statusCode isnt 200
          msg.send "Request didn't come back HTTP 200 :("
          return
        gifs = JSON.parse(body)
        gifs = gifs.data

        unless gifs? && gifs.length > 0
          return msg.send "No gif results for \"#{giphyKeyword}\""
        gif = msg.random gifs
        gifurl = gif.images.original.url

        msg.send gifurl

  robot.hear /^tumblr (.+)/i, (msg) ->
    tumblrKeyword = msg.match[1]
    if(!tumblrKeyword)
      tumblrKeyword = "girl"
    tumblrKey = "eFDKDsJeeOfni11vyWdLLTYha0ww5ZxJAlM3yGB1HivfXRv5Y4"
    tumblrUrl = "http://api.tumblr.com/v2/tagged?tag=#{encodeURIComponent tumblrKeyword}&api_key=#{tumblrKey}"

    robot.http(tumblrUrl)
      .get() (err, res, body) ->
        if res.statusCode isnt 200
          msg.send "Request didn't come back HTTP 200 :("
          return
        images = JSON.parse(body)
        images = images.response

        photos = (image for image in images when image.photos?)

        unless photos.length > 0
           return msg.send "No photo results for \"#{tumblrKeyword}\""

        image = msg.random photos
        image = msg.random image.photos
        imageUrl = image.alt_sizes[1].url

        msg.send imageUrl
