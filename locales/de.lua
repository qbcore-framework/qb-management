-- Add translations by Mops
local Translations = {
    headers = {
        ['bsm'] = 'Boss Menu - ',
    },
    body = {
        ['manage'] = 'Mitarbeiter verwalten',
        ['managed'] = 'Mitarbeiterliste verwalten',
        ['hire'] = 'Mitarbeiter einstellen',
        ['hired'] = 'Mitarbeiter in der Nähe einstellen',
        ['storage'] = 'Speicherzugriff',
        ['storaged'] = 'Lager öffnen',
        ['outfits'] = 'Outfits',
        ['outfitsd'] = 'Gespeicherte Outfits ansehen',
        ['money'] = 'Geldverwaltung',
        ['moneyd'] = 'Prüfen Sie Ihr Unternehmenssaldo',
        ['mempl'] = 'Mitarbeiter verwalten - ',
        ['mngpl'] = 'Verwalten Sie ',
        ['grade'] = 'Rang: ',
        ['fireemp'] = 'Mitarbeiter entlassen',
        ['hireemp'] = 'Mitarbeiter anheuern - ',
        ['cid'] = 'Bürger ID: ',
        ['balance'] = 'Kontostand: $',
        ['deposit'] = 'Einzahlen',
        ['depositd'] = 'Geld auf das Konto einzahlen',
        ['withdraw'] = 'Abheben',
        ['withdrawd'] = 'Geld von einem Konto abheben',
        ['depositm'] = 'Geld einzahlen <br> Verfügbarer Guthaben: $',
        ['withdrawm'] = 'Geld abheben <br> Verfügbares Guthaben: $',
        ['submit'] = 'Bestätigen',
        ['amount'] = 'Betrag',
        ['return'] = 'Zurück',
        ['exit'] = 'Exit',
    },
    drawtext = {
        ['label'] = '[E] Open Job Management',
    },
    target = {
        ['label'] = 'Boss Menu',
    },
    headersgang = {
        ['bsm'] = 'Gang Management  - ',
    },
    bodygang = {
        ['manage'] = 'Verwalten von Gangmitgliedern',
        ['managed'] = 'Bandenmitglieder rekrutieren oder entlassen',
        ['hire'] = 'Mitglieder werben',
        ['hired'] = 'Bandenmitglieder anheuern',
        ['storage'] = 'Speicherzugang',
        ['storaged'] = 'Öffne Gangversteck',
        ['outfits'] = 'Outfits',
        ['outfitsd'] = 'Kleidung wechseln',
        ['money'] = 'Geldverwaltung',
        ['moneyd'] = 'Überprüfen Sie Ihren Gangsaldo',
        ['mempl'] = 'Verwalten von Gangmitgliedern - ',
        ['mngpl'] = 'Verwalten ',
        ['grade'] = 'Rang: ',
        ['fireemp'] = 'Entlassen',
        ['hireemp'] = 'Bandenmitglieder anheuern - ',
        ['cid'] = 'Bürger ID: ',
        ['balance'] = 'Bilanz: $',
        ['deposit'] = 'Einzahlung',
        ['depositd'] = 'Geld auf das Konto einzahlen',
        ['withdraw'] = 'Abheben',
        ['withdrawd'] = 'Geld von einem Konto abheben',
        ['depositm'] = 'Geld einzahlen <br> Verfügbarer Guthaben: $',
        ['withdrawm'] = 'Geld abheben <br> Verfügbares Guthaben: $',
        ['submit'] = 'Bestätigen',
        ['amount'] = 'Betrag',
        ['return'] = 'Zurück',
        ['exit'] = 'Exit',
    },
    drawtextgang = {
        ['label'] = '[E] Offenes Gang-Management',
    },
    targetgang = {
        ['label'] = 'Gang Menu',
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
