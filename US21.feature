Feature: US-21 - Consulta al asistente por texto
  Como usuario
  Deseo escribirle una pregunta al asistente
  Para resolver mi duda de inmediato

#-------------------------------------------------------------------------------------------
Scenario Outline: Consulta con respuesta exitosa

    Given el usuario toca el botón del asistente desde el trámite "<tramite>"
    When escribe la pregunta "<pregunta>"
    Then el asistente responde en lenguaje sencillo sobre ese trámite: "<respuesta>"

    Examples: Datos de entrada y salida
      | tramite           | pregunta               | respuesta                                                                                                                                                             |
      | Pago de luz       | ¿Cuánto tiempo demora? | La guía de «Pago de luz» toma unos 6 minutos. Puedes ir a tu ritmo: si sales, tu avance se queda guardado.                                                            |
      | Renovación de DNI | ¿Cuánto cuesta?        | Renovar el DNI tiene una tasa que se paga en el Banco de la Nación o en Págalo.pe. El monto exacto lo confirmas en la página oficial de RENIEC, porque puede cambiar. |
      | Pago de cable     | ¿Cuánto cuesta?        | El monto que debes pagar es el que aparece en tu recibo como «Total a pagar». Contigo no cobra nada por acompañarte.                                                  |


#-------------------------------------------------------------------------------------------
Scenario Outline: Pregunta que el asistente no puede responder

    Given el usuario escribe la pregunta "<pregunta>" que excede el alcance del asistente
    When este no encuentra una respuesta adecuada
    Then ofrece derivar la consulta a soporte humano con la sugerencia "Hablar con una persona"

    Examples: Datos de entrada
      | pregunta                           |
      | ¿Me ayudas a cobrar mi pensión?    |
      | ¿Qué remedio tomo para la presión? |
      | ¿Puedes pagar mi recibo por mí?    |


#-------------------------------------------------------------------------------------------
Scenario Outline: Pregunta ambigua

    Given el usuario escribe la pregunta poco clara "<pregunta>"
    When el asistente no comprende la intención
    Then solicita al usuario que reformule con el mensaje "No logré entender tu pregunta. Puedes preguntarme cuánto cuesta un trámite, qué documentos necesitas, cuándo vence tu recibo o qué significa una palabra. También puedes hablar con una persona."

    Examples: Datos de entrada
      | pregunta             |
      | eso de ayer          |
      | ¿y lo otro?          |
      | no sé qué hacer aquí |
