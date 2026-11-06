Feature: US-48 - Continuar trámite pendiente
  Como usuario
  Deseo continuar un trámite pendiente desde mi historial
  Para no tener que comenzar nuevamente desde cero

#-------------------------------------------------------------------------------------------
Scenario: Continuar trámite

    Given existe un trámite pendiente
    When el usuario selecciona "Continuar"
    Then el sistema lo lleva al último paso guardado


#-------------------------------------------------------------------------------------------
Scenario: Datos conservados

    Given el usuario ingresó información anteriormente
    When continúa el trámite
    Then el sistema mantiene los datos guardados


#-------------------------------------------------------------------------------------------
Scenario: Trámite completado

    Given el trámite ya fue completado
    When el usuario consulta su historial
    Then el sistema no muestra la opción "Continuar"
