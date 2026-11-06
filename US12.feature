Feature: US-12 - Repetición de la instrucción en audio
  Como adulto mayor
  Deseo escuchar la instrucción en voz alta
  Para comprenderla mejor si no puedo leer bien el texto

#-------------------------------------------------------------------------------------------
Scenario: Reproducción exitosa

    Given el usuario está en un paso del trámite
    When toca el ícono de altavoz
    Then el sistema lee en voz alta la instrucción de esa etapa


#-------------------------------------------------------------------------------------------
Scenario: Pausar el audio

    Given el audio se está reproduciendo
    When el usuario toca "Pausar"
    Then el sistema detiene la reproducción en ese punto


#-------------------------------------------------------------------------------------------
Scenario: Repetición en otro paso

    Given el usuario avanzó a una nueva etapa
    When toca nuevamente el ícono de altavoz
    Then el sistema reproduce el audio correspondiente a esa etapa
