package day04

_invalid: """
eyr:1972 cid:100
hcl:#18171d ecl:amb hgt:170 pid:186cm iyr:2018 byr:1926

iyr:2019
hcl:#602927 eyr:1967 hgt:170cm
ecl:grn pid:012533040 byr:1946

hcl:dab227 iyr:2012
ecl:brn hgt:182cm pid:021572410 eyr:2020 byr:1992 cid:277

hgt:59cm ecl:zzz
eyr:2038 hcl:74454a iyr:2023
pid:3556412378 byr:223
"""

_valid: """
pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980
hcl:#623a2f

eyr:2029 ecl:blu cid:129 byr:1989
iyr:2014 pid:896056539 hcl:#a97842 hgt:165cm

hcl:#888785
hgt:164cm byr:2001 iyr:2015 cid:88
pid:545766238 ecl:hzl
eyr:2022

iyr:2010 hgt:158cm hcl:#b6652a ecl:blu byr:1944 eyr:2021 pid:093154719
"""

_example: """
ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
byr:1937 iyr:2017 cid:147 hgt:183cm

iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
hcl:#cfa07d byr:1929

hcl:#ae17e1 iyr:2013
eyr:2024
ecl:brn pid:760753108 byr:1931
hgt:179cm

hcl:#cfa07d eyr:2025 pid:166559648
iyr:2011 ecl:brn hgt:59in
"""

