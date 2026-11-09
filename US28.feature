Feature: US-28 - Verificación de datos antes de realizar el trámite
  Como usuario que teme equivocarse
  Deseo revisar todos los datos que reuní durante la guía
  Para tenerlos correctos antes de ingresarlos en la plataforma oficial

#-------------------------------------------------------------------------------------------
Scenario Outline: Visualización del resumen

    Given el usuario completó todos los pasos de la guía "<tramite>"
    When llega a la etapa final "Revisa tus datos"
    Then el sistema muestra un resumen con "<campo>" "<numero>" y "Monto a pagar (S/)" "<monto>"

    Examples: Datos de entrada y salida
      | tramite          | campo                | numero   | monto    |
      | Pago de luz      | Número de suministro | 1234567  | S/ 85.40 |
      | Pago de agua     | Número de suministro | 7654321  | S/ 42.50 |
      | Pago de internet | Número de contrato   | 45678901 | S/ 79.90 |


#-------------------------------------------------------------------------------------------
Scenario Outline: Corrección desde el resumen

    Given el usuario detecta en el resumen que "<campo>" dice "<valor_incorrecto>"
    When toca "Corregir datos"
    Then el sistema lo lleva al paso "Anota tus datos" conservando "<otro_campo>" con "<otro_valor>"

    Examples: Datos de entrada y salida
      | campo                | valor_incorrecto | otro_campo           | otro_valor |
      | Número de suministro | 1234576          | Monto a pagar (S/)   | S/ 85.40   |
      | Monto a pagar (S/)   | S/ 58.40         | Número de suministro | 1234567    |
      | Número de contrato   | 45678910         | Monto a pagar (S/)   | S/ 79.90   |


#-------------------------------------------------------------------------------------------
Scenario Outline: Datos listos para usar

    Given el usuario revisó y validó todos los datos del trámite "<tramite>"
    When presiona "Sí, todo está correcto"
    Then el sistema le permite copiar los datos y le indica dónde continuar: "<donde_continuar>"

    Examples: Datos de entrada y salida
      | tramite           | donde_continuar                                                   |
      | Pago de luz       | Realiza el pago en la app o página oficial de tu empresa.         |
      | Renovación de DNI | Paga la tasa del trámite en el Banco de la Nación o en Págalo.pe. |
