Feature: US-02 - Registro asistido por voz
  Como adulto mayor
  Deseo poder dictar mis datos de registro en lugar de escribirlos
  Para no tener dificultades con el teclado

#-------------------------------------------------------------------------------------------
Scenario Outline: Registro por voz exitoso

    Given el usuario selecciona "Registro por voz"
    When dicta "<dictado>"
    Then el sistema completa el nombre con "<nombre>" y la edad con "<edad>"

    Examples: Datos de entrada y salida
      | dictado                                    | nombre         | edad |
      | Me llamo Rosa Huamán y tengo 68 años       | Rosa Huamán    | 68   |
      | Mi nombre es Carlos Mendoza, tengo 74 años | Carlos Mendoza | 74   |
      | Soy Teresa Quispe y tengo 81 años          | Teresa Quispe  | 81   |


#-------------------------------------------------------------------------------------------
Scenario Outline: Audio no reconocido

    Given el usuario dicta sus datos en un ambiente con "<ruido>"
    When el sistema no logra transcribir correctamente
    Then muestra el mensaje "<mensaje>" y pide "<indicacion>"

    Examples: Datos de entrada y salida
      | ruido                        | mensaje                       | indicacion                                                                  |
      | mucho tráfico en la calle    | Busca un lugar más silencioso | Vuelve a intentarlo hablando con calma, o escribe tus datos con el teclado. |
      | la televisión a todo volumen | Busca un lugar más silencioso | Vuelve a intentarlo hablando con calma, o escribe tus datos con el teclado. |
      | una reunión familiar         | Busca un lugar más silencioso | Vuelve a intentarlo hablando con calma, o escribe tus datos con el teclado. |


#-------------------------------------------------------------------------------------------
Scenario Outline: Corrección de dato mal transcrito

    Given el sistema transcribió el nombre del usuario como "<nombre_transcrito>"
    When el usuario edita manualmente el campo a "<nombre_corregido>" antes de confirmar
    Then el sistema guarda el nombre "<nombre_corregido>"

    Examples: Datos de entrada
      | nombre_transcrito | nombre_corregido |
      | Rosa Guamán       | Rosa Huamán      |
      | Carlos Mendosa    | Carlos Mendoza   |
      | Teresa Kispe      | Teresa Quispe    |
