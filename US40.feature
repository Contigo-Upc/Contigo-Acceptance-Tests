Feature: US-40 - Recordatorio por voz o llamada
  Como adulto mayor
  Deseo recibir el recordatorio como un mensaje de voz
  Para no depender de leer notificaciones en pantalla

#-------------------------------------------------------------------------------------------
Scenario: Recordatorio por voz

    Given el usuario activó la opción de recordatorios por voz
    When se acerca la fecha de vencimiento
    Then el sistema reproduce un audio recordando el pago pendiente


#-------------------------------------------------------------------------------------------
Scenario: Usuario no responde

    Given el recordatorio por voz no fue atendido
    When pasa el tiempo definido
    Then el sistema reintenta el aviso más tarde


#-------------------------------------------------------------------------------------------
Scenario: Desactivar recordatorios por voz

    Given el usuario ya no desea este tipo de recordatorio
    When lo desactiva en configuración
    Then el sistema deja de enviar avisos por voz
