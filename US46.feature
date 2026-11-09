Feature: US-46 - Consultar historial de trámites
  Como usuario
  Deseo consultar mi historial de trámites
  Para revisar los procedimientos que ya realicé

#-------------------------------------------------------------------------------------------
Scenario Outline: Visualización del historial

    Given el usuario ingresa a "Historial"
    When accede a la sección
    Then el sistema muestra el trámite "<tramite>" realizado el "<fecha>"

    Examples: Datos de salida
      | tramite            | fecha      |
      | Pago de luz        | 05/11/2026 |
      | Renovación de DNI  | 12/11/2026 |
      | Consulta de deudas | 20/11/2026 |


#-------------------------------------------------------------------------------------------
Scenario: Historial vacío

    Given el usuario no ha realizado ningún trámite
    When ingresa a "Historial"
    Then el sistema muestra un mensaje indicando que todavía no tiene trámites registrados


#-------------------------------------------------------------------------------------------
Scenario Outline: Historial actualizado

    Given el usuario finalizó el trámite "<tramite>" el "<fecha>"
    When vuelve a consultar su historial
    Then el sistema muestra "<tramite>" con fecha "<fecha>" como el nuevo trámite registrado

    Examples: Datos de entrada y salida
      | tramite          | fecha      |
      | Pago de agua     | 28/11/2026 |
      | Pago de internet | 03/12/2026 |
