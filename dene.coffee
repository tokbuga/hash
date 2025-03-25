kuran = require "./dene.json"

log = console.log
yaz = require "fs"
min = +Infinity



chars = {
    '32'  : { char: ' ', s1: 0, s2: 0, s3: -1, s4: -1, s5: 0 }
    '1569': { char: 'ء', s1: 1, s2: 1, s3: 0, s4: 27, s5: 28 }
    '1570': { char: 'آ', s1: 1, s2: 1, s3: 0, s4: 27, s5: 28 }
    '1571': { char: 'أ', s1: 1, s2: 1, s3: 0, s4: 27, s5: 28 }
    '1572': { char: 'ؤ', s1: 6, s2: 27, s3: 26, s4: 1, s5: 2 }
    '1573': { char: 'إ', s1: 1, s2: 1, s3: 0, s4: 27, s5: 28 }
    '1574': { char: 'ئ', s1: 10, s2: 28, s3: 27, s4: 0, s5: 1 }
    '1575': { char: 'ا', s1: 1, s2: 1, s3: 0, s4: 27, s5: 28 }
    '1576': { char: 'ب', s1: 2, s2: 2, s3: 1, s4: 26, s5: 27 }
    '1577': { char: 'ة', s1: 5, s2: 26, s3: 25, s4: 2, s5: 3 }
    '1578': { char: 'ت', s1: 400, s2: 3, s3: 2, s4: 25, s5: 26 }
    '1579': { char: 'ث', s1: 500, s2: 4, s3: 3, s4: 24, s5: 25 }
    '1580': { char: 'ج', s1: 3, s2: 5, s3: 4, s4: 23, s5: 24 }
    '1581': { char: 'ح', s1: 8, s2: 6, s3: 5, s4: 22, s5: 23 }
    '1582': { char: 'خ', s1: 600, s2: 7, s3: 6, s4: 21, s5: 22 }
    '1583': { char: 'د', s1: 4, s2: 8, s3: 7, s4: 20, s5: 21 }
    '1584': { char: 'ذ', s1: 700, s2: 9, s3: 8, s4: 19, s5: 20 }
    '1585': { char: 'ر', s1: 200, s2: 10, s3: 9, s4: 18, s5: 19 }
    '1586': { char: 'ز', s1: 7, s2: 11, s3: 10, s4: 17, s5: 18 }
    '1587': { char: 'س', s1: 60, s2: 12, s3: 11, s4: 16, s5: 17 }
    '1588': { char: 'ش', s1: 300, s2: 13, s3: 12, s4: 15, s5: 16 }
    '1589': { char: 'ص', s1: 90, s2: 14, s3: 13, s4: 14, s5: 15 }
    '1590': { char: 'ض', s1: 800, s2: 15, s3: 14, s4: 13, s5: 14 }
    '1591': { char: 'ط', s1: 9, s2: 16, s3: 15, s4: 12, s5: 13 }
    '1592': { char: 'ظ', s1: 900, s2: 17, s3: 16, s4: 11, s5: 12 }
    '1593': { char: 'ع', s1: 70, s2: 18, s3: 17, s4: 10, s5: 11 }
    '1594': { char: 'غ', s1: 1000, s2: 19, s3: 18, s4: 9, s5: 10 }
    '1601': { char: 'ف', s1: 80, s2: 20, s3: 19, s4: 8, s5: 9 }
    '1602': { char: 'ق', s1: 100, s2: 21, s3: 20, s4: 7, s5: 8 }
    '1603': { char: 'ك', s1: 20, s2: 22, s3: 21, s4: 6, s5: 7 }
    '1604': { char: 'ل', s1: 30, s2: 23, s3: 22, s4: 5, s5: 6 }
    '1605': { char: 'م', s1: 40, s2: 24, s3: 23, s4: 4, s5: 5 }
    '1606': { char: 'ن', s1: 50, s2: 25, s3: 24, s4: 3, s5: 4 }
    '1607': { char: 'ه', s1: 5, s2: 26, s3: 25, s4: 2, s5: 3 }
    '1608': { char: 'و', s1: 6, s2: 27, s3: 26, s4: 1, s5: 2 }
    '1609': { char: 'ى', s1: 10, s2: 28, s3: 27, s4: 0, s5: 1 }
    '1610': { char: 'ي', s1: 10, s2: 28, s3: 27, s4: 0, s5: 1 }
}

#console.table chars

String.prototype.toNumber   = (k) ->
    metin = @toString().trim()
    chars[metin.charCodeAt(0)]["s#{k}"]


Number.prototype.b = (N) ->
    (this/N).toFixed(0)*1

Number.prototype.m = (N) ->
    (this%N)

for { name: sure_ad, aya: ayetler, index: sure_no, harf }, sure_indeks in kuran
    continue if !["36"].includes sure_no

    log ayetler[0].text

    text = []
    for ayet, i in ayetler
        continue unless i
        text.push ayet.text

    text = text.join(" ").replace /\s+/g, ""



    yaz.writeFileSync "c36.txt", ayetler[0].text.split('').map((l) -> l.toNumber(2)).join ","
    yaz.writeFileSync "36.txt", text.split('').map((l) -> l.toNumber(2)).join ","
    log text
    continue

    s1a = 0; s1c = 0 
    s2a = 0; s2c = 0 
    s3a = 0; s3c = 0 
    s4a = 0; s4c = 0 
    s5a = 0; s5c = 0 

    for { index: ayet_no, text: metin }, ayet_indeks in ayetler
        metin.replace(/\s+/gi, "").trim().split("").map((c) -> 
            s1a += c.toNumber(1)
            s2a += c.toNumber(2)
            s3a += c.toNumber(3)
            s4a += c.toNumber(4)
            s5a += c.toNumber(5)
        ) 

    harf.split("").map((d) -> 
        s1c += d.toNumber(1)
        s2c += d.toNumber(2)
        s3c += d.toNumber(3)
        s4c += d.toNumber(4)
        s5c += d.toNumber(5)
    )

    kuran[sure_indeks] = { 
        l:ayetler.length, 
        s1a, s1c, s2a, s2c, s3a, s3c, s4a, s4c, s5a, s5c, "|",
        s1b:s1a.b(s1c), 
        s2b:s2a.b(s2c), 
        s3b:s3a.b(s3c),  
        s4b:s4a.b(s4c), 
        s5b:s5a.b(s5c), ":",
        s1m:s1a.m(s1c), 
        s2m:s2a.m(s2c), 
        s3m:s3a.m(s3c),
        s4m:s4a.m(s4c), 
        s5m:s5a.m(s5c) 
    }



#console.table ISLEM: "Div and mod for key aganist to sura / spaces removed"
#console.table kuran





















#yaz.writeFileSync "denendi/#{Date.now()}.json", JSON.stringify kuran, null, "\t"
#yaz.writeFileSync "deneme.txt", parseFloat(yaz.readFileSync("deneme.txt"))+1