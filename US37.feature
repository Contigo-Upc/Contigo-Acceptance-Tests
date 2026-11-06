Feature: US-37 - Notificación previa al vencimiento
  Como usuario
  Deseo recibir un aviso antes de que venza un pago
  Para evitar moras

#-------------------------------------------------------------------------------------------
Scenario: Notificación 2 días antes

    Given un pago tiene fecha de vencimiento registrada
    When faltan 2 días para esa fecha
    Then el sistema envía una notificación push recordando el pago


#-------------------------------------------------------------------------------------------
Scenario: Desactivar notificaciones

    Given el usuario no desea recibir avisos para un trámite específico
    When desactiva los recordatorios de ese pago
    Then el sistema deja de enviar notificaciones para ese trámite


#-------------------------------------------------------------------------------------------
Scenario: Última alerta el día del vencimiento

    Given el pago vence el día actual
    When el usuario aún no lo ha realizado
    Then el sistema envía una notificación final de urgencia
