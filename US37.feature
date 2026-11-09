Feature: US-37 - Notificación previa al vencimiento
  Como usuario
  Deseo recibir un aviso antes de que venza un pago
  Para evitar moras

#-------------------------------------------------------------------------------------------
Scenario Outline: Notificación 2 días antes

    Given el "<recibo>" de "<monto>" tiene fecha de vencimiento "<fecha_vencimiento>"
    When llega el "<fecha_actual>" y faltan 2 días para esa fecha
    Then el sistema envía la notificación push "<titulo>" con el texto "<texto>"

    Examples: Datos de entrada y salida
      | recibo             | monto    | fecha_vencimiento | fecha_actual | titulo                                | texto                                         |
      | Recibo de luz      | S/ 85.40 | 11/11/2026        | 09/11/2026   | Tu recibo de luz vence en 2 días      | Recuerda pagar S/ 85.40. Vence el 11/11/2026. |
      | Recibo de agua     | S/ 42.60 | 20/11/2026        | 18/11/2026   | Tu recibo de agua vence en 2 días     | Recuerda pagar S/ 42.60. Vence el 20/11/2026. |
      | Recibo de internet | S/ 79.90 | 02/12/2026        | 30/11/2026   | Tu recibo de internet vence en 2 días | Recuerda pagar S/ 79.90. Vence el 02/12/2026. |


#-------------------------------------------------------------------------------------------
Scenario Outline: Desactivar notificaciones

    Given el usuario no desea recibir avisos para su "<recibo>"
    When desactiva el interruptor "Recordatorios activados" de ese recibo
    Then el sistema muestra el mensaje "<mensaje>" y deja de enviar notificaciones para ese recibo

    Examples: Datos de entrada y salida
      | recibo             | mensaje                                            |
      | Recibo de luz      | Ya no recibirás avisos para tu recibo de luz.      |
      | Recibo de cable    | Ya no recibirás avisos para tu recibo de cable.    |
      | Recibo de internet | Ya no recibirás avisos para tu recibo de internet. |


#-------------------------------------------------------------------------------------------
Scenario Outline: Última alerta el día del vencimiento

    Given el "<recibo>" de "<monto>" vence hoy, 09/11/2026
    When el usuario aún no lo ha pagado
    Then el sistema envía la notificación final "<titulo>" con el texto "<texto>"

    Examples: Datos de entrada y salida
      | recibo          | monto    | titulo                                      | texto                                     |
      | Recibo de luz   | S/ 85.40 | Última alerta: tu recibo de luz vence hoy   | Aún tienes S/ 85.40 pendientes. Paga hoy. |
      | Recibo de agua  | S/ 42.60 | Última alerta: tu recibo de agua vence hoy  | Aún tienes S/ 42.60 pendientes. Paga hoy. |
      | Recibo de cable | S/ 59.90 | Última alerta: tu recibo de cable vence hoy | Aún tienes S/ 59.90 pendientes. Paga hoy. |
