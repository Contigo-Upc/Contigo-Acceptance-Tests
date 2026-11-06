Feature: US-04 - Selección del segmento de usuario
  Como usuario nuevo
  Deseo indicar mi nivel de experiencia digital al registrarme
  Para que la app adapte el lenguaje y el nivel de apoyo visual

#-------------------------------------------------------------------------------------------
Scenario: Selección de nivel básico

    Given el usuario finalizó su registro
    When selecciona el nivel "básico"
    Then el sistema activa lenguaje sencillo y mayor apoyo visual


#-------------------------------------------------------------------------------------------
Scenario: Cambio posterior de nivel

    Given el usuario ya tiene un nivel configurado
    When lo modifica desde "Configuración"
    Then el sistema ajusta el tipo de explicaciones desde ese momento


#-------------------------------------------------------------------------------------------
Scenario: Usuario omite la selección

    Given el usuario no selecciona ningún nivel durante el registro
    When finaliza el proceso
    Then el sistema asigna por defecto el nivel "básico"
