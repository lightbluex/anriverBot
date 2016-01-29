num_of_blocks = 5 # 6 lines in one block

module.exports = (robot) ->
  robot.hear /^\/cl/i, (msg) ->
    msg.send ".\n\n\n\n\n." for i in [0..num_of_blocks]
