module.exports = (robot) ->
  robot.hear /^cafe$/i, (msg) ->
    cafe = [0, 0]
    sum = 20000
    for num in [0..sum-1]
      cafe[Math.floor(Math.random() * cafe.length)]++
    result = "9l: #{cafe[0]}, 22l: #{cafe[1]}"
    msg.send result
