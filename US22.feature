Feature: US-22 - Consulta al asistente por voz
  Como adulto mayor
  Deseo hablarle al asistente en lugar de escribir
  Para resolver mis dudas más fácilmente

#-------------------------------------------------------------------------------------------
Scenario Outline: Consulta por voz exitosa

    Given el usuario activa el micrófono del asistente
    When dice en voz alta "<pregunta>"
    Then el sistema transcribe la pregunta y el asistente responde por texto y audio "<respuesta>"

    Examples: Datos de entrada y salida
      | pregunta                  | respuesta                                                                                                                                   |
      | ¿Cuándo vence mi recibo?  | Te avisamos 2 días antes y el día que vence tu recibo, si sigue pendiente. En el calendario ves todas tus fechas.                           |
      | Ya pagué mi recibo de luz | Si ya pagaste, ve a «Mis recibos» y toca «Ya pagué». Cuando veas el pago en tu banco o en la página de la empresa, márcalo como confirmado. |
      | Muchas gracias            | ¡Con gusto! Aquí estoy si necesitas algo más.                                                                                               |


#-------------------------------------------------------------------------------------------
Scenario Outline: Voz no reconocida

    Given el audio del usuario no se entiende claramente por "<causa>"
    When el sistema intenta transcribirlo
    Then pide al usuario repetir la pregunta con el mensaje "<mensaje>"

    Examples: Datos de entrada y salida
      | causa                | mensaje                                                                      |
      | mucho ruido de fondo | No pude escucharte bien porque hay mucho ruido. ¿Puedes repetir tu pregunta? |
      | voz muy baja         | Tu voz se escuchó muy bajito. Acércate al celular y repite tu pregunta.      |
      | grabación muy corta  | No alcancé a escucharte. Toca el micrófono y habla con calma.                |


#-------------------------------------------------------------------------------------------
Scenario Outline: Alternar voz y texto

    Given el usuario inició la consulta por voz diciendo "<pregunta_voz>"
    When decide continuar escribiendo "<pregunta_texto>"
    Then el asistente mantiene el contexto de la conversación y responde "<respuesta>"

    Examples: Datos de entrada y salida
      | pregunta_voz                  | pregunta_texto                | respuesta                                                                                                                                                             |
      | ¿Cómo pago mi recibo de agua? | ¿Y dónde encuentro el número? | El número de suministro está arriba del recibo. Tiene 7 u 8 números.                                                                                                  |
      | Quiero renovar mi DNI         | ¿Cuánto cuesta?               | Renovar el DNI tiene una tasa que se paga en el Banco de la Nación o en Págalo.pe. El monto exacto lo confirmas en la página oficial de RENIEC, porque puede cambiar. |
