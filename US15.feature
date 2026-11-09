Feature: US-15 - Modo de práctica con datos simulados
  Como usuario inseguro
  Deseo practicar un trámite con datos de prueba
  Para perder el miedo antes de hacerlo con datos reales

#-------------------------------------------------------------------------------------------
Scenario Outline: Práctica completada con éxito

    Given el usuario selecciona "Practicar con datos de ejemplo" en el trámite "<tramite>"
    When completa el flujo con el dato simulado "<dato_simulado>"
    Then el sistema muestra el mensaje "<mensaje>" sin realizar ninguna operación real

    Examples: Datos de entrada y salida
      | tramite           | dato_simulado | mensaje                                                                                         |
      | Pago de luz       | 1234567       | Practicaste todo el recorrido. Cuando quieras hacer el trámite de verdad, empieza la guía real. |
      | Pago de agua      | 7654321       | Practicaste todo el recorrido. Cuando quieras hacer el trámite de verdad, empieza la guía real. |
      | Renovación de DNI | 12345678      | Practicaste todo el recorrido. Cuando quieras hacer el trámite de verdad, empieza la guía real. |


#-------------------------------------------------------------------------------------------
Scenario Outline: Error intencional durante la práctica

    Given el usuario escribe "<dato_incorrecto>" a propósito en el campo "<campo>" durante la práctica
    When el sistema lo detecta
    Then muestra el mensaje "<mensaje>", el mismo que mostraría en un trámite real

    Examples: Datos de entrada y salida
      | campo                | dato_incorrecto | mensaje                                           |
      | Número de suministro | 12345           | Escribe 7 u 8 números, sin espacios ni letras.    |
      | Monto a pagar (S/)   | ochenta         | Escribe el monto solo con números. Ejemplo: 85.50 |
      | Número de DNI        | 1234ABCD        | Escribe los 8 números de tu DNI, sin espacios.    |


#-------------------------------------------------------------------------------------------
Scenario: Salida antes de terminar

    Given el usuario decide salir de la práctica antes de finalizar
    When presiona "Salir"
    Then el sistema cierra el modo práctica sin guardar ningún dato
