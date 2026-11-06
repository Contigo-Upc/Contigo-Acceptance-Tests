Feature: US-38 - Calendario de trámites pendientes
  Como usuario
  Deseo ver en un calendario todos mis trámites y pagos pendientes
  Para organizarme mejor

#-------------------------------------------------------------------------------------------
Scenario: Visualización del calendario

    Given el usuario tiene trámites registrados con fecha
    When ingresa a la sección "Calendario"
    Then el sistema muestra los trámites ordenados por fecha


#-------------------------------------------------------------------------------------------
Scenario: Calendario vacío

    Given el usuario no tiene trámites pendientes
    When revisa el calendario
    Then el sistema muestra un mensaje indicando que no hay pendientes


#-------------------------------------------------------------------------------------------
Scenario: Filtrado por mes

    Given el usuario quiere ver un mes específico
    When lo selecciona en el calendario
    Then el sistema muestra solo los trámites de ese periodo
