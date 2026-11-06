Feature: US-25 - Historial de conversaciones con el asistente
  Como usuario
  Deseo revisar las respuestas que me dio el asistente anteriormente
  Para recordar cómo resolví una duda similar

#-------------------------------------------------------------------------------------------
Scenario: Visualización del historial

    Given el usuario abre el asistente
    When selecciona "Ver conversaciones anteriores"
    Then el sistema muestra el registro de preguntas y respuestas previas


#-------------------------------------------------------------------------------------------
Scenario: Historial vacío

    Given el usuario nunca usó el asistente antes
    When revisa el historial
    Then el sistema indica que aún no hay conversaciones registradas


#-------------------------------------------------------------------------------------------
Scenario: Eliminar una conversación

    Given el usuario quiere borrar una conversación antigua
    When la selecciona y confirma la eliminación
    Then el sistema la retira del historial
