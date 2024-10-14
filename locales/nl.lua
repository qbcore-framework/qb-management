-- Add translations by MC
local Translations = {
    headers = {
        ['bsm'] = 'Boss Menu - ',
    },
    body = {
        ['manage'] = 'Medewerkers Beheren',
        ['managed'] = 'Medewerkerslijst',
        ['hire'] = 'Medewerker aannemen',
        ['hired'] = 'Hire Nearby Civilians',
        ['storage'] = 'Toegang opslag',
        ['storaged'] = 'Open opslag',
        ['outfits'] = 'Outfits',
        ['outfitsd'] = 'Opgeslagen outfits',
        ['money'] = 'Financieel management',
        ['moneyd'] = 'Bedrijfsfinciancien',
        ['mempl'] = 'Medewerkers Beheren - ',
        ['mngpl'] = 'Beheer ',
        ['grade'] = 'Grade: ',
        ['fireemp'] = 'Medewerker ontslagen',
        ['hireemp'] = 'MEdewerker aannemen - ',
        ['cid'] = 'Burger ID: ',
        ['balance'] = 'Balans: €',
        ['deposit'] = 'Storten',
        ['depositd'] = 'Geld storten op rekening',
        ['withdraw'] = 'Opnemen',
        ['withdrawd'] = 'Geld opnemen van rekening',
        ['depositm'] = 'Geld storten <br> Beschikbare balans: €',
        ['withdrawm'] = 'Geld opnemen <br> Available balans: €',
        ['submit'] = 'Bevestigen',
        ['amount'] = 'Hoeveelheid',
        ['return'] = 'Terug',
        ['exit'] = 'Afsluiten',
    },
    drawtext = {
        ['label'] = '[E] Open werkbeheer',
    },
    target = {
        ['label'] = 'Boss Menu',
    },
    headersgang = {
        ['bsm'] = 'Gang Beheer  - ',
    },
    bodygang = {
        ['manage'] = 'Beheer Bendeleden',
        ['managed'] = 'Werv of Ontsla Bendeleden',
        ['hire'] = 'Werv Leden',
        ['hired'] = 'Huur Bendeleden In',
        ['storage'] = 'Opslagtoegang',
        ['storaged'] = 'Open Bendevoorraad',
        ['outfits'] = 'Outfits',
        ['outfitsd'] = 'Kleed je om',
        ['money'] = 'Geldbeheer',
        ['moneyd'] = 'Controleer je Bende Balans',
        ['mempl'] = 'Beheer Bendeleden - ',
        ['mngpl'] = 'Beheer ',
        ['grade'] = 'Rang: ',
        ['fireemp'] = 'Ontsla',
        ['hireemp'] = 'Huur Bendeleden In - ',
        ['cid'] = 'Burger ID: ',
        ['balance'] = 'Balans: $',
        ['deposit'] = 'Storten',
        ['depositd'] = 'Stort Geld op rekening',
        ['withdraw'] = 'Opnemen',
        ['withdrawd'] = 'Neem Geld van rekening op',
        ['depositm'] = 'Stort Geld <br> Beschikbare Balans: €',
        ['withdrawm'] = 'Neem Geld Op <br> Beschikbare Balans: €',
        ['submit'] = 'Bevestig',
        ['amount'] = 'Bedrag',
        ['return'] = 'Terug',
        ['exit'] = 'Afsluiten',
    },
    drawtextgang = {
        ['label'] = '[E] Open Gang beheer',
    },
    targetgang = {
        ['label'] = 'Gang Menu',
    }
}

if GetConvar('qb_locale', 'en') == 'nl' then
    Lang = Lang or Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
