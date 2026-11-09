Feature: US-38 - Calendario de trámites pendientes
  Como usuario
  Deseo ver en un calendario todos mis trámites y pagos pendientes
  Para organizarme mejor

#-------------------------------------------------------------------------------------------
Scenario Outline: Visualización del calendario

    Given el usuario registró el "<recibo_lejano>" con vencimiento "<fecha_lejana>" y luego el "<recibo_cercano>" con vencimiento "<fecha_cercana>"
    When ingresa a la sección "Calendario"
    Then el sistema muestra primero el "<recibo_cercano>" y después el "<recibo_lejano>", bajo el contador "2 recibos por pagar"

    Examples: Datos de entrada y salida
      | recibo_lejano      | fecha_lejana | recibo_cercano     | fecha_cercana |
      | Recibo de internet | 02/12/2026   | Recibo de luz      | 11/11/2026    |
      | Recibo de cable    | 25/11/2026   | Recibo de agua     | 18/11/2026    |
      | Recibo de agua     | 20/12/2026   | Recibo de internet | 30/11/2026    |


#-------------------------------------------------------------------------------------------
Scenario Outline: Calendario vacío

    Given el usuario <situacion>
    When revisa el calendario
    Then el sistema muestra el mensaje "<mensaje>"

    Examples: Datos de entrada y salida
      | situacion                                         | mensaje                                                                                                 |
      | no tiene recibos registrados                      | No tienes recibos por pagar con fecha de vencimiento. Escanea un recibo para agregarlo a tu calendario. |
      | solo tiene recibos ya pagados                     | No tienes recibos por pagar con fecha de vencimiento. Escanea un recibo para agregarlo a tu calendario. |
      | tiene recibos pendientes sin fecha de vencimiento | No tienes recibos por pagar con fecha de vencimiento. Escanea un recibo para agregarlo a tu calendario. |


#-------------------------------------------------------------------------------------------
Scenario Outline: Filtrado por mes

    Given el usuario tiene por pagar el recibo de luz (11/11/2026), el de agua (18/11/2026) y el de internet (02/12/2026)
    When selecciona el mes "<mes>" en el calendario
    Then el sistema muestra solo "<recibos_mostrados>" con el contador "<contador>"

    Examples: Datos de entrada y salida
      | mes            | recibos_mostrados              | contador            |
      | Noviembre 2026 | Recibo de luz y Recibo de agua | 2 recibos por pagar |
      | Diciembre 2026 | Recibo de internet             | 1 recibo por pagar  |
