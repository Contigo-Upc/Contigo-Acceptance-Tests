Feature: US-45 - Navegación completa por voz
  Como persona con baja alfabetización digital
  Deseo controlar la app usando solo comandos de voz
  Para no depender de leer o escribir

#-------------------------------------------------------------------------------------------
Scenario: Comando ejecutado correctamente

    Given el usuario activa el "Modo voz"
    When dice "ir al inicio" o "siguiente paso"
    Then el sistema ejecuta la acción correspondiente


#-------------------------------------------------------------------------------------------
Scenario: Comando no reconocido

    Given el sistema no entiende el comando
    When el usuario lo repite
    Then el sistema pide que lo diga de otra manera


#-------------------------------------------------------------------------------------------
Scenario: Combinación de voz y táctil

    Given el usuario usa voz y también toca la pantalla
    When alterna entre ambos métodos
    Then el sistema responde correctamente a ambos
