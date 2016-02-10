module.exports = (robot) ->
  robot.hear /^萌妹子 (.+)/i, (msg) ->
    turingKeyword = msg.match[1]
    if(!turingKeyword)
      turingKeyword = "喂"
    turingKey = "188ec6ccf213d916758024d691f6cdb3"
    turingUrl = "http://www.tuling123.com/openapi/api?key=#{turingKey}&info=#{encodeURIComponent turingKeyword}"

    robot.http(turingUrl)
      .get() (err, res, body) ->
        if res.statusCode isnt 200
          msg.send "Request didn't come back HTTP 200 :("
          return
        result = JSON.parse(body)
        code = result.code
        message = if result.text? then [result.text]
        switch code
          when 100000 then
          when 200000 then message.push(result.url)
          when 302000
            message.push("\n",item.article,item.icon,item.icon,item.detailurl) for item in result.list.slice(0,3) when item.article?
          when 305000
            message.push("\n",item.trainnum,item.start,item.terminal,item.starttime,item.endtime,item.icon,item.detailurl) for item in result.list.slice(0,3) when item.trainnum?
          when 306000
            message.push("\n",item.flight,item.starttime,item.endtime,item.icon) for item in result.list.slice(0,3) when item.flight?
          when 308000
            message.push("\n",item.name,item.icon,item.info,item.detailurl) for item in result.list.slice(0,3) when item.name?
          else
        message = message.join("\n")
        msg.send message
