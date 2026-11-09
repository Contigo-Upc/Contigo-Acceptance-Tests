Feature: US-01 - Registro con datos básicos
  Como usuario nuevo
  Deseo registrarme con mi nombre, edad y celular
  Para empezar a usar CONTIGO de forma personalizada

#-------------------------------------------------------------------------------------------
Scenario Outline: Registro exitoso

    Given el usuario abre la app por primera vez
    When completa el formulario con nombre "<nombre>", edad "<edad>" y celular "<celular>"
    Then el sistema crea la cuenta y muestra el mensaje "<mensaje>"

    Examples: Datos de entrada y salida
      | nombre             | edad | celular     | mensaje                               |
      | María Elena Quispe | 67   | 987 654 321 | ¡Te damos la bienvenida, María Elena! |
      | Jorge Ramos        | 72   | 912 345 678 | ¡Te damos la bienvenida, Jorge!       |
      | Lucía Fernández    | 19   | 956 111 222 | ¡Te damos la bienvenida, Lucía!       |


#-------------------------------------------------------------------------------------------
Scenario Outline: Celular ya registrado

    Given el usuario ingresa el celular "<celular>" que ya existe en el sistema
    When intenta completar el registro
    Then el sistema muestra el mensaje "<mensaje>"

    Examples: Datos de salida
      | celular     | mensaje                                    |
      | 987 654 321 | Este número ya está registrado en Contigo. |
      | 912 345 678 | Este número ya está registrado en Contigo. |


#-------------------------------------------------------------------------------------------
Scenario Outline: Campo obligatorio vacío

    Given el usuario deja el campo "<campo>" vacío
    When presiona "Registrarme"
    Then el sistema muestra el mensaje "<mensaje>"

    Examples: Datos de salida
      | campo   | mensaje                                      |
      | nombre  | Escribe tu nombre para continuar.            |
      | edad    | Escribe tu edad para continuar.              |
      | celular | Escribe tu número de celular para continuar. |
