Feature: US-23 - Explicación de un término técnico
  Como usuario
  Deseo tocar una palabra que no entiendo
  Para que me expliquen su significado sin salir del trámite

#-------------------------------------------------------------------------------------------
Scenario Outline: Explicación mostrada

    Given el sistema muestra el término técnico "<termino>" subrayado
    When el usuario lo toca
    Then aparece la explicación breve en lenguaje cotidiano "<explicacion_breve>"

    Examples: Datos de entrada y salida
      | termino              | explicacion_breve                                                   |
      | número de suministro | Es el código que identifica tu casa en la empresa de luz o de agua. |
      | tasa                 | Es el pago que cobra el Estado por hacer un trámite.                |
      | vencimiento          | Es la última fecha para pagar sin multa.                            |
      | comprobante          | Es la prueba de que hiciste un pago o un trámite.                   |


#-------------------------------------------------------------------------------------------
Scenario Outline: Solicitud de mayor detalle

    Given el usuario no entendió la explicación breve de "<termino>"
    When toca "Explicar más"
    Then el sistema amplía la explicación con un ejemplo "<explicacion_ampliada>"

    Examples: Datos de entrada y salida
      | termino              | explicacion_ampliada                                                                                                                  |
      | número de suministro | Aparece en la parte de arriba de tu recibo y tiene 7 u 8 números. Con él, la empresa sabe qué recibo estás pagando. Ejemplo: 1234567. |
      | monto                | En el recibo suele decir «Total a pagar». Cópialo con los decimales. Ejemplo: 85.50.                                                  |
      | duplicado            | Si perdiste tu DNI, pides un duplicado: es el mismo DNI, con tus mismos datos.                                                        |


#-------------------------------------------------------------------------------------------
Scenario Outline: Término sin definición disponible

    Given el término "<termino>" no tiene una explicación registrada
    When el usuario lo toca
    Then el sistema muestra el mensaje "Todavía no tenemos una explicación para esta palabra." y ofrece "Preguntar al asistente"

    Examples: Datos de entrada
      | termino            |
      | Págalo.pe          |
      | agencia autorizada |
      | billetera digital  |
