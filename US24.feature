Feature: US-24 - Sugerencias proactivas del asistente
  Como usuario
  Deseo que el asistente me avise si detecta un posible error antes de continuar
  Para evitar equivocaciones

#-------------------------------------------------------------------------------------------
Scenario Outline: Detección de dato inusual

    Given el usuario ingresó el monto inusual "<monto>" en el trámite "<tramite>"
    When intenta avanzar
    Then el asistente pregunta "¿Es correcto este monto?" con el mensaje "<mensaje>"

    Examples: Datos de entrada y salida
      | tramite          | monto     | mensaje                                                                                                                              |
      | Pago de luz      | S/ 950.00 | S/ 950.00 es más alto de lo habitual para este trámite (suele ser alrededor de S/ 90.00). Revisa que esté bien copiado de tu recibo. |
      | Pago de agua     | S/ 120.50 | S/ 120.50 es más alto de lo habitual para este trámite (suele ser alrededor de S/ 45.00). Revisa que esté bien copiado de tu recibo. |
      | Pago de internet | S/ 299.90 | S/ 299.90 es más alto de lo habitual para este trámite (suele ser alrededor de S/ 80.00). Revisa que esté bien copiado de tu recibo. |


#-------------------------------------------------------------------------------------------
Scenario Outline: Usuario confirma el dato

    Given el asistente mostró la advertencia por el monto "<monto>" en el trámite "<tramite>"
    When el usuario confirma que el dato es correcto con "Sí, es correcto"
    Then el sistema permite continuar sin cambios al paso "Revisa tus datos" con el monto "<monto>"

    Examples: Datos de entrada
      | tramite       | monto     |
      | Pago de luz   | S/ 950.00 |
      | Pago de cable | S/ 185.00 |


#-------------------------------------------------------------------------------------------
Scenario Outline: Usuario corrige el dato

    Given el asistente mostró la advertencia por el monto "<monto_ingresado>"
    When el usuario toca "Corregir" y cambia el valor por "<monto_corregido>"
    Then el sistema actualiza el campo y continúa al paso "Revisa tus datos" con el monto "<monto_corregido>"

    Examples: Datos de entrada y salida
      | monto_ingresado | monto_corregido |
      | S/ 950.00       | S/ 95.00        |
      | S/ 8540.00      | S/ 85.40        |
      | S/ 120.50       | S/ 42.50        |
