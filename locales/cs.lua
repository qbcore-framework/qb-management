-- Add translations by MC
local Translations = {
    headers = {
        ['bsm'] = 'Boss Menu - ',
    },
    body = {
        ['manage'] = 'Zaměstnanci',
        ['managed'] = 'List zaměstnanců',
        ['hire'] = 'Nabrat civilistu',
        ['hired'] = 'Nabrat nejbližšího civilistu',
        ['storage'] = 'Trezor',
        ['storaged'] = 'Otevřít trezor',
        ['outfits'] = 'Oblečení',
        ['outfitsd'] = 'Uložené oblečení',
        ['money'] = 'Finance',
        ['moneyd'] = 'Zkontrolovat stav účtu',
        ['mempl'] = 'Spravovat zaměstnance - ',
        ['mngpl'] = 'Spravovat ',
        ['grade'] = 'Hodnost: ',
        ['fireemp'] = 'Propustit zaměstnance',
        ['hireemp'] = 'Nabrat civilistu - ',
        ['cid'] = 'ID hráče: ',
        ['balance'] = 'Stav účtu: $',
        ['deposit'] = 'Vložit peníze',
        ['depositd'] = 'Vložit peníze na účet',
        ['withdraw'] = 'Vybrat peníze',
        ['withdrawd'] = 'Vybrat penize z kasy',
        ['depositm'] = 'Vložit peníze <br> Zůstatek financí: $',
        ['withdrawm'] = 'Vybrat peníze <br> Zůstatek financí: $',
        ['submit'] = 'Potrvdit',
        ['amount'] = 'Hodnota',
        ['return'] = 'Zpět',
        ['exit'] = 'Odejít',
    },
    drawtext = {
        ['label'] = '[E] Open Job Management',
    },
    target = {
        ['label'] = 'Vedení Frakce',
    },
    headersgang = {
        ['bsm'] = 'Vedení gangů  - ',
    },
    bodygang = {
        ['manage'] = 'Spravovat členy gangu',
        ['managed'] = 'Přijímání nebo propouštění členů gangu',
        ['hire'] = 'Nábor členů',
        ['hired'] = 'Najmout členy Gangu',
        ['storage'] = 'Přístup k úložišti',
        ['storaged'] = 'Otevřít Gang Uložiště',
        ['outfits'] = 'Outfity',
        ['outfitsd'] = 'Výměna oblečení',
        ['money'] = 'Správa peněz',
        ['moneyd'] = 'Kontrola zůstatku Gangu',
        ['mempl'] = 'Spravovat Gang členy - ',
        ['mngpl'] = 'Spravovat ',
        ['grade'] = 'Hodnost: ',
        ['fireemp'] = 'Propustit člena',
        ['hireemp'] = 'Nabrat civilistu - ',
        ['cid'] = 'ID hráče: ',
        ['balance'] = 'Stav účtu: $',
        ['deposit'] = 'Vložit peníze',
        ['depositd'] = 'Vložit peníze na účet',
        ['withdraw'] = 'Vybrat peníze',
        ['withdrawd'] = 'Vybrat penize z kasy',
        ['depositm'] = 'Vložit peníze <br> Zůstatek financí: $',
        ['withdrawm'] = 'Vybrat peníze <br> Zůstatek financí: $',
        ['submit'] = 'Confirm',
        ['amount'] = 'Potrvdit',
        ['return'] = 'Zpět',
        ['exit'] = 'Odejít',
    },
    drawtextgang = {
        ['label'] = '[E] Open Gang Management',
    },
    targetgang = {
        ['label'] = 'Gang Menu',
    }
}

if GetConvar('qb_locale', 'en') == 'cs' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
