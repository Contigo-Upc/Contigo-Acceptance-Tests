Feature: US-27 - Tiempo estimado del trámite
  Como usuario que posterga sus gestiones
  Deseo saber cuánto tiempo me tomará un trámite antes de empezarlo
  Para decidir si lo hago en ese momento

#-------------------------------------------------------------------------------------------
Scenario: Visualización del tiempo estimado

    Given el usuario selecciona un trámite
    When el sistema muestra la pantalla de inicio
    Then se indica el tiempo aproximado que toma completarlo


#-------------------------------------------------------------------------------------------
Scenario: Tiempo restante durante el proceso

    Given el usuario avanzó a la mitad del trámite
    When visualiza el indicador de progreso
    Then el sistema muestra el tiempo aproximado que falta para terminar


#-------------------------------------------------------------------------------------------
Scenario: Trámite que excede el tiempo estimado

    Given el usuario tardó más del tiempo previsto
    When continúa en el proceso
    Then el sistema deja de mostrar el estimado y mantiene únicamente el indicador de pasos
