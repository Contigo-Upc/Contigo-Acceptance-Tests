Feature: US-36 - Registro de fecha de vencimiento
  Como usuario
  Deseo que la app registre la fecha de vencimiento de un recibo
  Para que no se me olvide pagarlo

#-------------------------------------------------------------------------------------------
Scenario Outline: Registro automático

    Given el usuario escaneó su "<recibo>" con fecha de vencimiento "<fecha_vencimiento>"
    When el sistema procesa el documento
    Then guarda la fecha en el calendario de la app y muestra el mensaje "<mensaje>"

    Examples: Datos de entrada y salida
      | recibo             | fecha_vencimiento | mensaje                                                                                                                      |
      | Recibo de luz      | 14/11/2026        | Guardamos el vencimiento de tu recibo de luz para el 14 de noviembre de 2026. Te avisaremos 2 días antes y el mismo día.     |
      | Recibo de agua     | 20/11/2026        | Guardamos el vencimiento de tu recibo de agua para el 20 de noviembre de 2026. Te avisaremos 2 días antes y el mismo día.    |
      | Recibo de internet | 02/12/2026        | Guardamos el vencimiento de tu recibo de internet para el 2 de diciembre de 2026. Te avisaremos 2 días antes y el mismo día. |


#-------------------------------------------------------------------------------------------
Scenario Outline: Registro manual

    Given el sistema no detectó automáticamente la fecha de vencimiento del "<recibo>"
    When el usuario escribe la fecha "<fecha_ingresada>" y presiona "Guardar en calendario"
    Then el sistema la guarda en el calendario y muestra el mensaje "<mensaje>"

    Examples: Datos de entrada y salida
      | recibo             | fecha_ingresada | mensaje                                                   |
      | Recibo de agua     | 18/11/2026      | Guardamos el vencimiento para el 18 de noviembre de 2026. |
      | Recibo de cable    | 25/11/2026      | Guardamos el vencimiento para el 25 de noviembre de 2026. |
      | Recibo de internet | 05/12/2026      | Guardamos el vencimiento para el 5 de diciembre de 2026.  |


#-------------------------------------------------------------------------------------------
Scenario Outline: Fecha no detectada

    Given el usuario escaneó su "<recibo>" de "<monto>" y el recibo no tiene una fecha de vencimiento visible
    When el sistema procesa el documento
    Then muestra el aviso "No pudimos detectar la fecha" y le solicita escribirla en el campo "Fecha de vencimiento"

    Examples: Datos de entrada
      | recibo          | monto    |
      | Recibo de luz   | S/ 85.40 |
      | Recibo de agua  | S/ 42.60 |
      | Recibo de cable | S/ 59.90 |
