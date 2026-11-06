Feature: US-15 - Modo de práctica con datos simulados
  Como usuario inseguro
  Deseo practicar un trámite con datos de prueba
  Para perder el miedo antes de hacerlo con datos reales

#-------------------------------------------------------------------------------------------
Scenario: Práctica completada con éxito

    Given el usuario selecciona "Practicar este trámite"
    When completa el flujo con datos simulados
    Then el sistema indica que fue una simulación y no se realizó ninguna operación real


#-------------------------------------------------------------------------------------------
Scenario: Error intencional durante la práctica

    Given el usuario ingresa un dato incorrecto a propósito durante la práctica
    When el sistema lo detecta
    Then muestra la misma orientación que mostraría en un trámite real


#-------------------------------------------------------------------------------------------
Scenario: Salida antes de terminar

    Given el usuario decide salir de la práctica antes de finalizar
    When presiona "Salir"
    Then el sistema cierra el modo práctica sin guardar ningún dato
