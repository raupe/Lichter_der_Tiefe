# Flags

Folgende Flags wurden in den Scripten verwendet um den Zustand von Ereignissen z.b. dem Fortschritt der Handlung zu beschreiben. Die original Dokumentation ist hier verfügbar: https://docs.google.com/a/rau.pe/document/d/1YPNRuXiz-8NVE0mOsIPrdU3_N-uWduXAjrujhIpbJLg/edit


ID    Entity/Node/Intro/Banter/Values
_____________________________________________________________________

000   Hafen (I) -> flag 0 kann nicht benutzt werden

001   Dialog Mann (N)
        0 - default

002   Flag ini

003   Sturz (N)

004   Schwierigkeitsgrad
        1 - einfach
        2 - normal
        3 - schwer

005   0_hafen, aus wasser ziehen

006   dialog_vater

007   show intro

_____________________________________________________________________

100   Riff der Erleuchtung (I)
        0 - default
        1 - Geist ist erschienen

101   Schacht (B)
        0 - (verhindert am Anfang)
        1 - Emily beschwert sich

102   Los (B)
        0 - default
        1 - Emily fragt sich selbst

103   Nejl_follow_stop (N)
        0 - default
        1 - kein Kommentar mehr

104   Dialog Mejais (N)
        0 - default
        1 bis 17 - schritt im dialog
        18 - dialog zuende

105   1_Lichtblume (E)
        0 - default
        1 - leuchten

106   1_mejais_lied_der_lichter (N)

107   1_mejais_verwandlung (N)

108   mejais belebt lichblumen

_____________________________________________________________________

200   Heimische Gewaesser (I)
        0 - default
        1 - zeige Namen

201   Weg (B)
        0 - default
        1 - Emily fragt sich selbst

202   Strom (B)
        0 - default
        1 - Emily beschwert sich

203   Quest (B)
        0 - default
        1 - Emily fragt wie es Nejl geht

204   Healthcontainer (N)
        0 - default
        1 - eingesammelt

_____________________________________________________________________

300   Nejls Hoehle (I)
        0 - default
        1 - zeige Namen

301   Warm (B)
        0 - default
        1 - Emily bewundert die Hoehle

302   Rock (E)
        0 - default
        1 - zoom hin
        2 - zoom zurück
        3 - zoom zuende

303   Nejl (E)
        0 - default
        1 - getroffen, folgt einem
        2 - getroffen, folgt einem nicht

304   Wap Untiefen (N)
        0 - default
        3 - kann zur "Hoehle"
        4 - kommt aus der "Hoehle"

305   Dialog Nejl (N)
        0 - default
        1 - disable + Nejl folgt einem (303 -> 1)

306   Dialog Nejl / Path
        3 - default, gut
        2
        1 - schlechtes ende
        0

307   Dialog Nejls / Songs
        0 - default
        1
        2
        3 - trigger for 'd - Lied der Lichter'

308   Dialog Abschied (vor Cerajt)

309   Dialog Abschied, nach Cerajt

310   automatisches random-verwandeln

_____________________________________________________________________

400   Riskante Stroemung (I)   (store decision)
        0 - default
        1 - zeige Namen

401   Fisch Kills (E)
        0 - default
        1-2 - Nejl warnt vor dem kaempfen
        3++ - Gesinnung boese

402   Schleichen (B)
        0 - default
        1 - Nejl lobt dich

403   Kampf (B)
        0 - default
        1 - Nejl hat Angst vor der Energie

404   Entscheidung (E)
        0 - default
        1 - Emily hat gekaempft

405   Healthcontainer (N)
        0 - default
        1 - eingesammelt

_____________________________________________________________________

500   Aaalbau (I)
        0 - default
        1 - zeige Namen

501   Entscheidung (N)
        0 - default
        1 - Emily hat gekaempft

502   Healthcontainer (N)
        0 - default
        1 - eingesammelt

503   Nejl Kommentar Vorsicht

504   Nejl Kommentar anderer Weg

505   Nejl Kommentar zum Gang

506   Schacht Posten
        0  - default
        1  - focus Aal
        2  - focus Emily

_____________________________________________________________________

600   Palast der Sphinx (I)
        0 - default
        1 - zeige Namen

601   Hinweis (B)
        0 - default
        1 - Nejl empfiehlt zurueckzukommen

602   Entscheidung (N)
        0 - default
        1 - Emily hat gekaempft

603   Sphinx Kommentar

604   Sphinx Quest
        1 - lässt passieren

605   Sphinx verhöhnt Emily

606   Nejl empfiehlt später zurückzukommen

_____________________________________________________________________

700   Untiefen (I)
        0 - default
        1 - zeige Namen

701   Untiefen
        0 - default
        1 - zugang frei
        2 - betreten

702    
        0 - default
        1 - cerajt besiegt

703   Banter Verwandlung

704   Form

705   disableInput

706   kommentar ceraijt

_____________________________________________________________________

800   A - Hoehle der Ruhe (I)
        0 - default
        1 - zeige namen

801   A - Lichterqualle (E)
        0 - default
        1 - Klang der Ruhe gelernt

802   Nejl (E) schläft durch Klang der Ruhe
        1  - ist schon einmal eingeschlafen

803   Nejl aufwecken
        1 - wurde getriggert

_____________________________________________________________________

900   B - Hoehle der Stroemung (I)
        0 - default
        1 - zeige namen

901   B - Lichterqualle (E)
        0 - default
        1 - Klang der Stroemung gelernt

_____________________________________________________________________

1000  C - Hoehle der Entschlossenheit (I)
        0 - default
        1 - zeige namen

1001  C - Lichterqualle (E)
        0 - default
        1 - Klang der Entschlossenheit gelernt

_____________________________________________________________________

1100  D - Lied der Lichter
        0 - default
        1 - Lied der Lichter gelernt

_____________________________________________________________________

1200  spiel ende
