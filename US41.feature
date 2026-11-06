Feature: US-41 - Ajuste del tamaño del texto
  Como usuario con dificultades para leer textos pequeños
  Deseo aumentar o disminuir el tamaño del texto de la interfaz
  Para visualizar la información de Contigo con mayor comodidad

#-------------------------------------------------------------------------------------------
Scenario: Aumentar el tamaño del texto

    Given el usuario se encuentra utilizando Contigo
    When selecciona una opción para aumentar el tamaño del texto
    Then el sistema incrementa el tamaño de los textos de la interfaz y mantiene la información legible


#-------------------------------------------------------------------------------------------
Scenario: Disminuir el tamaño del texto

    Given el usuario tiene aumentado el tamaño del texto
    When selecciona la opción para disminuirlo
    Then el sistema reduce el tamaño del texto manteniendo la correcta visualización de la interfaz


#-------------------------------------------------------------------------------------------
Scenario: Mantener la funcionalidad

    Given el usuario ha modificado el tamaño del texto
    When continúa navegando por Contigo
    Then los contenidos y funcionalidades principales continúan siendo accesibles y utilizables
