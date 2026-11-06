Feature: US-50 - Consultar respuesta del soporte
  Como usuario
  Deseo consultar la respuesta del personal de soporte
  Para conocer cómo solucionar mi problema

#-------------------------------------------------------------------------------------------
Scenario: Respuesta disponible

    Given el personal de soporte respondió la solicitud
    When el usuario ingresa a soporte
    Then el sistema muestra la respuesta recibida


#-------------------------------------------------------------------------------------------
Scenario: Solicitud pendiente

    Given soporte todavía no respondió
    When el usuario consulta su solicitud
    Then el sistema indica que continúa pendiente


#-------------------------------------------------------------------------------------------
Scenario: Nueva respuesta

    Given existe una nueva respuesta
    When el usuario abre la solicitud
    Then el sistema muestra el mensaje del personal de soporte
