Feature: US-27 - Tiempo estimado del trámite
  Como usuario que posterga sus gestiones
  Deseo saber cuánto tiempo me tomará un trámite antes de empezarlo
  Para decidir si lo hago en ese momento

#-------------------------------------------------------------------------------------------
Scenario Outline: Visualización del tiempo estimado

    Given el usuario selecciona el trámite "<tramite>"
    When el sistema muestra la pantalla de inicio
    Then se indica el tiempo aproximado "<tiempo>"

    Examples: Datos de entrada y salida
      | tramite            | tiempo         |
      | Pago de luz        | Unos 6 minutos |
      | Pago de internet   | Unos 5 minutos |
      | Renovación de DNI  | Unos 8 minutos |
      | Consulta de deudas | Unos 4 minutos |


#-------------------------------------------------------------------------------------------
Scenario Outline: Tiempo restante durante el proceso

    Given el usuario avanzó a la mitad del trámite "<tramite>"
    When visualiza el indicador de progreso "<indicador>"
    Then el sistema muestra el tiempo aproximado que falta "<tiempo_restante>"

    Examples: Datos de entrada y salida
      | tramite            | indicador   | tiempo_restante       |
      | Pago de luz        | Paso 4 de 7 | Faltan unos 3 minutos |
      | Pago de internet   | Paso 4 de 7 | Faltan unos 2 minutos |
      | Consulta de deudas | Paso 3 de 6 | Faltan unos 2 minutos |


#-------------------------------------------------------------------------------------------
Scenario Outline: Trámite que excede el tiempo estimado

    Given el usuario tardó "<tiempo_usado>" en el trámite "<tramite>", más que los "<tiempo_estimado>" previstos
    When continúa en el proceso
    Then el sistema deja de mostrar el estimado y mantiene únicamente el indicador "<indicador>"

    Examples: Datos de entrada y salida
      | tramite           | tiempo_estimado | tiempo_usado | indicador   |
      | Pago de luz       | 6 minutos       | 9 minutos    | Paso 5 de 7 |
      | Renovación de DNI | 8 minutos       | 12 minutos   | Paso 6 de 7 |
