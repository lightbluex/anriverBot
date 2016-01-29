dateFormat = require('dateformat')
loc = ["osaka","hokkaido","sendai","kobe","fukuoka","kanazawa","nagoya","gunma","fukui","okinawa","kumamoto","saitama","tokyo","shizuoka","miyazaki","iwate","tochigi","kanagawa","kyoto","okayama","nagasaki","akita","nagano","ibaraki","saga","aomori","kagawa","kagoshima","niigata","hiroshima","chiba","nara","yamaguchi","tottori","yamanashi","binan","macho","cc","bimajo","hairstyle","vivi","sara","panahome-hyogo","pochacawa","wasedastyle","hanayome","megane","junior2","binan-kyoto","binan-kagoshima","binan_hanryupia","mask-bijin","2011jp","2012jp","2013jp","taiwan","thailand","hawaii","jakarta", "jp"]

meizi = ["waveya", "Bambino Kpop"]

module.exports = (robot) ->
#  robot.hear /妹子|萌妹/i, (msg) ->
#    msg.send "/anim #{msg.random meizi}"

  robot.hear /time( +[^ ]*)?/i, (msg)->
    place = ""
    if undefined != msg.match[1]
      place = msg.match[1].trim()
    time = dateFormat(new Date(), "HHMM")
    if place not in loc
      place = msg.random loc
    msg.send "http://www.bijint.com/assets/pict/#{place}/pc/#{time}.jpg"
