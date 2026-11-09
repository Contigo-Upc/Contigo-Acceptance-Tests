Feature: US-12 - Repetición de la instrucción en audio
  Como adulto mayor
  Deseo escuchar la instrucción en voz alta
  Para comprenderla mejor si no puedo leer bien el texto

#-------------------------------------------------------------------------------------------
Scenario Outline: Reproducción exitosa

    Given el usuario está en el paso "<avance>" del trámite "<tramite>"
    When toca el ícono de altavoz "Escuchar este paso"
    Then el sistema muestra "Escuchando..." y lee en voz alta la instrucción que empieza con "<inicio_audio>"

    Examples: Datos de entrada y salida
      | tramite            | avance      | inicio_audio                           |
      | Pago de luz        | Paso 1 de 7 | Paso 1. Ten tu recibo a la mano.       |
      | Pago de agua       | Paso 2 de 7 | Paso 2. Busca tu número de suministro. |
      | Consulta de deudas | Paso 3 de 6 | Paso 3. Escribe tu número de DNI.      |


#-------------------------------------------------------------------------------------------
Scenario: Pausar el audio

    Given el audio se está reproduciendo
    When el usuario toca "Pausar"
    Then el sistema detiene la reproducción en ese punto


#-------------------------------------------------------------------------------------------
Scenario Outline: Repetición en otro paso

    Given el usuario avanzó del paso "<paso_anterior>" al paso "<paso_nuevo>" del trámite "<tramite>"
    When toca nuevamente el ícono de altavoz
    Then el sistema reproduce el audio de esa etapa, que empieza con "<inicio_audio>"

    Examples: Datos de entrada y salida
      | tramite           | paso_anterior | paso_nuevo  | inicio_audio                           |
      | Pago de luz       | Paso 1 de 7   | Paso 2 de 7 | Paso 2. Busca tu número de suministro. |
      | Pago de internet  | Paso 4 de 7   | Paso 5 de 7 | Paso 5. Anota tus datos.               |
      | Renovación de DNI | Paso 5 de 7   | Paso 6 de 7 | Paso 6. Revisa tus datos.              |
