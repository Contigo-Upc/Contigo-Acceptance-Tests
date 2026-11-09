Feature: US-25 - Historial de conversaciones con el asistente
  Como usuario
  Deseo revisar las respuestas que me dio el asistente anteriormente
  Para recordar cómo resolví una duda similar

#-------------------------------------------------------------------------------------------
Scenario Outline: Visualización del historial

    Given el usuario abre el asistente
    When selecciona "Ver conversaciones anteriores"
    Then el sistema muestra la conversación del "<fecha>" con la pregunta "<pregunta>" y la respuesta "<respuesta>"

    Examples: Datos de entrada y salida
      | fecha      | pregunta                 | respuesta                                                                                                                                    |
      | 15/11/2026 | ¿Cuándo vence mi recibo? | Te avisamos 2 días antes y el día que vence tu recibo, si sigue pendiente. En el calendario ves todas tus fechas.                            |
      | 28/11/2026 | ¿Cuánto cuesta?          | Usar Contigo es gratis. Lo que pagas es el monto de tu recibo o la tasa del trámite, siempre en la página oficial de cada empresa o entidad. |
      | 03/12/2026 | Gracias                  | ¡Con gusto! Aquí estoy si necesitas algo más.                                                                                                |


#-------------------------------------------------------------------------------------------
Scenario: Historial vacío

    Given el usuario nunca usó el asistente antes
    When revisa el historial
    Then el sistema indica que aún no hay conversaciones registradas con el mensaje "Todavía no tienes conversaciones. Cuando le preguntes algo al asistente, aparecerán aquí."


#-------------------------------------------------------------------------------------------
Scenario Outline: Eliminar una conversación

    Given el usuario quiere borrar la conversación del "<fecha>" sobre "<tema>"
    When la selecciona y confirma la eliminación
    Then el sistema la retira del historial y muestra el mensaje "<mensaje>"

    Examples: Datos de entrada y salida
      | fecha      | tema                   | mensaje                                  |
      | 15/11/2026 | vencimiento del recibo | Borramos la conversación del 15/11/2026. |
      | 28/11/2026 | costo del trámite      | Borramos la conversación del 28/11/2026. |
