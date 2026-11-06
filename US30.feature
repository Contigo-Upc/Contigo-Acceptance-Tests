Feature: US-30 - Registro del trámite guiado
  Como usuario
  Deseo guardar o compartir el comprobante de mi trámite
  Para tener respaldo de que lo realicé

#-------------------------------------------------------------------------------------------
Scenario: Guardar el registro

    Given el usuario completó una guía
    When presiona "Guardar en mi historial"
    Then el sistema almacena la fecha, el trámite y los datos utilizados


#-------------------------------------------------------------------------------------------
Scenario: Consulta posterior

    Given el usuario necesita revisar un trámite anterior
    When lo busca en su historial
    Then el sistema muestra el registro con la fecha y los datos que ingresó


#-------------------------------------------------------------------------------------------
Scenario: Compartir el registro

    Given el usuario quiere mostrarle a un familiar lo que hizo
    When presiona "Compartir"
    Then el sistema permite enviarlo mediante las aplicaciones disponibles en su dispositivo
