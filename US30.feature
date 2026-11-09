Feature: US-30 - Registro del trámite guiado
  Como usuario
  Deseo guardar o compartir el comprobante de mi trámite
  Para tener respaldo de que lo realicé

#-------------------------------------------------------------------------------------------
Scenario Outline: Guardar el registro

    Given el usuario completó la guía "<tramite>" el "<fecha>"
    When presiona "Guardar comprobante"
    Then el sistema almacena la fecha, el trámite y los datos "<datos>" y muestra el mensaje "Guardamos tu comprobante en tu dispositivo."

    Examples: Datos de entrada y salida
      | tramite           | fecha      | datos                                                       |
      | Pago de luz       | 12/11/2026 | Número de suministro: 1234567; Monto a pagar (S/): S/ 85.40 |
      | Pago de cable     | 20/11/2026 | Número de contrato: 23456789; Monto a pagar (S/): S/ 59.90  |
      | Renovación de DNI | 02/12/2026 | Número de DNI: 45871236                                     |


#-------------------------------------------------------------------------------------------
Scenario Outline: Consulta posterior

    Given el usuario necesita revisar el trámite "<tramite>" que hizo el "<fecha>"
    When lo busca en "Trámites que ya hiciste"
    Then el sistema muestra el registro "<codigo>" con la fecha "<fecha>" y los datos "<datos>"

    Examples: Datos de entrada y salida
      | tramite           | fecha      | codigo       | datos                                                       |
      | Pago de luz       | 12/11/2026 | CTG-MHVK2R7A | Número de suministro: 1234567; Monto a pagar (S/): S/ 85.40 |
      | Renovación de DNI | 02/12/2026 | CTG-MIOB4T9C | Número de DNI: 45871236                                     |


#-------------------------------------------------------------------------------------------
Scenario Outline: Compartir el registro

    Given el usuario quiere mostrarle a "<familiar>" el comprobante de "<tramite>"
    When presiona "Compartir comprobante"
    Then el sistema permite enviarlo mediante "<aplicacion>" con el título "Comprobante de Contigo"

    Examples: Datos de entrada
      | familiar         | tramite           | aplicacion |
      | su hija Rosa     | Pago de agua      | WhatsApp   |
      | su nieto Diego   | Renovación de DNI | Gmail      |
      | su vecina Carmen | Pago de internet  | Mensajes   |
