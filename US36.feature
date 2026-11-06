Feature: US-36 - Registro de fecha de vencimiento
  Como usuario
  Deseo que la app registre la fecha de vencimiento de un recibo
  Para que no se me olvide pagarlo

#-------------------------------------------------------------------------------------------
Scenario: Registro automático

    Given el usuario escaneó un recibo con fecha de vencimiento
    When el sistema procesa el documento
    Then guarda la fecha en el calendario de la app


#-------------------------------------------------------------------------------------------
Scenario: Registro manual

    Given el sistema no detectó la fecha automáticamente
    When el usuario la ingresa manualmente
    Then el sistema la guarda en el calendario


#-------------------------------------------------------------------------------------------
Scenario: Fecha no detectada

    Given el recibo no tiene una fecha de vencimiento visible
    When el sistema procesa el documento
    Then solicita al usuario ingresarla manualmente
