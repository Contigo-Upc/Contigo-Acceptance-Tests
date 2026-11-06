Feature: US-35 - Recuperación de datos tras error de conexión
  Como usuario
  Deseo que la aplicación guarde mi progreso si pierdo la conexión a Internet
  Para no tener que reiniciar el trámite desde cero cuando vuelva la señal

#-------------------------------------------------------------------------------------------
Scenario: Pérdida de conexión

    Given el usuario está en el paso 3 de un trámite
    When se pierde la conexión a internet
    Then el sistema muestra un mensaje indicando "Sin conexión" y guarda localmente los datos ingresados


#-------------------------------------------------------------------------------------------
Scenario: Reconexión y continuación

    Given el sistema guardó el progreso de un trámite por falta de internet
    When el usuario recupera la conexión
    Then la app le permite reanudar el trámite exactamente en el paso donde se quedó


#-------------------------------------------------------------------------------------------
Scenario: Abandono de trámite offline

    Given el usuario decide cerrar la app tras perder conexión
    When vuelva a abrir la app con internet
    Then el sistema le preguntará si desea recuperar el trámite pendiente o descartarlo
