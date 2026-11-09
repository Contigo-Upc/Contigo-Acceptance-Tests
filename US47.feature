Feature: US-47 - Consultar estado del trámite
  Como usuario
  Deseo conocer el estado actual de un trámite
  Para saber si está pendiente, en proceso o completado

#-------------------------------------------------------------------------------------------
Scenario Outline: Trámite pendiente

    Given el trámite "<tramite>" todavía no finalizó y quedó en el "<paso>"
    When el usuario consulta su historial
    Then el sistema muestra el estado "Pendiente"

    Examples: Datos de entrada
      | tramite            | paso        |
      | Pago de luz        | Paso 3 de 7 |
      | Renovación de DNI  | Paso 5 de 7 |
      | Consulta de deudas | Paso 2 de 6 |


#-------------------------------------------------------------------------------------------
Scenario Outline: Trámite en proceso

    Given el trámite "<tramite>" está siendo procesado desde el "<fecha>"
    When el usuario revisa su estado
    Then el sistema muestra "En proceso"

    Examples: Datos de entrada
      | tramite       | fecha      |
      | Pago de agua  | 24/11/2026 |
      | Pago de cable | 01/12/2026 |


#-------------------------------------------------------------------------------------------
Scenario Outline: Trámite completado

    Given el trámite "<tramite>" terminó correctamente el "<fecha>"
    When el usuario consulta su estado
    Then el sistema muestra "Completado"

    Examples: Datos de entrada
      | tramite           | fecha      |
      | Pago de internet  | 10/11/2026 |
      | Renovación de DNI | 19/11/2026 |
