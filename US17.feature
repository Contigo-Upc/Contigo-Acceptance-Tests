Feature: US-17 - Corrección manual de datos extraídos
  Como usuario
  Deseo corregir un dato mal leído por la app
  Para asegurarme de que la información sea correcta

#-------------------------------------------------------------------------------------------
Scenario Outline: Corrección exitosa

    Given el sistema leyó "<valor_leido>" en el campo "<campo>" del recibo
    When el usuario lo detecta como incorrecto y lo cambia por "<valor_corregido>"
    Then el sistema guarda el valor corregido "<valor_corregido>" y muestra "¡Guardamos tu recibo!"

    Examples: Datos de entrada y salida
      | campo                | valor_leido | valor_corregido |
      | Número de suministro | 1284567     | 1234567         |
      | Monto a pagar (S/)   | 85.10       | 85.40           |
      | Fecha de vencimiento | 25/11/2026  | 28/11/2026      |


#-------------------------------------------------------------------------------------------
Scenario Outline: Campo dejado vacío

    Given el usuario borra el campo obligatorio "<campo>" al corregirlo
    When presiona "Guardar recibo"
    Then el sistema muestra el mensaje "<mensaje>" y no avanza hasta que lo complete

    Examples: Datos de salida
      | campo                | mensaje                                         |
      | Número de suministro | Escribe el número para continuar.               |
      | Monto a pagar (S/)   | Escribe el monto para continuar.                |
      | Fecha de vencimiento | Escribe la fecha para añadirla a tu calendario. |


#-------------------------------------------------------------------------------------------
Scenario Outline: Corrección de varios campos

    Given el usuario detecta que el número, el monto y la fecha de su recibo de "<servicio>" están mal leídos
    When los corrige a "<numero>", "<monto>" y "<fecha_vencimiento>" y presiona "Guardar recibo"
    Then el sistema guarda todos los cambios y muestra el mensaje "<mensaje>"

    Examples: Datos de entrada y salida
      | servicio | numero  | monto | fecha_vencimiento | mensaje                                                                                                                  |
      | luz      | 3058214 | 85.40 | 28/11/2026        | Guardamos el vencimiento de tu recibo de luz para el 28 de noviembre de 2026. Te avisaremos 2 días antes y el mismo día. |
      | agua     | 7712046 | 42.60 | 03/12/2026        | Guardamos el vencimiento de tu recibo de agua para el 3 de diciembre de 2026. Te avisaremos 2 días antes y el mismo día. |
