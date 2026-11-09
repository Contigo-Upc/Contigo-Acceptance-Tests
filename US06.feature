Feature: US-06 - Menú principal con íconos
  Como usuario
  Deseo ver los trámites disponibles como íconos grandes y claros
  Para identificar rápidamente lo que necesito

#-------------------------------------------------------------------------------------------
Scenario Outline: Visualización del menú

    Given el usuario ingresa a la app
    When llega a la pantalla principal
    Then el sistema muestra el trámite "<tramite>" con ícono, imagen y el texto breve "<texto>"

    Examples: Datos de salida
      | tramite                 | texto                              |
      | Pago de servicios       | Luz, agua e internet, paso a paso. |
      | Consulta de trámites    | Entérate qué necesitas hacer.      |
      | Requisitos y documentos | Revisa qué necesitas antes.        |
      | Resolución de errores   | Te explicamos cómo seguir.         |


#-------------------------------------------------------------------------------------------
Scenario Outline: Menú sin conexión

    Given el usuario no tiene conexión a internet
    When abre la app
    Then el sistema muestra solo los trámites disponibles sin conexión, como "<tramite>", con el aviso "<aviso>"

    Examples: Datos de salida
      | tramite                 | aviso                                                                          |
      | Requisitos y documentos | Estás sin internet. Te mostramos los trámites que puedes revisar sin conexión. |
      | Seguimiento paso a paso | Estás sin internet. Te mostramos los trámites que puedes revisar sin conexión. |
      | Resolución de errores   | Estás sin internet. Te mostramos los trámites que puedes revisar sin conexión. |


#-------------------------------------------------------------------------------------------
Scenario Outline: Modo accesibilidad activado

    Given el usuario activó el modo de accesibilidad con el tamaño de letra "<tamano_letra>"
    When visualiza el menú principal
    Then los íconos se muestran con la etiqueta "<etiqueta>" en texto ampliado

    Examples: Datos de entrada y salida
      | tamano_letra | etiqueta                  |
      | Grande       | Pago de servicios         |
      | Muy grande   | Consulta de trámites      |
      | Muy grande   | Identificación de recibos |
