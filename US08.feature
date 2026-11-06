Feature: US-08 - Consulta de requisitos antes de iniciar
  Como usuario
  Deseo ver qué documentos necesito antes de empezar un trámite
  Para no interrumpir el proceso a la mitad

#-------------------------------------------------------------------------------------------
Scenario: Visualización de requisitos

    Given el usuario selecciona un trámite
    When el sistema muestra la pantalla de inicio
    Then se listan de forma visual los documentos o datos necesarios


#-------------------------------------------------------------------------------------------
Scenario: Trámite sin requisitos adicionales

    Given el trámite seleccionado no requiere documentos previos
    When el usuario ingresa a la pantalla de inicio
    Then el sistema indica que puede iniciar directamente


#-------------------------------------------------------------------------------------------
Scenario: Usuario no cuenta con un requisito

    Given el usuario no tiene uno de los documentos solicitados
    When toca "No tengo este documento"
    Then el sistema explica cómo obtenerlo o a quién consultar
