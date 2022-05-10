kuran = require "./dene.json"

log = console.log
yaz = require "fs"
min = +Infinity

mapping = {
    1: [ 1575, 1570, 1571, 1573 ]      #!elif    ب
    2: [ 1576 ]
    3: [ 1578, 1577 ] 

}

String.prototype.toNumber   = ->
    @replace( /\s+/gi, "" ).split("").map (c) -> c.charCodeAt()-1535


log "وإن يكاد الذين كفروا ليزلقونك بأبصارهم لما سمعوا الذكر ويقولون إنه لمجنون".toNumber()























yaz.writeFileSync "denendi/#{Date.now()}.json", JSON.stringify kuran, null, "\t"
yaz.writeFileSync "deneme.txt", parseFloat(yaz.readFileSync("deneme.txt"))+1