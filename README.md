# hash
I think some words in the beginning of selected suras (29 sura) which combination of a few chars of arabic alphabet could be a the verification keys to prove context is untouched. 

string to number replacement for letters:
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


<img width="100%" alt="Ekran Resmi 2022-05-15 18 08 27" src="https://user-images.githubusercontent.com/924685/168479955-5d624a6b-392c-46b7-a871-b44375627f06.png">

<img width="100%" alt="Ekran Resmi 2022-05-15 18 10 27" src="https://user-images.githubusercontent.com/924685/168479961-a5256d75-8f96-40aa-8d2e-84c25c77fdfb.png">
