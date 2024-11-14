-- Add translations by Cocodrulo
local Translations = {
    headers = {
        ['bsm'] = 'Menú de Jefe - ',
    },
    body = {
        ['manage'] = 'Gestionar empleados',
        ['managed'] = 'Revisa tu lista de empleados',
        ['hire'] = 'Contratar empleados',
        ['hired'] = 'Contratar civiles cercanos',
        ['storage'] = 'Acceso a almacenamiento',
        ['storaged'] = 'Abrir almacenamiento',
        ['outfits'] = 'Atuendos',
        ['outfitsd'] = 'Ver atuendos guardados',
        ['money'] = 'Gestión de dinero',
        ['moneyd'] = 'Revisar el saldo de tu empresa',
        ['mempl'] = 'Gestionar empleados - ',
        ['mngpl'] = 'Gestionar ',
        ['grade'] = 'Rango: ',
        ['fireemp'] = 'Despedir empleado',
        ['hireemp'] = 'Contratar empleados - ',
        ['cid'] = 'ID de ciudadano: ',
        ['balance'] = 'Saldo: $',
        ['deposit'] = 'Depositar',
        ['depositd'] = 'Depositar dinero en la cuenta',
        ['withdraw'] = 'Retirar',
        ['withdrawd'] = 'Retirar dinero de la cuenta',
        ['depositm'] = 'Depositar dinero <br> Saldo disponible: $',
        ['withdrawm'] = 'Retirar dinero <br> Saldo disponible: $',
        ['submit'] = 'Confirmar',
        ['amount'] = 'Cantidad',
        ['return'] = 'Volver',
        ['exit'] = 'Salir',
    },
    drawtext = {
        ['label'] = '[E] Abrir gestión de trabajo',
    },
    target = {
        ['label'] = 'Menú de Jefe',
    },
    headersgang = {
        ['bsm'] = 'Gestión de Banda - ',
    },
    bodygang = {
        ['manage'] = 'Gestionar miembros de la banda',
        ['managed'] = 'Reclutar o despedir miembros de la banda',
        ['hire'] = 'Reclutar miembros',
        ['hired'] = 'Contratar miembros de la banda',
        ['storage'] = 'Acceso a almacenamiento',
        ['storaged'] = 'Abrir alijo de la banda',
        ['outfits'] = 'Atuendos',
        ['outfitsd'] = 'Cambiar de ropa',
        ['money'] = 'Gestión de dinero',
        ['moneyd'] = 'Revisar el saldo de tu banda',
        ['mempl'] = 'Gestionar miembros de la banda - ',
        ['mngpl'] = 'Gestionar ',
        ['grade'] = 'Rango: ',
        ['fireemp'] = 'Despedir',
        ['hireemp'] = 'Contratar miembros de la banda - ',
        ['cid'] = 'ID de ciudadano: ',
        ['balance'] = 'Saldo: $',
        ['deposit'] = 'Depositar',
        ['depositd'] = 'Depositar dinero en la cuenta',
        ['withdraw'] = 'Retirar',
        ['withdrawd'] = 'Retirar dinero de la cuenta',
        ['depositm'] = 'Depositar dinero <br> Saldo disponible: $',
        ['withdrawm'] = 'Retirar dinero <br> Saldo disponible: $',
        ['submit'] = 'Confirmar',
        ['amount'] = 'Cantidad',
        ['return'] = 'Volver',
        ['exit'] = 'Salir',
    },
    drawtextgang = {
        ['label'] = '[E] Abrir gestión de la banda',
    },
    targetgang = {
        ['label'] = 'Menú de la Banda',
    }
}

if GetConvar('qb_locale', 'en') == 'es' then
    Lang = Lang or Locale:new({
        phrases = Translations,
        warnOnMissing = true
    })
end
