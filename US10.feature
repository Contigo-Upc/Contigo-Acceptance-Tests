Feature: US-10 - Filtrado de trámites por categoría
  Como usuario
  Deseo filtrar los trámites por tipo (pagos, consultas, documentos)
  Para encontrar más rápido lo que busco

#-------------------------------------------------------------------------------------------
Scenario: Filtro por categoría "Pagos"

    Given el usuario está en el menú principal
    When selecciona la categoría "Pagos"
    Then el sistema muestra solo los trámites de esa categoría


#-------------------------------------------------------------------------------------------
Scenario: Filtro sin resultados

    Given una categoría no tiene trámites disponibles
    When el usuario la selecciona
    Then el sistema muestra un mensaje indicando que no hay trámites en esa categoría


#-------------------------------------------------------------------------------------------
Scenario: Quitar filtro aplicado

    Given el usuario tiene un filtro activo
    When presiona "Ver todos"
    Then el sistema muestra nuevamente todos los trámites disponibles
