Feature: US-39 - Posponer un recordatorio
  Como usuario
  Deseo posponer un recordatorio si no puedo atenderlo en ese momento
  Para que me vuelva a avisar más tarde

#-------------------------------------------------------------------------------------------
Scenario Outline: Posponer un día

    Given el usuario recibe el recordatorio "<recordatorio>" el "<fecha_aviso>"
    When selecciona "Recordarme mañana"
    Then el sistema reprograma la notificación para el "<nueva_fecha>" y muestra el mensaje "<mensaje>"

    Examples: Datos de entrada y salida
      | recordatorio                       | fecha_aviso | nueva_fecha | mensaje                                      |
      | Tu recibo de luz vence en 2 días   | 09/11/2026  | 10/11/2026  | Listo. Te volveremos a avisar el 10/11/2026. |
      | Tu recibo de agua vence mañana     | 09/11/2026  | 10/11/2026  | Listo. Te volveremos a avisar el 10/11/2026. |
      | Tu recibo de cable vence en 2 días | 18/11/2026  | 19/11/2026  | Listo. Te volveremos a avisar el 19/11/2026. |


#-------------------------------------------------------------------------------------------
Scenario Outline: Posponer varias veces

    Given el usuario pospuso <veces> el recordatorio "<recordatorio>" desde el 09/11/2026
    When llega la nueva fecha "<nueva_fecha>"
    Then el sistema le muestra otra vez el recordatorio con la opción "Recordarme mañana" para posponerlo nuevamente

    Examples: Datos de entrada
      | recordatorio                 | veces      | nueva_fecha |
      | Tu recibo de cable ya venció | dos veces  | 11/11/2026  |
      | Tu recibo de agua ya venció  | tres veces | 12/11/2026  |


#-------------------------------------------------------------------------------------------
Scenario Outline: Notificación en la nueva fecha

    Given el recordatorio del "<recibo>" que vence el "<fecha_vencimiento>" fue pospuesto para el "<fecha_reprogramada>"
    When llega la fecha reprogramada
    Then el sistema envía la notificación "<titulo>" con el texto "<texto>"

    Examples: Datos de entrada y salida
      | recibo          | fecha_vencimiento | fecha_reprogramada | titulo                                     | texto                                                                                  |
      | Recibo de luz   | 11/11/2026        | 10/11/2026         | Tu recibo de luz vence mañana              | Recuerda pagar S/ 85.40. Vence el 11/11/2026.                                          |
      | Recibo de agua  | 10/11/2026        | 10/11/2026         | Última alerta: tu recibo de agua vence hoy | Aún tienes S/ 42.60 pendientes. Paga hoy.                                              |
      | Recibo de cable | 05/11/2026        | 10/11/2026         | Tu recibo de cable ya venció               | Aún tienes S/ 59.90 pendientes. Págalo lo antes posible para evitar recargos o cortes. |