_real: """
byr:1985
eyr:2021 iyr:2011 hgt:175cm pid:163069444 hcl:#18171d

eyr:2023
hcl:#cfa07d ecl:blu hgt:169cm pid:494407412 byr:1936

ecl:zzz
eyr:2036 hgt:109 hcl:#623a2f iyr:1997 byr:2029
cid:169 pid:170290956

hcl:#18171d ecl:oth
pid:266824158 hgt:168cm byr:1992 eyr:2021

byr:1932 ecl:hzl pid:284313291 iyr:2017 hcl:#efcc98
eyr:2024 hgt:184cm

iyr:2017 pid:359621042
cid:239 eyr:2025 ecl:blu byr:1986 hgt:188cm

eyr:2027 hgt:185cm hcl:#373b34 pid:807766874 iyr:2015 byr:1955
ecl:hzl

iyr:2017 hcl:#7d3b0c hgt:174cm
byr:1942 eyr:2025 ecl:blu pid:424955675

eyr:2026 byr:1950 hcl:#ceb3a1
hgt:182cm
iyr:2016 pid:440353084 ecl:amb

hcl:a4c546
iyr:1932 pid:156cm eyr:2034 hgt:193 ecl:zzz byr:2025

hcl:#ceb3a1 eyr:2020 pid:348696077 hgt:163cm
ecl:hzl
byr:1921 iyr:2016

ecl:gmt eyr:2031 iyr:2018 byr:1971 hgt:152in pid:454492414
hcl:z

hcl:#341e13 byr:1921 iyr:2020
pid:072379782 eyr:2022 hgt:166cm cid:253 ecl:brn

ecl:blu hgt:75in byr:1954 eyr:2026 iyr:2012 hcl:#623a2f pid:328598886

byr:2004 eyr:2035 hcl:#7d3b0c pid:359128744 iyr:2020 hgt:65cm
ecl:#70f23f

eyr:1988
pid:171cm byr:2003
iyr:1984
cid:50
hcl:z hgt:66cm ecl:#7a4c6e

pid:9632440323 eyr:1964 hgt:63cm
ecl:#fab0c5 hcl:z iyr:1945 byr:1986

pid:936403762 ecl:#337357 byr:1997
cid:196 iyr:2020
eyr:2030 hgt:165cm
hcl:#7d3b0c

byr:1931 pid:488791624 hgt:169cm ecl:blu
eyr:2029 hcl:#fffffd iyr:2013

hcl:#733820 hgt:76in pid:517689823
eyr:2028 byr:1988
ecl:brn iyr:2016

eyr:2023 hcl:#fffffd hgt:190cm iyr:2015 ecl:brn pid:739536900 byr:1951

ecl:brn
byr:1986 cid:262 hcl:#efcc98 pid:880203213 hgt:185cm iyr:2018 eyr:2029

pid:181cm hgt:113 hcl:z ecl:#2c2d2c iyr:1961 byr:2021 eyr:2031

hcl:#ceb3a1 iyr:2020
byr:1977
hgt:192cm
pid:338237458 eyr:2030 ecl:amb

iyr:1953 byr:2025 hgt:66cm eyr:1932
pid:181cm
ecl:#6f0b15 hcl:f79cb7
cid:109

hcl:#6b5442 pid:164cm ecl:blu
hgt:176cm byr:2015
iyr:2010 eyr:2029

eyr:2035
pid:085002665 ecl:#f88074 iyr:2018 hcl:#602927
hgt:169cm

byr:1958
hcl:z
pid:0468194841 iyr:2016 eyr:2007
hgt:152cm
ecl:#1c7a89 cid:124

hcl:z pid:233430735 byr:2021 eyr:2026
iyr:1953 ecl:#64769d hgt:184

hgt:70cm pid:156397147
iyr:2014 ecl:#d6ada0
byr:2030
hcl:#cfa07d

ecl:amb
byr:1990
iyr:2017 hgt:164cm hcl:10f33a
cid:293 eyr:2020 pid:332276985

pid:163252726 eyr:2026
hgt:163cm
iyr:2011 hcl:#efcc98
ecl:hzl byr:1936

hgt:157cm iyr:2019 pid:078770050 hcl:#efcc98 byr:1967 eyr:2030
ecl:gry cid:190

hgt:184cm ecl:amb pid:851379559 hcl:#ceb3a1 byr:1946 eyr:2022
iyr:2017 cid:280

hgt:171cm byr:1942 pid:830156471 hcl:#cfa07d ecl:gry eyr:2032
iyr:2022

byr:2013 ecl:#67cbe8 eyr:2024
pid:242908367
hgt:76cm
iyr:2025
hcl:796bda

ecl:amb iyr:2019
byr:1945 eyr:2021 hcl:#602927 pid:550065206

hgt:72in ecl:brn byr:1956 pid:253685193 iyr:2017 eyr:2023
hcl:#6b5442

eyr:2032 iyr:2019
hgt:176cm
ecl:oth pid:800237895 hcl:#888785 byr:1979

eyr:2026 iyr:2020 cid:226 pid:882830512
hcl:#866857 byr:1929 ecl:amb
hgt:60in

hcl:#cfa07d ecl:oth
iyr:2015 pid:807837948 byr:1966 eyr:2030 hgt:191in

byr:1969 iyr:2012 eyr:2024
cid:244 ecl:hzl hcl:#18171d pid:344160556

eyr:2020 pid:718422803
hcl:#18171d
hgt:181cm
byr:1925 ecl:amb
iyr:2019

byr:1943 pid:740807220 hgt:72in ecl:amb
iyr:2013 eyr:2022
hcl:#cfa07d

hcl:#733820
byr:1986 iyr:2016 hgt:184cm cid:333
pid:768188726 ecl:oth eyr:2030

eyr:2022 byr:1996 hcl:#341e13 ecl:hzl iyr:2015 hgt:160cm
pid:516401532

hgt:182cm ecl:grn pid:336742028 iyr:2014 hcl:#34f021 byr:1967
eyr:2029

byr:2030
hgt:142 iyr:2029 eyr:2040 hcl:426fc5
cid:312
pid:169cm
ecl:#069ff7

hgt:169cm ecl:gry hcl:#6b5442 iyr:2012 byr:1949 pid:131835020 eyr:2022

hgt:70cm iyr:2012
eyr:2037
hcl:64fd76
cid:175 pid:4880649770 ecl:grn byr:2029

iyr:2013 hcl:#7d3b0c eyr:2024 hgt:190cm pid:659772377 cid:226 ecl:oth byr:1958

ecl:lzr hgt:163cm pid:013605217
byr:2000
eyr:2020
hcl:z iyr:2024

cid:131 pid:896076106
hcl:#c0946f byr:1930
hgt:162cm eyr:2023 ecl:oth iyr:2017

byr:1935 iyr:2012
pid:942509879
ecl:amb
hgt:185cm cid:152 eyr:2024 hcl:#866857

ecl:#e490a3 hcl:4813a2 hgt:176cm pid:778369210 iyr:2020
eyr:2035 byr:2020

byr:2006 ecl:amb pid:148409219
hgt:189cm
eyr:2021 hcl:z iyr:2028

hgt:188in hcl:#9ed525
iyr:2018 ecl:grn eyr:2021
pid:065515632 byr:2012

cid:109 hgt:167cm
pid:545112664 ecl:grn hcl:#a62fea eyr:2026
iyr:2012
byr:1921

pid:174997024
iyr:2012
eyr:2030
ecl:grn
hgt:150cm
byr:1997
hcl:#866857

pid:451921339
hgt:181cm
hcl:#888785 iyr:2017 eyr:2026 byr:1936
ecl:hzl

hgt:187in
hcl:#866857 ecl:grn pid:623919686 eyr:2028 iyr:2011
byr:2016

byr:2001
ecl:gry eyr:2023 pid:324948416
hcl:ef16f8 cid:139 hgt:184in iyr:2026

byr:1954 hcl:#341e13 eyr:2023 pid:129321944 iyr:2012
hgt:183cm
ecl:amb

hgt:164cm pid:596870080
ecl:hzl eyr:2021 iyr:2017 hcl:#a97842
byr:1951

iyr:2013 byr:1944 hcl:#cfa07d
hgt:168cm cid:72 pid:160531632
ecl:grn

iyr:2012 pid:900043442 hcl:#ceb3a1 cid:124 byr:1941
ecl:blu hgt:156cm
eyr:2025

eyr:2021 hgt:61in iyr:2020 ecl:grn byr:1933

byr:1971 cid:175
eyr:2028 hcl:#efcc98 iyr:2013 hgt:170cm
pid:225213589

pid:147112660 hcl:#ceb3a1 eyr:2029 hgt:159cm ecl:grn iyr:2014
byr:1967

iyr:2015 pid:502975636 hgt:71in byr:1994
hcl:#18171d ecl:amb eyr:2029

byr:1948 hcl:#b6652a hgt:171in pid:181cm iyr:2019 ecl:grt cid:87

pid:859849571 ecl:amb hcl:#6b5442
hgt:193cm byr:1980
iyr:2017
eyr:2020

cid:125 pid:508147848
hcl:06ea75 iyr:1997 byr:2010 ecl:#c707f7 eyr:1970 hgt:161

eyr:2020 cid:326 byr:1989 ecl:gry hgt:160cm hcl:#cc080c pid:319135853 iyr:2010

ecl:utc
pid:531595917 hgt:180cm byr:1987
eyr:2024 hcl:#cfa07d iyr:2025

ecl:gry byr:2007
eyr:2028
iyr:2025
pid:6072964414 hgt:59cm hcl:#888785

pid:791025828 ecl:hzl hgt:178cm
iyr:2017
hcl:#733820
byr:1960 eyr:2021 cid:66

byr:1991 iyr:1934
cid:304 hgt:183cm ecl:grn
pid:408294229
eyr:2027 hcl:#623a2f

ecl:blu hgt:181cm eyr:2024 iyr:2010
pid:633234602 hcl:#2ce009
byr:1985

hcl:#c0946f hgt:192cm
iyr:2012 pid:120684397 ecl:grn eyr:2027
byr:1974

eyr:2026
pid:068304960 hgt:190cm byr:1925 iyr:2020 ecl:oth

hcl:#733820
hgt:168cm cid:307 iyr:2014 byr:1981 ecl:hzl pid:898831724 eyr:2026

hgt:73cm
eyr:2038
byr:1980 ecl:gry iyr:2027 pid:678846912 hcl:z

hgt:150cm cid:261 eyr:2021
hcl:z pid:159cm iyr:2014 ecl:hzl
byr:1955

pid:#172650 ecl:gry eyr:2040 hcl:z iyr:2013 hgt:169cm byr:2008 cid:290

iyr:2017 byr:1998
hcl:#ceb3a1 pid:274178898 eyr:2027 ecl:brn
hgt:183cm

eyr:2024 cid:183 ecl:grn
byr:1946
hgt:63in hcl:#6b5442 iyr:2017

hgt:97 byr:1990
iyr:2019
ecl:grn
pid:587580330
hcl:#341e13 eyr:2022

ecl:oth
pid:441517075 hcl:#c0946f iyr:2015 hgt:188cm eyr:2024 byr:1920

hgt:191in pid:185cm iyr:1993
hcl:93033d
eyr:2034 ecl:dne

pid:591478424 ecl:grn hcl:#888785
byr:1929 eyr:2023 hgt:173cm iyr:2017

iyr:1954
hgt:63cm
hcl:bdf2e0 ecl:amb pid:#912f46

byr:1956 iyr:2012 hgt:73in pid:986643426
ecl:blu
cid:235 eyr:2025

hcl:#cfa07d
cid:320 byr:1930
hgt:172cm
ecl:oth eyr:2024 iyr:2019

byr:1935 hgt:182cm pid:22794407 hcl:1b96fb eyr:1961 iyr:1941 ecl:#5e80cd cid:70

iyr:2020 eyr:2021
ecl:amb
hgt:59in pid:594829025 hcl:#93092e
byr:1976

hcl:#a97842 eyr:2030
byr:1937 iyr:2018 cid:295 ecl:oth
hgt:166cm pid:282634012

hgt:171cm hcl:#623a2f byr:1956
pid:068178613 cid:214
iyr:2012 eyr:2026 ecl:brn

byr:1921
hgt:161cm hcl:#888785
ecl:brn pid:010348794
eyr:2023 iyr:2011

hcl:#a97842 iyr:2010
byr:1955 eyr:2024
pid:473791166
ecl:brn
hgt:175cm

eyr:2028 ecl:grn pid:186196675 byr:1945 hgt:155cm cid:349
iyr:2011 hcl:#6b5442

hgt:161cm eyr:2030 cid:221
pid:994494879 hcl:#733820 iyr:2012 ecl:blu
byr:1957

eyr:1993 iyr:2022 hcl:z byr:2020 pid:013428192 hgt:62cm
ecl:dne

hgt:178cm eyr:2029 hcl:#733820 byr:1962 iyr:2017 ecl:blu pid:567713232

hcl:#fffffd
byr:1928 pid:390162554
eyr:2030 cid:79 hgt:150cm ecl:amb iyr:2019

eyr:2030 cid:320 hgt:171cm hcl:#888785 pid:540720799 ecl:amb iyr:2012 byr:1979

byr:1921
ecl:oth pid:204986110 eyr:2023 hgt:154cm iyr:2017 hcl:#341e13 cid:126

eyr:2020 cid:175 ecl:dne byr:1983 iyr:2016 hcl:#c0946f hgt:65cm

hgt:191cm
iyr:2010 cid:295 byr:1984 eyr:2025 hcl:#cfa07d pid:799775698
ecl:amb

iyr:2020 cid:278 hcl:#c0946f byr:1970 pid:773144393 eyr:2024 hgt:180cm

hgt:176cm
byr:1963
pid:252396293 iyr:2012 ecl:brn hcl:#ceb3a1
eyr:2030

pid:545130492
byr:2030 iyr:2020
hgt:190cm eyr:2034 ecl:blu hcl:#fffffd

hcl:#a97842 pid:032201787 hgt:190cm ecl:gry
eyr:2028 iyr:2012 byr:1994

hcl:#a97842 pid:064591809
ecl:hzl byr:1927 hgt:165cm
iyr:2011
eyr:2028

cid:77
byr:2005
hgt:125 iyr:1923 ecl:#605d73
eyr:2022 pid:90184674 hcl:z

cid:301 pid:106820988
iyr:2018
hcl:#cfa07d eyr:2029
byr:1993
hgt:193cm ecl:grn

hcl:#623a2f
cid:118
ecl:oth pid:75827285
hgt:189cm iyr:2010
eyr:2030 byr:1976

ecl:blu iyr:2023 eyr:1996
hgt:66cm cid:251 byr:1972 hcl:z
pid:557774244

byr:2002
hgt:169cm pid:629420566 eyr:2026 ecl:grn hcl:#341e13
cid:166 iyr:2019

iyr:2026 hcl:9b83a1 eyr:1979
ecl:dne hgt:111 pid:176cm

pid:#89718c byr:2026
hcl:2ca5c7 hgt:142 eyr:2040
ecl:lzr iyr:2029

ecl:grn
byr:2022 eyr:2020
pid:7024869 hgt:123 iyr:2019 hcl:z

hcl:#733820 hgt:155cm ecl:grn iyr:2020 byr:1955 eyr:2028
pid:217362007

hcl:#18171d ecl:gry
byr:1971 hgt:193cm
eyr:2020
pid:352009857 iyr:2013

byr:2018
hgt:175in ecl:xry iyr:2015
eyr:2036
cid:171 pid:6132398 hcl:#efcc98

pid:839955293
byr:1928 hcl:#fffffd ecl:hzl iyr:2011
hgt:162cm eyr:2023

hgt:175cm pid:482827478 eyr:2028
hcl:#6b5442 ecl:blu byr:1932 iyr:2010

iyr:2020 hcl:#866857
ecl:brn byr:1933 cid:269 pid:003931873 hgt:188cm
eyr:2022

byr:1981 hcl:#fffffd hgt:160cm cid:311 ecl:brn eyr:2025
pid:930857758 iyr:2014

hcl:#cfa07d hgt:73in
ecl:gry
pid:383281251
iyr:2013 byr:1934 eyr:2026

byr:1988 eyr:2026 pid:458002476
iyr:2017
hgt:175cm ecl:amb

eyr:1987
byr:2020 pid:299341304
hcl:#341e13 iyr:1935 cid:125
hgt:168cm
ecl:gry

iyr:2014 hcl:#b6652a pid:445799347
hgt:188cm byr:1960
eyr:2030 cid:290 ecl:amb

eyr:2023
hgt:75cm hcl:#733820 cid:195 byr:1933
ecl:amb pid:062770586 iyr:2019

hgt:168cm
eyr:2021
pid:725299968 ecl:grn byr:1932
iyr:2016 hcl:#888785

hgt:161cm hcl:#ceb3a1 byr:1962 eyr:2026 iyr:2013 ecl:amb pid:695426469 cid:227

ecl:dne hcl:#ceb3a1 iyr:2013 eyr:2022
pid:434786988 byr:1956 hgt:183cm

pid:697500517
byr:1968 hgt:169cm hcl:#fffffd ecl:grn cid:143
iyr:2010
eyr:2027

byr:2029 ecl:amb hgt:175in iyr:2015 hcl:#ceb3a1
pid:39839448
eyr:2021 cid:105

pid:0985607981 ecl:hzl iyr:2012
eyr:2021 byr:2024 hcl:5cad22
hgt:190cm

hcl:#b6652a hgt:178cm cid:222 byr:1992 ecl:grn
iyr:2011 pid:419544742

iyr:2019 byr:1960 ecl:hzl eyr:2021 hgt:184cm cid:66 hcl:#866857 pid:412920622

eyr:2025 hcl:#888785 iyr:2018 byr:1956 pid:698098389 ecl:grn hgt:173cm

ecl:blu byr:1935
pid:354892542 hgt:161cm
iyr:2018
eyr:2021 hcl:#b6652a

ecl:oth cid:287 iyr:2028 byr:1953 eyr:2027 hcl:#7d3b0c hgt:151cm
pid:211411839

iyr:2018 byr:1934 hcl:#a97842
pid:859748861
ecl:oth hgt:175cm eyr:2025

byr:1930 iyr:2018 eyr:2022
hgt:175cm
hcl:#292092
ecl:brn pid:987163365

hgt:167in hcl:#888785 eyr:2040 pid:4646402867 byr:2013 iyr:1941 ecl:#389aec

ecl:hzl hcl:#602927
hgt:168cm eyr:2026
cid:235 iyr:2016
byr:1942

iyr:1975 pid:11337832 ecl:#a25273 hgt:151 byr:2017

eyr:1979
hgt:71cm
byr:2003 hcl:7e7da7 pid:151cm ecl:#a8afb3 iyr:1937

eyr:2021 hgt:74in hcl:#cfa07d iyr:2014 byr:1932
pid:641867677 ecl:grn

ecl:gry hgt:185cm pid:556229206 iyr:2013
byr:1984
hcl:#fffffd eyr:2028

eyr:2020 byr:1989
ecl:grn pid:618876158 hcl:z
hgt:176cm iyr:2025

eyr:2025 byr:2001 hcl:#cdb7f9
pid:377402126 ecl:hzl hgt:184cm iyr:2019

byr:1939 hgt:180cm eyr:2029 ecl:oth hcl:#733820 iyr:2016
pid:733456875

pid:883743276
hcl:#7d3b0c eyr:2022 ecl:blu
byr:1928 hgt:150cm cid:150 iyr:2013

hgt:60cm ecl:#43f03d eyr:1994 byr:1975
iyr:1980 pid:169cm

hgt:104 byr:2029 eyr:2040 hcl:64a9b2
pid:83898860
iyr:1990
ecl:#938bbe

pid:284399238 ecl:gry hcl:#888785 iyr:2019 hgt:168cm byr:1944
eyr:2022

hcl:#733820 pid:486515752 ecl:grn hgt:188in byr:1941 iyr:2017 eyr:2005

iyr:2010
byr:1978 hgt:160cm eyr:2003
ecl:oth
hcl:#efcc98 pid:584668011

byr:1944 ecl:gry pid:962700562 iyr:2011 hcl:#866857 eyr:2022
hgt:191cm

hcl:z pid:758583213 iyr:1941 ecl:gry eyr:2007
hgt:67 byr:2022
cid:215

byr:1988
ecl:#ae2a9b hcl:#fe9d14 iyr:2012
pid:411550516 hgt:169cm eyr:2038

pid:400034647 byr:1927 hgt:165cm
iyr:2017 ecl:brn eyr:2024 cid:144 hcl:#341e13

hcl:#733820 hgt:153cm eyr:2027
byr:1935 pid:217121064 cid:120 iyr:2012 ecl:grn

hgt:168cm hcl:#866857 iyr:2012 pid:1527348755
byr:1946 eyr:2028 cid:184 ecl:amb

hcl:#a97842
byr:1967
hgt:152cm eyr:2030
ecl:blu
pid:929661915 iyr:2018

pid:671485026
hgt:188cm byr:1974 iyr:2015 ecl:grn cid:268 eyr:2021 hcl:#c0946f

pid:789877199 iyr:2011 cid:219 eyr:2029
ecl:oth byr:1991
hcl:#866857 hgt:154cm

cid:137 pid:059579902
eyr:2020 byr:1952
hcl:#18171d iyr:2020
hgt:172cm ecl:oth

pid:182cm iyr:1997 byr:2012
eyr:2034
hgt:161in ecl:#528abf hcl:b7d2fe

hgt:192cm ecl:oth iyr:2017 pid:264538307 byr:1994 cid:285
hcl:#18171d eyr:2030

hcl:#efcc98
pid:38036608
eyr:2010
iyr:2026
byr:2027
cid:239 ecl:zzz hgt:74

iyr:2012
eyr:2022 hgt:178cm
hcl:#888785
ecl:hzl
byr:1998 pid:000080585

pid:719620152 hcl:#b6652a cid:133
ecl:hzl
byr:1983 iyr:2012 hgt:175cm
eyr:2024

cid:155 eyr:1977 iyr:2019 ecl:#28de8b byr:1941 hcl:#602927 hgt:173cm pid:493773064

iyr:2010
pid:842124616 ecl:hzl eyr:2025 cid:146 hcl:#733820 hgt:166cm byr:1987

hcl:fd4dcf byr:2006 iyr:2011 pid:820797708 eyr:2020 hgt:189cm
ecl:gry

iyr:1971 pid:22107293 hcl:#5b3f01 cid:257
ecl:hzl
hgt:60cm eyr:2000 byr:1965

byr:1932 eyr:2028
hcl:#6b5442 ecl:amb pid:947149686
iyr:2015 hgt:187cm

hcl:#a97842
cid:260
hgt:167cm eyr:2027 byr:1973 ecl:oth pid:741678753 iyr:2016

pid:334234443 ecl:gry hcl:#18171d eyr:2020
iyr:2016 hgt:159cm byr:1926

hgt:118 eyr:1929 iyr:2013
pid:987139064
cid:196
hcl:#cfa07d ecl:#f72601 byr:1929

byr:1924
pid:623185744 iyr:2012 cid:341 hcl:#602927 hgt:192cm eyr:2022

iyr:2012 byr:1971 hgt:168cm cid:146 pid:673038025 hcl:#866857 eyr:2020 ecl:hzl

eyr:2023 iyr:2017
pid:205596613 cid:298 hcl:#341e13
hgt:169cm ecl:oth
byr:1996

ecl:blu pid:775831730
eyr:2029 iyr:1924 hgt:168cm hcl:z

byr:2023 hgt:181cm
pid:4365105095 iyr:2021
ecl:lzr eyr:2024 hcl:z

hgt:184cm byr:1987 pid:175cm ecl:#83a5fa eyr:2023

eyr:2021 pid:422371422 ecl:oth iyr:2015 hcl:#866857
byr:1963 hgt:174cm

pid:006970943
hcl:#2f22ef iyr:2020
ecl:gry
byr:1922
eyr:2024 hgt:163cm

cid:160 byr:2015
eyr:2038 hcl:z ecl:grt hgt:166 iyr:2026
pid:#14978f

hgt:178cm eyr:2021 iyr:2016 pid:471529794
hcl:#b6652a cid:192
ecl:grn byr:1970

iyr:2015 ecl:brn hcl:#602927 hgt:187cm
pid:729284172
eyr:2024 byr:1932

cid:153
ecl:dne eyr:2005
pid:178cm iyr:2028
byr:2029 hgt:160in hcl:482a92

byr:1995 iyr:2012 hcl:#866857 hgt:159cm
eyr:1950 ecl:gry pid:183cm

pid:875885919
hgt:159cm
iyr:2011
ecl:gry byr:1988 hcl:#341e13 eyr:2028

pid:2390267705 hcl:#7d3b0c byr:2009
eyr:2017 ecl:grn hgt:183cm iyr:2015

ecl:brn eyr:2029 hcl:#866857 iyr:2020 hgt:180cm byr:2001
pid:668021168

hcl:#c0946f
eyr:2024 ecl:amb pid:013487714 byr:1965 hgt:172cm cid:320 iyr:2020

eyr:2025 pid:115479767 hcl:#866857 ecl:oth
hgt:163cm iyr:2010 byr:1999

byr:1967 iyr:2011 cid:112 hcl:#733820
eyr:2040 ecl:grt
hgt:66 pid:804536366

hgt:163 pid:1764836278 eyr:2035
iyr:2021
hcl:z ecl:#f1bb27

hcl:#efcc98 hgt:176cm byr:1994 pid:590539278 ecl:grn iyr:2011 eyr:2021

iyr:2017 eyr:2024 hgt:167cm hcl:#b62e29 pid:495674801
byr:1970 ecl:brn

hgt:168cm pid:993244641
byr:1968
eyr:1926
hcl:#b6652a ecl:brn
iyr:2023

hgt:63in hcl:z pid:594070517
eyr:2021 ecl:oth
iyr:2017
byr:2000

eyr:2030 pid:272955042 cid:319 iyr:2011 ecl:amb byr:1999 hcl:#888785 hgt:158cm

eyr:2025
pid:814305816 byr:1945 ecl:brn hgt:162cm iyr:2018
hcl:#a97842
cid:229

byr:1996 eyr:2026 pid:582584802 hcl:#c0946f iyr:2020 ecl:grn
hgt:162cm

eyr:2027
hgt:155cm byr:1925
hcl:#888785
cid:182
iyr:2014 ecl:brn
pid:250884352

hgt:173cm cid:135
iyr:2017 pid:661330507 byr:1950 eyr:2020 ecl:gry hcl:#18171d

pid:208932950
eyr:2030 hgt:179cm
iyr:2013
ecl:oth
byr:1981
cid:58 hcl:#6b5442

hcl:#f183e7 iyr:2014
hgt:159cm pid:614579850 ecl:gry eyr:2029
cid:186 byr:1962

eyr:2027 hcl:#db3405 byr:1938 pid:194516631 cid:167 hgt:177cm ecl:oth

hgt:68in hcl:#733820 pid:228644594 eyr:2030 ecl:gry iyr:2010 cid:334 byr:1951

iyr:2017 hcl:#341e13
pid:#6a28c9 hgt:154cm ecl:gry
byr:1966 eyr:2023

pid:250155574 cid:84
hgt:157cm ecl:grn byr:1937 iyr:2017 eyr:2024 hcl:#b6652a

pid:831823039 eyr:2028 iyr:2015 ecl:gry
hgt:192cm cid:137 byr:1922
hcl:#6b5442

hgt:193cm byr:1941 eyr:2024 cid:56
hcl:#623a2f ecl:amb
pid:351293754 iyr:2016

byr:1947 iyr:2012 ecl:hzl hcl:#602927 eyr:2028 pid:252010138 hgt:152cm

hcl:#a97842 pid:801192586 ecl:hzl iyr:2018 hgt:193cm byr:1928 cid:323
eyr:2028

hgt:151cm
pid:756347561 ecl:hzl
eyr:2024 cid:161
iyr:2016 hcl:#623a2f
byr:2002

pid:648012871 iyr:2015 ecl:blu
eyr:2025 hcl:#623a2f byr:1973 hgt:177cm

byr:1999 hcl:#ceb3a1 cid:345 eyr:2025 ecl:#b29a96 pid:093304949
iyr:2017 hgt:93

hcl:#b6652a
iyr:2018 ecl:grn
byr:1951 pid:077278028 eyr:2024 hgt:62in

hgt:164cm pid:410770618 byr:1958
iyr:2019
eyr:2030
ecl:gry hcl:#fffffd cid:293

ecl:grt
eyr:2039
hcl:z pid:188cm byr:2022
iyr:2027 hgt:76cm

ecl:grn iyr:2012 hgt:150cm eyr:2024
byr:1926 pid:954310029 cid:64
hcl:#fffffd

ecl:oth eyr:2027 pid:091152959 hgt:180cm hcl:#ceb3a1 iyr:2015 cid:350
byr:1924

iyr:2017 hcl:#49a793 eyr:2021 cid:144 byr:1966
pid:717543257
hgt:161cm
ecl:hzl

eyr:2025 ecl:brn hgt:60in pid:391973520 byr:1928 cid:77
iyr:2012
hcl:#602927

iyr:2013 hgt:161cm pid:784483994 byr:1991
hcl:#cfa07d
eyr:2024 ecl:grn

ecl:hzl iyr:1967 byr:2009 cid:265 hgt:180in pid:168cm
eyr:1966

eyr:2024 iyr:2019 pid:534453983
byr:2028 ecl:oth hcl:#341e13 hgt:193cm

eyr:2029 iyr:2010 hcl:#623a2f ecl:gry hgt:152cm pid:572128647
byr:1996

iyr:2014 byr:1981 cid:176
ecl:grn hgt:183cm pid:974469723 eyr:2027

eyr:2029 pid:233353682 byr:1968
ecl:gry hgt:181cm iyr:2011
hcl:#efcc98

hgt:61 iyr:2005 cid:203 ecl:gmt pid:157cm hcl:z
byr:2013

iyr:2020
byr:1923 ecl:blu eyr:2026 pid:069770502 hgt:69cm
hcl:z

byr:1997 hgt:160cm
hcl:z iyr:2021 eyr:1920 pid:9374226872

ecl:hzl eyr:2024 pid:537492791 hgt:186cm byr:1952
hcl:#cfa07d
iyr:2020

hgt:73cm byr:1974
ecl:xry iyr:2016 cid:133
hcl:e741f5 pid:186cm

pid:161cm
byr:1950
eyr:2028 ecl:hzl hcl:#7d3b0c
iyr:2014 hgt:158cm

ecl:#2c491e
hcl:f8fe13 byr:2022
hgt:137 iyr:1948
eyr:2040 pid:#959a0f

byr:1923 hgt:70in
pid:904825661 hcl:#b6652a iyr:2010 eyr:2020
ecl:oth

iyr:2013
ecl:blu pid:858020233 byr:1950 hgt:61in

hcl:#18171d
iyr:2016
ecl:amb pid:613754206 byr:1975 hgt:164cm eyr:2025

byr:1938
iyr:2017 hcl:#623a2f cid:191 eyr:2027 hgt:174cm pid:287108745 ecl:amb

iyr:2025 hcl:#623a2f byr:2019 hgt:170cm
cid:233 pid:55323151 ecl:amb eyr:2037

ecl:amb
hgt:177cm hcl:#b6a3ce eyr:2025 byr:1967 pid:506927066
iyr:2018 cid:93

byr:1964 hgt:173cm eyr:2030 cid:106 pid:587635596 iyr:2012
hcl:#fb5993
ecl:hzl

ecl:lzr pid:190cm hcl:44746d eyr:1955 hgt:66cm iyr:1990 byr:2003

ecl:brn byr:1968 cid:216 hgt:181in hcl:#b6652a iyr:2016 eyr:2020 pid:0208311541

ecl:hzl hgt:181cm
eyr:1977 byr:2018 pid:527754216 hcl:#c0946f

ecl:grn hcl:#efcc98
byr:1935 eyr:2025 iyr:2018 hgt:65in pid:396444938 cid:293

hgt:64in ecl:oth
hcl:#18171d
pid:105602506 byr:1973
eyr:2022
iyr:2014

eyr:2039 hgt:64
ecl:#ab45a8 byr:2009
iyr:2025 pid:182cm hcl:d1614a cid:103
"""
