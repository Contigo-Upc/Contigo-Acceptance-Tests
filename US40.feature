Feature: US-40 - Recordatorio por voz o llamada
  Como adulto mayor
  Deseo recibir el recordatorio como un mensaje de voz
  Para no depender de leer notificaciones en pantalla

#-------------------------------------------------------------------------------------------
Scenario Outline: Recordatorio por voz

    Given el usuario activó la opción de recordatorios por voz
    When se acerca la fecha de vencimiento "<fecha_vencimiento>" de su "<recibo>"
    Then el sistema reproduce el audio "<audio>"

    Examples: Datos de entrada y salida
      | recibo          | fecha_vencimiento | audio                                                                                  |
      | Recibo de luz   | 11/11/2026        | Tu recibo de luz vence en 2 días. Recuerda pagar S/ 85.40. Vence el 11/11/2026.        |
      | Recibo de agua  | 10/11/2026        | Tu recibo de agua vence mañana. Recuerda pagar S/ 42.60. Vence el 10/11/2026.          |
      | Recibo de cable | 09/11/2026        | Última alerta: tu recibo de cable vence hoy. Aún tienes S/ 59.90 pendientes. Paga hoy. |


#-------------------------------------------------------------------------------------------
Scenario Outline: Usuario no responde

    Given el recordatorio por voz del "<recibo>" no fue atendido a las <hora_aviso>
    When pasa 1 hora sin respuesta
    Then el sistema reintenta el aviso a las <hora_reintento>

    Examples: Datos de entrada y salida
      | recibo         | hora_aviso | hora_reintento |
      | Recibo de luz  | 09:00      | 10:00          |
      | Recibo de agua | 18:30      | 19:30          |


#-------------------------------------------------------------------------------------------
Scenario: Desactivar recordatorios por voz

    Given el usuario ya no desea este tipo de recordatorio
    When lo desactiva en configuración
    Then el sistema deja de enviar avisos por voz
