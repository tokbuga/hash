db = require "mysql2/promise"

kuran = require "./dene.json"
adlar = require "./adlar.json"

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

init() if init = ->

    sql = await db.createConnection {
        user : "root", password: "nuYj2h3XaW", database : "hash"
    }

    for { name: sure_ad, aya: ayetler, index: sure_no, harf }, sure_indeks in kuran

        sadtr = adlar.find( (n) -> !(n.no-sure_no) ).ad

        for { index: ayet_no, text: metin }, ayet_indeks in ayetler
            for karakter, kindeks in metin.split("")
                harf = remap[karakter] or karakter
                row = {
                    sure : sure_no
                    sadar: sure_ad
                    sadtr: sadtr 
                    ayetler:ayetler.length
                    ayet:ayet_no
                    kindeks: kindeks
                    karakter:karakter
                    harf:harf
                    kod:harf.charCodeAt(0)
                    kkod:karakter.charCodeAt(0)
                    k1534:karakter.charCodeAt(0)-1534
                    k1535:karakter.charCodeAt(0)-1535
                    k1536:karakter.charCodeAt(0)-1536
                    h1534:harf.charCodeAt(0)-1534
                    h1535:harf.charCodeAt(0)-1535
                    h1536:harf.charCodeAt(0)-1536
                    khex: "0xF1" + karakter.charCodeAt(0).toString(16)
                    hhex: "0xF1" + harf.charCodeAt(0).toString(16)
                }

                cols = Object.keys(row).join(",")
                vals = Object.values(row)
                qmks = Object.keys(row).map( (e) -> "?" ).join(",")

                console.log kindeks, "\t", metin.length, "\t", ayet_no, "\t", ayet_indeks, "\t", ayetler.length, "\t", sure_no, "\t", sure_indeks, "\t", kuran.length, "\t", karakter.charCodeAt(0)

                await sql.query "INSERT INTO q (#{cols}) VALUES (#{qmks})", vals




















yaz.writeFileSync "denendi/#{Date.now()}.json", JSON.stringify kuran, null, "\t"
yaz.writeFileSync "deneme.txt", parseFloat(yaz.readFileSync("deneme.txt"))+1