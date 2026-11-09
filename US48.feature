Feature: US-48 - Continuar trámite pendiente
  Como usuario
  Deseo continuar un trámite pendiente desde mi historial
  Para no tener que comenzar nuevamente desde cero

#-------------------------------------------------------------------------------------------
Scenario Outline: Continuar trámite

    Given existe el trámite pendiente "<tramite>" guardado en el "<paso>"
    When el usuario selecciona "<boton>"
    Then el sistema lo lleva al último paso guardado "<titulo_paso>"

    Examples: Datos de entrada y salida
      | tramite           | paso        | boton                   | titulo_paso                            |
      | Pago de luz       | Paso 3 de 7 | Continuar con el paso 3 | Entra a la página de tu empresa de luz |
      | Renovación de DNI | Paso 2 de 7 | Continuar con el paso 2 | Paga la tasa del trámite               |
      | Pago de agua      | Paso 5 de 7 | Continuar con el paso 5 | Anota tus datos                        |


#-------------------------------------------------------------------------------------------
Scenario Outline: Datos conservados

    Given el usuario ingresó "<valor>" en el campo "<campo>" del trámite "<tramite>"
    When continúa el trámite
    Then el sistema mantiene el valor "<valor>" en el campo "<campo>"

    Examples: Datos de entrada y salida
      | tramite           | campo                | valor    |
      | Pago de luz       | Número de suministro | 4815162  |
      | Pago de luz       | Monto a pagar (S/)   | 92.40    |
      | Renovación de DNI | Número de DNI        | 45781236 |
      | Pago de internet  | Número de contrato   | 30561278 |


#-------------------------------------------------------------------------------------------
Scenario Outline: Trámite completado

    Given el trámite "<tramite>" ya fue completado el "<fecha>"
    When el usuario consulta su historial
    Then el sistema no muestra la opción "Continuar" para ese trámite

    Examples: Datos de entrada
      | tramite            | fecha      |
      | Pago de cable      | 06/11/2026 |
      | Consulta de deudas | 15/11/2026 |
