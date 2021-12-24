var time = argument[0]
var start = argument[1]
var change = argument[2]
var duration = argument[3]

time /= duration

time -= 1

return(change*(time*time*time*time*time + 1) + start)