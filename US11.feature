Feature: US-11 - Instrucciones una etapa a la vez
  Como usuario con poca experiencia digital
  Deseo ver una sola instrucción por pantalla
  Para no sentirme abrumado

#-------------------------------------------------------------------------------------------
Scenario: Visualización de la primera etapa

    Given el usuario inició un trámite
    When el sistema presenta el primer paso
    Then se muestra únicamente esa instrucción con su apoyo visual


#-------------------------------------------------------------------------------------------
Scenario: Avance a la siguiente etapa

    Given el usuario completó la instrucción actual
    When presiona "Siguiente"
    Then el sistema muestra la instrucción de la etapa siguiente


#-------------------------------------------------------------------------------------------
Scenario: Intento de saltar una etapa

    Given el usuario intenta avanzar sin completar el paso actual
    When presiona "Siguiente"
    Then el sistema le indica qué falta completar antes de continuar
