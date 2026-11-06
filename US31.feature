Feature: US-31 - Mensajes de error en lenguaje sencillo
  Como adulto mayor con conocimientos digitales básicos
  Deseo leer los mensajes de error en palabras comunes y sin códigos técnicos
  Para entender rápidamente qué salió mal

#-------------------------------------------------------------------------------------------
Scenario: Error interno del sistema

    Given ocurre un error técnico en la plataforma
    When la aplicación falla en cargar el trámite
    Then el sistema muestra un mensaje amigable como "Tuvimos un problema temporal, por favor inténtalo en unos minutos" en lugar de un código de error como "Error 500"


#-------------------------------------------------------------------------------------------
Scenario: Error por información incorrecta

    Given el usuario ingresa un dato erróneo
    When el sistema lo detecta
    Then muestra un mensaje claro como "El número de DNI debe tener 8 números" en lugar de "Data type mismatch"


#-------------------------------------------------------------------------------------------
Scenario: Apoyo visual en el error

    Given se muestra un mensaje de error
    When el usuario lo visualiza
    Then el mensaje está acompañado de un ícono de advertencia claro (como un triángulo amarillo o exclamación)
