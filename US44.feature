Feature: US-44 - Textos alternativos
  Como usuario con dificultades para identificar elementos gráficos
  Deseo que los elementos visuales importantes cuenten con información alternativa
  Para comprender su función y utilizar la plataforma correctamente

#-------------------------------------------------------------------------------------------
Scenario Outline: Visualización de texto alternativo

    Given el usuario se encuentra en la pantalla "<pantalla>" que contiene "<elemento>"
    When interactúa con dicho elemento
    Then el sistema proporciona la descripción alternativa "<texto_alternativo>"

    Examples: Datos de entrada y salida
      | pantalla          | elemento                         | texto_alternativo                           |
      | Página principal  | la ilustración de la laptop      | Mujer sonriente usando Contigo en su laptop |
      | Página principal  | el ícono de Instagram            | Contigo en Instagram                        |
      | Calendario        | el botón con flecha a la derecha | Mes siguiente                               |
      | Asistente Contigo | el botón de enviar               | Enviar pregunta                             |


#-------------------------------------------------------------------------------------------
Scenario Outline: Elemento visual sin información relevante

    Given existe el elemento decorativo "<elemento>" en la pantalla "<pantalla>"
    When el usuario navega por la interfaz con un lector de pantalla
    Then el lector omite dicho elemento y lee directamente "<contenido_principal>", sin interferir con la comprensión del contenido

    Examples: Datos de entrada y salida
      | elemento                              | pantalla | contenido_principal |
      | ícono de la tarjeta Pago de servicios | Inicio   | Pago de servicios   |
      | logo junto al nombre Contigo          | Inicio   | Contigo             |
      | ilustración del celular               | Registro | Cuéntanos sobre ti  |


#-------------------------------------------------------------------------------------------
Scenario Outline: Comprensión de la función del elemento

    Given el usuario necesita identificar la función del "<elemento>"
    When accede a su información alternativa
    Then escucha "<texto_alternativo>" y comprende que sirve para "<accion>"

    Examples: Datos de entrada y salida
      | elemento                                    | texto_alternativo             | accion                                |
      | ícono del ojo en el campo de contraseña     | Mostrar contraseña            | ver la contraseña que escribió        |
      | botón de tres rayas del menú                | Abrir menú                    | abrir el menú de navegación           |
      | botón ¿Qué es? junto a número de suministro | ¿Qué es número de suministro? | conocer el significado de esa palabra |
