Feature: US-33 - Prevención de pago duplicado (Error humano)
  Como usuario inseguro
  Deseo que la app me alerte si estoy a punto de pagar un recibo que ya fue cancelado
  Para no perder mi dinero por una confusión

#-------------------------------------------------------------------------------------------
Scenario: Alerta de recibo pagado

    Given el usuario ingresa un número de suministro que ya no tiene deuda
    When intenta continuar al paso de pago
    Then el sistema bloquea la acción y muestra una alerta indicando: "Este recibo ya se encuentra pagado"


#-------------------------------------------------------------------------------------------
Scenario: Detección de pago en proceso

    Given el usuario pagó un recibo hace 5 minutos y vuelve a intentarlo
    When el sistema detecta que el pago aún se está procesando
    Then muestra un mensaje aconsejando esperar la confirmación antes de volver a intentar


#-------------------------------------------------------------------------------------------
Scenario: Redirección al historial

    Given se detecta un recibo sin deuda
    When se muestra el aviso
    Then el sistema ofrece un botón para "Ver comprobante de pago" redirigiendo al historial
