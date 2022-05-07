kuran = require "./data.json"
adlar = require "./adlar.json"

log = console.log

test = ( sonuc, mevcut ) ->    
    sonuc + mevcut.toNumber()

Number.prototype.toNumber   = -> this

Array.prototype.toNumber    = ->
    @reduce test, 0

String.prototype.toNumber   = ->
    return @charCodeAt(0) unless @length-1
    return @split("").toNumber()


denenecek = []

for { name: sure_ad, aya: ayetler, index: sure_no }, sure_indeks in kuran

    dene = false
    harf = ayetler[0].text.split(/\s+/, 1)[0]

    if  harf.length < 6
        sure = adlar.find (s) -> !(s.no-sure_no)
        kuran[sure_indeks].harf = harf

        continue unless sure.oku

        log "dene:", sure, ayetler[0].text, "harf:", "#{harf}" : dene = harf.length

    for { index: ayet_no, text: metin }, ayet_indeks in ayetler
        ayetler[ayet_indeks] = metin.toNumber()
    
    if  dene
        log sure_no, "->", sure_ad, "->", sure_ad.toNumber()
        log sure_no, sure_ad, ayetler, n = ayetler.toNumber()
        denenecek.push kuran[ sure_indeks ]


#require("fs").writeFileSync "dene.json", JSON.stringify(denenecek, null, "\t")

log "denenecek:", denenecek.length
