Feature: US-35 - Recuperación de datos tras error de conexión
  Como usuario
  Deseo que la aplicación guarde mi progreso si pierdo la conexión a Internet
  Para no tener que reiniciar el trámite desde cero cuando vuelva la señal

#-------------------------------------------------------------------------------------------
Scenario Outline: Pérdida de conexión

    Given el usuario está en el paso <paso> de <total> del trámite "<tramite>" y escribió "<dato_ingresado>" en el campo "<campo>"
    When se pierde la conexión a internet
    Then el sistema muestra el mensaje "Sin conexión" y guarda localmente el dato "<dato_ingresado>"

    Examples: Datos de entrada
      | tramite            | paso | total | campo                | dato_ingresado |
      | Pago de luz        | 5    | 7     | Número de suministro | 2468135        |
      | Renovación de DNI  | 5    | 7     | Número de DNI        | 45781236       |
      | Consulta de deudas | 4    | 6     | Número de DNI        | 70215538       |


#-------------------------------------------------------------------------------------------
Scenario Outline: Reconexión y continuación

    Given el sistema guardó el progreso del trámite "<tramite>" en el paso <paso> de <total> por falta de internet
    When el usuario recupera la conexión
    Then la app muestra el botón "Continuar donde lo dejaste (paso <paso> de <total>)" y reanuda el trámite exactamente en ese paso

    Examples: Datos de entrada y salida
      | tramite            | paso | total |
      | Pago de luz        | 5    | 7     |
      | Pago de internet   | 3    | 7     |
      | Consulta de deudas | 4    | 6     |


#-------------------------------------------------------------------------------------------
Scenario Outline: Abandono de trámite offline

    Given el usuario cerró la app en el paso <paso> del trámite "<tramite>" tras perder la conexión
    When vuelva a abrir la app con internet
    Then el sistema le pregunta si desea recuperar el trámite con el botón "Continuar con el paso <paso>" o descartarlo con el botón "Descartar este trámite"

    Examples: Datos de entrada y salida
      | tramite           | paso |
      | Pago de luz       | 5    |
      | Renovación de DNI | 3    |
      | Pago de agua      | 2    |
