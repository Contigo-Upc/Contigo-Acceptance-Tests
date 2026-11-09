Feature: US-19 - Extracción de datos desde documentos de identidad
  Como usuario
  Deseo fotografiar mi DNI
  Para que la app complete automáticamente mis datos personales en un trámite

#-------------------------------------------------------------------------------------------
Scenario Outline: Extracción exitosa

    Given el trámite "<tramite>" requiere datos del DNI
    When el usuario fotografía su documento
    Then el sistema completa el formulario con el nombre "<nombre>" y el número de DNI "<dni>"

    Examples: Datos de entrada y salida
      | tramite            | nombre                    | dni      |
      | Renovación de DNI  | Rosa Elvira Huamán Torres | 41827365 |
      | Consulta de deudas | Teodoro Mamani Quispe     | 07294518 |
      | Renovación de DNI  | Carmen Salazar Vega       | 25638194 |


#-------------------------------------------------------------------------------------------
Scenario Outline: Documento dañado o vencido

    Given el DNI fotografiado está "<estado>"
    When el sistema intenta procesarlo
    Then muestra el mensaje "<mensaje>"

    Examples: Datos de entrada y salida
      | estado  | mensaje                                                                                                 |
      | dañado  | No pudimos validar tu DNI porque no se lee completo. Vuelve a tomar la foto o escribe tus datos a mano. |
      | vencido | No pudimos validar tu DNI porque está vencido. Escribe tus datos a mano o renuévalo con la guía.        |


#-------------------------------------------------------------------------------------------
Scenario Outline: Confirmación de datos extraídos

    Given el sistema completó el nombre "<nombre>" y el DNI "<dni>" automáticamente
    When el usuario revisa la información y presiona "<boton>"
    Then el sistema <resultado>

    Examples: Datos de entrada y salida
      | nombre                    | dni      | boton                  | resultado                                           |
      | Rosa Elvira Huamán Torres | 41827365 | Sí, todo está correcto | confirma los datos y pasa al siguiente paso         |
      | Teodoro Mamani Quispe     | 07294518 | Corregir datos         | abre los campos para corregirlos antes de continuar |
