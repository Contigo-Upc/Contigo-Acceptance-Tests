Feature: US-29 - Confirmación de finalización de la guía
  Como usuario que desconfía de los trámites digitales
  Deseo que la app me confirme que completé todos los pasos
  Para saber que no me quedó nada pendiente

#-------------------------------------------------------------------------------------------
Scenario: Guía completada

    Given el usuario recorrió todos los pasos de la guía
    When llega al final
    Then el sistema muestra una pantalla de cierre con ícono y mensaje indicando que completó la orientación


#-------------------------------------------------------------------------------------------
Scenario: Pasos pendientes

    Given el usuario intenta finalizar sin completar todos los pasos
    When llega a la pantalla de cierre
    Then el sistema le indica qué pasos quedaron pendientes y le permite regresar a ellos


#-------------------------------------------------------------------------------------------
Scenario: Confirmación fuera de la app

    Given el usuario terminó la guía
    When el sistema muestra la pantalla de cierre
    Then le explica cómo verificar en la plataforma oficial que su trámite quedó registrado
