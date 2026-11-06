Feature: US-32 - Identificación visual del campo con error
  Como usuario
  Deseo que la aplicación resalte claramente y en colores el lugar exacto donde me equivoqué
  Para poder ubicarlo y corregirlo rápidamente

#-------------------------------------------------------------------------------------------
Scenario: Resaltado visual

    Given el usuario omitió un campo obligatorio
    When presiona "Siguiente"
    Then el sistema marca el borde del campo faltante en color rojo y añade un texto de ayuda debajo


#-------------------------------------------------------------------------------------------
Scenario: Desplazamiento automático

    Given el formulario es largo y el error está en la parte superior
    When el usuario intenta avanzar
    Then el sistema desliza la pantalla automáticamente hasta ubicar el campo con el error a la vista


#-------------------------------------------------------------------------------------------
Scenario: Múltiples errores

    Given el usuario cometió errores en más de un campo
    When intenta confirmar
    Then el sistema resalta todos los campos erróneos simultáneamente
