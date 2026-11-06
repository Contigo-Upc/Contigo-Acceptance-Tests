Feature: US-05 - Edición de datos de perfil
  Como usuario
  Deseo poder editar mis datos personales cuando lo necesite
  Para mantener mi información actualizada

#-------------------------------------------------------------------------------------------
Scenario: Edición exitosa

    Given el usuario está en "Mi perfil"
    When modifica un dato y presiona "Guardar"
    Then el sistema actualiza la información y confirma el cambio


#-------------------------------------------------------------------------------------------
Scenario: Dato con formato inválido

    Given el usuario ingresa un número de celular con formato incorrecto
    When intenta guardar
    Then el sistema muestra un mensaje indicando el formato correcto


#-------------------------------------------------------------------------------------------
Scenario: Cancelar edición

    Given el usuario modificó un dato pero no lo guardó
    When presiona "Cancelar"
    Then el sistema descarta los cambios y mantiene la información anterior
