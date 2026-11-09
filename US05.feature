Feature: US-05 - Edición de datos de perfil
  Como usuario
  Deseo poder editar mis datos personales cuando lo necesite
  Para mantener mi información actualizada

#-------------------------------------------------------------------------------------------
Scenario Outline: Edición exitosa

    Given el usuario "<nombre>" está en "Mi perfil"
    When cambia el campo "<campo>" a "<nuevo_valor>" y presiona "Guardar cambios"
    Then el sistema actualiza la información y muestra el mensaje "<mensaje>"

    Examples: Datos de entrada y salida
      | nombre             | campo             | nuevo_valor           | mensaje                                 |
      | María Elena Quispe | Edad              | 68                    | Tus datos ya están actualizados, María. |
      | Jorge Ramos        | Número de celular | 923 456 789           | Tus datos ya están actualizados, Jorge. |
      | Lucía Fernández    | Nombre completo   | Lucía Fernández Rojas | Tus datos ya están actualizados, Lucía. |


#-------------------------------------------------------------------------------------------
Scenario Outline: Dato con formato inválido

    Given el usuario ingresa el número de celular "<celular>" con formato incorrecto
    When intenta guardar
    Then el sistema muestra el mensaje "<mensaje>"

    Examples: Datos de entrada y salida
      | celular      | mensaje                                                                         |
      | 987 654 32   | Escribe los 9 números de tu celular, empezando con 9. Por ejemplo: 987 654 321. |
      | 887 654 321  | Escribe los 9 números de tu celular, empezando con 9. Por ejemplo: 987 654 321. |
      | 987 654 3210 | Escribe los 9 números de tu celular, empezando con 9. Por ejemplo: 987 654 321. |


#-------------------------------------------------------------------------------------------
Scenario: Cancelar edición

    Given el usuario modificó un dato pero no lo guardó
    When presiona "Cancelar"
    Then el sistema descarta los cambios y mantiene la información anterior
