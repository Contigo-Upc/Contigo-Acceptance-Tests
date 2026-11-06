Feature: US-24 - Sugerencias proactivas del asistente
  Como usuario
  Deseo que el asistente me avise si detecta un posible error antes de continuar
  Para evitar equivocaciones

#-------------------------------------------------------------------------------------------
Scenario: Detección de dato inusual

    Given el usuario ingresó un dato inusual (ej. un monto muy alto)
    When intenta avanzar
    Then el asistente pregunta si desea confirmar el dato antes de continuar


#-------------------------------------------------------------------------------------------
Scenario: Usuario confirma el dato

    Given el asistente mostró la advertencia
    When el usuario confirma que el dato es correcto
    Then el sistema permite continuar sin cambios


#-------------------------------------------------------------------------------------------
Scenario: Usuario corrige el dato

    Given el asistente mostró la advertencia
    When el usuario decide corregir el valor
    Then el sistema actualiza el campo y continúa el proceso
