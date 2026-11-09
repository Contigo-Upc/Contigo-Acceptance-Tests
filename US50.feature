Feature: US-50 - Consultar respuesta del soporte
  Como usuario
  Deseo consultar la respuesta del personal de soporte
  Para conocer cómo solucionar mi problema

#-------------------------------------------------------------------------------------------
Scenario Outline: Respuesta disponible

    Given el personal de soporte respondió la solicitud "<ticket>" el "<fecha>"
    When el usuario ingresa a soporte
    Then el sistema muestra la respuesta "<respuesta>"

    Examples: Datos de entrada y salida
      | ticket   | fecha      | respuesta                                                                                              |
      | SOP-0012 | 12/11/2026 | Tu número de suministro está arriba de tu recibo. Tiene 7 u 8 números.                                 |
      | SOP-0013 | 18/11/2026 | La tasa se paga en el Banco de la Nación o en Págalo.pe. El monto lo confirmas en la página de RENIEC. |


#-------------------------------------------------------------------------------------------
Scenario Outline: Solicitud pendiente

    Given soporte todavía no respondió la solicitud "<ticket>" enviada el "<fecha_envio>"
    When el usuario consulta su solicitud
    Then el sistema indica que continúa pendiente con el mensaje "<mensaje>"

    Examples: Datos de entrada y salida
      | ticket   | fecha_envio | mensaje                                                                             |
      | SOP-0014 | 25/11/2026  | Tu solicitud SOP-0014 sigue pendiente. Te avisaremos cuando tengamos una respuesta. |
      | SOP-0015 | 02/12/2026  | Tu solicitud SOP-0015 sigue pendiente. Te avisaremos cuando tengamos una respuesta. |


#-------------------------------------------------------------------------------------------
Scenario Outline: Nueva respuesta

    Given existe una nueva respuesta de "<remitente>" en la solicitud "<ticket>"
    When el usuario abre la solicitud
    Then el sistema muestra el mensaje "<mensaje>"

    Examples: Datos de entrada y salida
      | remitente     | ticket   | mensaje                                                                                                  |
      | Carla Mendoza | SOP-0012 | ¿Pudiste encontrar tu número de suministro? Si quieres, te llamamos para ayudarte.                       |
      | Luis Paredes  | SOP-0014 | Ya revisamos la página de tu empresa de agua. Intenta entrar de nuevo escribiendo tú mismo la dirección. |
