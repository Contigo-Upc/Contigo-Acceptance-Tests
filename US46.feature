Feature: US-46 - Consultar historial de trámites
  Como usuario
  Deseo consultar mi historial de trámites
  Para revisar los procedimientos que ya realicé

#-------------------------------------------------------------------------------------------
Scenario: Visualización del historial

    Given el usuario ingresa a "Historial"
    When accede a la sección
    Then el sistema muestra sus trámites realizados


#-------------------------------------------------------------------------------------------
Scenario: Historial vacío

    Given el usuario no ha realizado ningún trámite
    When ingresa a "Historial"
    Then el sistema muestra un mensaje indicando que todavía no tiene trámites registrados


#-------------------------------------------------------------------------------------------
Scenario: Historial actualizado

    Given el usuario finalizó un trámite
    When vuelve a consultar su historial
    Then el sistema muestra el nuevo trámite registrado
