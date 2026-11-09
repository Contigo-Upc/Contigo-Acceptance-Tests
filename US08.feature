Feature: US-08 - Consulta de requisitos antes de iniciar
  Como usuario
  Deseo ver qué documentos necesito antes de empezar un trámite
  Para no interrumpir el proceso a la mitad

#-------------------------------------------------------------------------------------------
Scenario Outline: Visualización de requisitos

    Given el usuario selecciona el trámite "<tramite>"
    When el sistema muestra la pantalla de inicio
    Then se listan de forma visual los <cantidad> documentos o datos necesarios, entre ellos "<requisito>"

    Examples: Datos de salida
      | tramite            | cantidad | requisito                                                          |
      | Pago de luz        | 4        | Tu número de suministro, que está en la parte de arriba del recibo |
      | Pago de internet   | 4        | Tu número de contrato                                              |
      | Renovación de DNI  | 4        | Tu DNI actual, si todavía lo tienes                                |
      | Consulta de deudas | 3        | El nombre de la empresa o entidad donde quieres consultar          |


#-------------------------------------------------------------------------------------------
Scenario Outline: Trámite sin requisitos adicionales

    Given el trámite "<tramite>" no requiere documentos previos
    When el usuario ingresa a la pantalla de inicio
    Then el sistema indica "<mensaje>" y muestra el botón "Empezar la guía"

    Examples: Datos de entrada y salida
      | tramite                             | mensaje                                                             |
      | Consulta de horarios de atención    | Este trámite no necesita documentos. Puedes empezar cuando quieras. |
      | Consulta de puntos de pago cercanos | Este trámite no necesita documentos. Puedes empezar cuando quieras. |


#-------------------------------------------------------------------------------------------
Scenario Outline: Usuario no cuenta con un requisito

    Given el usuario no tiene el documento "<requisito>" del trámite "<tramite>"
    When toca "No tengo este documento"
    Then el sistema explica cómo obtenerlo con el mensaje "<ayuda>"

    Examples: Datos de entrada y salida
      | tramite           | requisito                                   | ayuda                                                                                         |
      | Pago de luz       | Tu recibo de luz, en papel o en el celular  | Si no tienes el recibo en papel, revisa tu correo: muchas empresas de luz lo envían cada mes. |
      | Pago de agua      | Tu recibo de agua, en papel o en el celular | Si no tienes el recibo en papel, revisa tu correo o la app de tu empresa de agua.             |
      | Renovación de DNI | Tu DNI actual, si todavía lo tienes         | Si perdiste tu DNI, igual puedes hacer el trámite: pide un duplicado.                         |
