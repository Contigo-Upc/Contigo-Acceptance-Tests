Feature: US-39 - Posponer un recordatorio
  Como usuario
  Deseo posponer un recordatorio si no puedo atenderlo en ese momento
  Para que me vuelva a avisar más tarde

#-------------------------------------------------------------------------------------------
Scenario: Posponer un día

    Given el usuario recibe un recordatorio
    When selecciona "Recordarme mañana"
    Then el sistema reprograma la notificación para el día siguiente


#-------------------------------------------------------------------------------------------
Scenario: Posponer varias veces

    Given el usuario pospone el mismo recordatorio en más de una ocasión
    When llega la nueva fecha
    Then el sistema le permite posponerlo nuevamente


#-------------------------------------------------------------------------------------------
Scenario: Notificación en la nueva fecha

    Given el recordatorio fue pospuesto
    When llega la fecha reprogramada
    Then el sistema envía la notificación correspondiente
