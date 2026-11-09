Feature: US-29 - Confirmación de finalización de la guía
  Como usuario que desconfía de los trámites digitales
  Deseo que la app me confirme que completé todos los pasos
  Para saber que no me quedó nada pendiente

#-------------------------------------------------------------------------------------------
Scenario Outline: Guía completada

    Given el usuario recorrió todos los pasos de la guía "<tramite>" en modo "<modo>"
    When llega al final
    Then el sistema muestra una pantalla de cierre con ícono, el título "¡Listo, terminaste la guía!" y el mensaje "<mensaje>"

    Examples: Datos de entrada y salida
      | tramite           | modo     | mensaje                                                                                           |
      | Pago de luz       | real     | Ahora puedes ir al sitio oficial con tus datos listos. Recuerda: Contigo no realiza pagos por ti. |
      | Renovación de DNI | práctica | Practicaste todo el recorrido. Cuando quieras hacer el trámite de verdad, empieza la guía real.   |


#-------------------------------------------------------------------------------------------
Scenario Outline: Pasos pendientes

    Given el usuario intenta finalizar la guía "<tramite>" desde el paso "<paso_actual>" sin completar todos los pasos
    When llega a la pantalla "Te quedan pasos pendientes"
    Then el sistema le indica que quedaron "<pasos_pendientes>" pasos pendientes y le permite regresar con "Regresar al paso pendiente"

    Examples: Datos de entrada y salida
      | tramite            | paso_actual                            | pasos_pendientes |
      | Pago de luz        | Entra a la página de tu empresa de luz | 4                |
      | Renovación de DNI  | Saca tu cita                           | 4                |
      | Consulta de deudas | Anota tus datos                        | 2                |


#-------------------------------------------------------------------------------------------
Scenario Outline: Confirmación fuera de la app

    Given el usuario terminó la guía "<tramite>"
    When el sistema muestra la pantalla de cierre
    Then le explica en "Cómo verificar en la plataforma oficial" que su trámite quedó registrado: "<verificacion>"

    Examples: Datos de entrada y salida
      | tramite            | verificacion                                                                 |
      | Pago de luz        | Revisa que el recibo diga «Pagado». Puede tardar hasta 24 horas en aparecer. |
      | Renovación de DNI  | Busca «Consulta el estado de tu trámite» y escribe tu número de DNI.         |
      | Consulta de deudas | Vuelve a consultar con tu DNI unos días después de pagar.                    |
