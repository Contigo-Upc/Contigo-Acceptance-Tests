Feature: US-07 - Búsqueda de un trámite por texto o voz
  Como usuario
  Deseo buscar un trámite escribiendo o hablando
  Para no tener que revisar todo el menú

#-------------------------------------------------------------------------------------------
Scenario: Búsqueda por voz exitosa

    Given el usuario toca el ícono de búsqueda
    When dice "quiero pagar la luz"
    Then el sistema muestra el trámite correspondiente


#-------------------------------------------------------------------------------------------
Scenario: Búsqueda sin resultados

    Given el usuario busca un trámite que no existe en la app
    When presiona "Buscar"
    Then el sistema muestra un mensaje indicando que no se encontraron resultados


#-------------------------------------------------------------------------------------------
Scenario: Búsqueda por texto parcial

    Given el usuario escribe solo parte del nombre del trámite
    When el sistema procesa la búsqueda
    Then muestra todas las coincidencias relacionadas
