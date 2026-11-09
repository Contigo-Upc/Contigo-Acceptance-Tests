Feature: US-33 - Prevención de pago duplicado (Error humano)
  Como usuario inseguro
  Deseo que la app me alerte si estoy a punto de pagar un recibo que ya fue cancelado
  Para no perder mi dinero por una confusión

#-------------------------------------------------------------------------------------------
Scenario Outline: Alerta de recibo pagado

    Given el "<recibo>" con número "<numero>" ya figura como "Pagado" en "Mis recibos"
    When el usuario ingresa el número "<numero>" e intenta continuar al paso de pago
    Then el sistema bloquea la acción y muestra la alerta "<alerta>"

    Examples: Datos de entrada y salida
      | recibo             | numero   | alerta                             |
      | Recibo de luz      | 2468135  | Este recibo ya se encuentra pagado |
      | Recibo de agua     | 7531902  | Este recibo ya se encuentra pagado |
      | Recibo de internet | 56781234 | Este recibo ya se encuentra pagado |


#-------------------------------------------------------------------------------------------
Scenario Outline: Detección de pago en proceso

    Given el usuario pagó su "<recibo>" de "<monto>" hace <minutos> minutos y vuelve a intentarlo
    When el sistema detecta que el recibo aún está "En proceso"
    Then muestra el mensaje "<mensaje>"

    Examples: Datos de entrada y salida
      | recibo          | monto    | minutos | mensaje                                                                                          |
      | Recibo de luz   | S/ 85.40 | 5       | Aún no confirmas este pago. Revisa en tu banco si el pago se hizo y márcalo cuando lo confirmes. |
      | Recibo de cable | S/ 59.90 | 10      | Aún no confirmas este pago. Revisa en tu banco si el pago se hizo y márcalo cuando lo confirmes. |


#-------------------------------------------------------------------------------------------
Scenario Outline: Redirección al historial

    Given se detecta que el "<recibo>" con número "<numero>" no tiene deuda
    When se muestra el aviso "Este recibo ya se encuentra pagado"
    Then el sistema ofrece el botón "Ver comprobante de pago" que lo lleva a "Mis recibos", donde el recibo de "<monto>" figura como "Pagado"

    Examples: Datos de entrada y salida
      | recibo         | numero  | monto    |
      | Recibo de luz  | 2468135 | S/ 85.40 |
      | Recibo de agua | 7531902 | S/ 42.60 |
