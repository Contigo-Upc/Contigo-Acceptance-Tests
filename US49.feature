Feature: US-49 - Solicitar ayuda humana
  Como usuario
  Deseo solicitar ayuda de una persona
  Para resolver un problema que no pude solucionar mediante la aplicación

#-------------------------------------------------------------------------------------------
Scenario Outline: Solicitar ayuda

    Given el usuario tiene un problema
    When selecciona "Necesito ayuda"
    Then el sistema muestra la opción de soporte "<canal>" con el contacto "<contacto>" y el horario "<horario>"

    Examples: Datos de salida
      | canal    | contacto        | horario                                     |
      | WhatsApp | +51 987 654 321 | de lunes a sábado, de 8:00 a.m. a 8:00 p.m. |
      | Correo   | hola@contigo.pe | de lunes a sábado, de 8:00 a.m. a 8:00 p.m. |


#-------------------------------------------------------------------------------------------
Scenario Outline: Registrar solicitud

    Given el usuario describe su problema "<descripcion>" en el trámite "<tramite>"
    When presiona "Solicitar ayuda"
    Then el sistema registra la solicitud "<ticket>" y muestra el mensaje "<mensaje>"

    Examples: Datos de entrada y salida
      | descripcion                                        | tramite           | ticket   | mensaje                                                                              |
      | No encuentro mi número de suministro en el recibo. | Pago de luz       | SOP-0012 | Recibimos tu solicitud SOP-0012. Una persona de nuestro equipo te responderá pronto. |
      | No sé dónde pagar la tasa para renovar mi DNI.     | Renovación de DNI | SOP-0013 | Recibimos tu solicitud SOP-0013. Una persona de nuestro equipo te responderá pronto. |
      | La página de mi empresa de agua no me deja entrar. | Pago de agua      | SOP-0014 | Recibimos tu solicitud SOP-0014. Una persona de nuestro equipo te responderá pronto. |


#-------------------------------------------------------------------------------------------
Scenario Outline: Información incompleta

    Given el usuario escribe solo "<descripcion>" sin describir su problema
    When intenta enviar la solicitud
    Then el sistema muestra el mensaje "<mensaje>"

    Examples: Datos de entrada y salida
      | descripcion | mensaje                                                 |
      | ayuda       | Cuéntanos con más detalle qué pasó para poder ayudarte. |
      | hola        | Cuéntanos con más detalle qué pasó para poder ayudarte. |
      | no puedo    | Cuéntanos con más detalle qué pasó para poder ayudarte. |
