Feature: US-04 - Selección del segmento de usuario
  Como usuario nuevo
  Deseo indicar mi nivel de experiencia digital al registrarme
  Para que la app adapte el lenguaje y el nivel de apoyo visual

#-------------------------------------------------------------------------------------------
Scenario Outline: Selección de nivel básico

    Given el usuario "<nombre>" finalizó su registro
    When selecciona el nivel "básico"
    Then el sistema activa lenguaje sencillo y mayor apoyo visual y muestra "<mensaje>"

    Examples: Datos de entrada y salida
      | nombre         | mensaje                                                                             |
      | Rosa Huamán    | ¡Listo, Rosa! Te explicaremos cada paso con palabras sencillas y dibujos grandes.   |
      | Carlos Mendoza | ¡Listo, Carlos! Te explicaremos cada paso con palabras sencillas y dibujos grandes. |


#-------------------------------------------------------------------------------------------
Scenario Outline: Cambio posterior de nivel

    Given el usuario tiene configurado el nivel "<nivel_actual>"
    When lo cambia a "<nivel_nuevo>" desde "Configuración"
    Then el sistema ajusta el tipo de explicaciones desde ese momento y muestra "<mensaje>"

    Examples: Datos de entrada y salida
      | nivel_actual | nivel_nuevo | mensaje                                                        |
      | básico       | intermedio  | Listo. Desde ahora verás explicaciones más cortas.             |
      | intermedio   | avanzado    | Listo. Desde ahora verás solo los pasos principales.           |
      | avanzado     | básico      | Listo. Desde ahora verás cada paso con más detalle e imágenes. |


#-------------------------------------------------------------------------------------------
Scenario Outline: Usuario omite la selección

    Given el usuario no selecciona ningún nivel durante el registro
    When finaliza el proceso con el botón "<boton>"
    Then el sistema asigna por defecto el nivel "básico" y muestra "<mensaje>"

    Examples: Datos de entrada y salida
      | boton           | mensaje                                                                     |
      | Omitir          | Usaremos el nivel básico. Puedes cambiarlo cuando quieras en Configuración. |
      | Decidir después | Usaremos el nivel básico. Puedes cambiarlo cuando quieras en Configuración. |
