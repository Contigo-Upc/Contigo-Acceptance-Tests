Feature: US-22 - Consulta al asistente por voz
  Como adulto mayor
  Deseo hablarle al asistente en lugar de escribir
  Para resolver mis dudas más fácilmente

#-------------------------------------------------------------------------------------------
Scenario: Consulta por voz exitosa

    Given el usuario activa el micrófono del asistente
    When dice su pregunta en voz alta
    Then el sistema transcribe la pregunta y el asistente responde por texto y audio


#-------------------------------------------------------------------------------------------
Scenario: Voz no reconocida

    Given el audio del usuario no se entiende claramente
    When el sistema intenta transcribirlo
    Then pide al usuario repetir la pregunta


#-------------------------------------------------------------------------------------------
Scenario: Alternar voz y texto

    Given el usuario inició la consulta por voz
    When decide continuar escribiendo
    Then el asistente mantiene el contexto de la conversación
