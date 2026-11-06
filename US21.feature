Feature: US-21 - Consulta al asistente por texto
  Como usuario
  Deseo escribirle una pregunta al asistente
  Para resolver mi duda de inmediato

#-------------------------------------------------------------------------------------------
Scenario: Consulta con respuesta exitosa

    Given el usuario toca el botón del asistente
    When escribe su pregunta
    Then el asistente responde en lenguaje sencillo relacionado con el trámite actual


#-------------------------------------------------------------------------------------------
Scenario: Pregunta que el asistente no puede responder

    Given la pregunta del usuario excede el alcance del asistente
    When este no encuentra una respuesta adecuada
    Then ofrece derivar la consulta a soporte humano


#-------------------------------------------------------------------------------------------
Scenario: Pregunta ambigua

    Given el usuario escribe una pregunta poco clara
    When el asistente no comprende la intención
    Then solicita al usuario que reformule o dé más detalles
