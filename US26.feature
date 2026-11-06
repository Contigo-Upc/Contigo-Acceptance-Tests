Feature: US-26 - Indicador de progreso del trámite
  Como usuario con poca experiencia digital
  Deseo ver en qué paso me encuentro y cuántos faltan
  Para no sentir que estoy perdido durante el proceso

#-------------------------------------------------------------------------------------------
Scenario: Visualización del indicador

    Given el usuario inició un trámite de varios pasos
    When avanza a cualquier etapa del proceso
    Then el sistema muestra de forma permanente el indicador con el formato "Paso 2 de 5"


#-------------------------------------------------------------------------------------------
Scenario: Actualización al avanzar

    Given el usuario completó el paso actual
    When presiona "Siguiente"
    Then el indicador se actualiza mostrando la nueva posición dentro del proceso


#-------------------------------------------------------------------------------------------
Scenario: Actualización al retroceder

    Given el usuario regresa a una etapa anterior
    When el sistema muestra el paso previo
    Then el indicador refleja nuevamente esa posición sin alterar el total de pasos
