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
        .split( "" )
        .map( (c) -> remap[c] or c )
        .filter( (d) -> d.charCodeAt(0) > 1573 )
        .join( "" )
        .replace(/s+/, "")

    unless metin.length-1
        metin = metin[remap] or metin
        deger = metin.charCodeAt(0) - 1574
        return deger

    return metin.split("").toNumber()


for { name: sure_ad, aya: ayetler, index: sure_no, harf }, sure_indeks in kuran

    for { index: ayet_no, text: metin }, ayet_indeks in ayetler
        ayetler[ayet_indeks] = metin.toNumber()
    
    toplam  = ayetler.toNumber()
    deger   = harf.toNumber()
    sonuc   = (toplam % deger).toFixed(0) * 1

    kuran[sure_indeks] = { sure:ayetler.length, sonuc, deger, toplam, harfler:harf }



console.table ISLEM: "Toplam değerin Değer'e modunun alınması"
console.table kuran
console.log kuran
























yaz.writeFileSync "denendi/#{Date.now()}.json", JSON.stringify kuran, null, "\t"
yaz.writeFileSync "deneme.txt", parseFloat(yaz.readFileSync("deneme.txt"))+1