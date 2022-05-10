kuran = require "./dene.json"

log = console.log
yaz = require "fs"
min = +Infinity

#https://wordpress.org/support/topic/ignoring-arabic-diacritics/
remap = {
    'إ' : 'ا', 'آ' : 'ا', 'أ' : 'ا', 'ئ' : 'ى', 'ة' : 'ه', 'ؤ' : 'و', 'آ' : 'ا', "ء" : " "
}

test = ( sonuc, mevcut ) ->    
    sonuc + mevcut.toNumber()

Number.prototype.toNumber   = -> this

Array.prototype.toNumber    = ->
    @reduce test, 0

String.prototype.toNumber   = ->
    metin = this
        .toString().trim()
        .replace(/s+/, "")
        .split( "" )
        .map( (c) -> remap[c] or c )
        .filter( (d) -> d.charCodeAt(0) > 1000 )
        .join( "" )

    unless metin.length-1
        metin = metin[remap] or metin
        deger = metin.charCodeAt(0) - 1575
        return deger

    return metin.split("").toNumber()


tekles = (deger) ->
    toplam = 0
    for k in deger.toString().split("")
        toplam += (k * 1)
    
    if toplam.toString().length > 1
        return tekles toplam

    return toplam

for { name: sure_ad, aya: ayetler, index: sure_no, harf }, sure_indeks in kuran

    a = 0

    for { index: ayet_no, text: metin }, ayet_indeks in ayetler
        if !ayet_indeks
            console.log metin.substr(0, harf.length), " - ", harf
            metin = metin.substr( harf.length).trim()

        metin.split(" ").map((c) -> a += c.toNumber())
    
    c = "" 
    harf.split(" ").map((d) -> c+= " "+ d.toNumber())


    kuran[sure_indeks] = { sure:ayetler.length, sonuc:a, deger:c, harf, aharf:(a/c).toFixed(0)*1 }



console.table ISLEM: "Toplam değerin Değer'e modunun alınması"
console.table kuran
console.log kuran
























yaz.writeFileSync "denendi/#{Date.now()}.json", JSON.stringify kuran, null, "\t"
yaz.writeFileSync "deneme.txt", parseFloat(yaz.readFileSync("deneme.txt"))+1