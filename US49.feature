Feature: US-49 - Solicitar ayuda humana
  Como usuario
  Deseo solicitar ayuda de una persona
  Para resolver un problema que no pude solucionar mediante la aplicación

#-------------------------------------------------------------------------------------------
Scenario: Solicitar ayuda

    Given el usuario tiene un problema
    When selecciona "Necesito ayuda"
    Then el sistema muestra las opciones de soporte disponibles


#-------------------------------------------------------------------------------------------
Scenario: Registrar solicitud

    Given el usuario describe su problema
    When presiona "Solicitar ayuda"
    Then el sistema registra la solicitud de soporte


#-------------------------------------------------------------------------------------------
Scenario: Información incompleta

    Given el usuario no describe el problema
    When intenta enviar la solicitud
    Then el sistema solicita completar la información necesaria
