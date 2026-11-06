Feature: US-47 - Consultar estado del trámite
  Como usuario
  Deseo conocer el estado actual de un trámite
  Para saber si está pendiente, en proceso o completado

#-------------------------------------------------------------------------------------------
Scenario: Trámite pendiente

    Given el trámite todavía no finalizó
    When el usuario consulta su historial
    Then el sistema muestra el estado "Pendiente"


#-------------------------------------------------------------------------------------------
Scenario: Trámite en proceso

    Given el trámite está siendo procesado
    When el usuario revisa su estado
    Then el sistema muestra "En proceso"


#-------------------------------------------------------------------------------------------
Scenario: Trámite completado

    Given el trámite terminó correctamente
    When el usuario consulta su estado
    Then el sistema muestra "Completado"
