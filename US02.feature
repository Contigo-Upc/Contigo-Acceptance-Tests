Feature: US-02 - Registro asistido por voz
  Como adulto mayor
  Deseo poder dictar mis datos de registro en lugar de escribirlos
  Para no tener dificultades con el teclado

#-------------------------------------------------------------------------------------------
Scenario: Registro por voz exitoso

    Given el usuario selecciona "Registrarme hablando"
    When dicta su nombre y edad
    Then el sistema transcribe y completa automáticamente los campos


#-------------------------------------------------------------------------------------------
Scenario: Audio no reconocido

    Given el usuario dicta sus datos en un ambiente con mucho ruido
    When el sistema no logra transcribir correctamente
    Then muestra un mensaje pidiendo repetir el dictado en un lugar más silencioso


#-------------------------------------------------------------------------------------------
Scenario: Corrección de dato mal transcrito

    Given el sistema transcribió mal el nombre del usuario
    When el usuario edita manualmente el campo antes de confirmar
    Then el sistema guarda el dato corregido
