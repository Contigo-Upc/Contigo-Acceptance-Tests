Feature: US-01 - Registro con datos básicos
  Como usuario nuevo
  Deseo registrarme con mi nombre, edad y celular
  Para empezar a usar CONTIGO de forma personalizada

#-------------------------------------------------------------------------------------------
Scenario: Registro exitoso

    Given el usuario abre la app por primera vez
    When completa el formulario con datos válidos
    Then el sistema crea la cuenta y muestra un mensaje de bienvenida


#-------------------------------------------------------------------------------------------
Scenario: Celular ya registrado

    Given el usuario ingresa un número de celular ya existente en el sistema
    When intenta completar el registro
    Then el sistema muestra un mensaje indicando que ese número ya tiene una cuenta


#-------------------------------------------------------------------------------------------
Scenario: Campo obligatorio vacío

    Given el usuario deja el campo "nombre" vacío
    When presiona "Registrarme"
    Then el sistema muestra un mensaje señalando qué campo falta completar
