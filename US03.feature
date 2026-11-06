Feature: US-03 - Inicio de sesión simplificado
  Como usuario
  Deseo iniciar sesión con mi número de celular y un código
  Para no tener que recordar contraseñas complejas

#-------------------------------------------------------------------------------------------
Scenario: Código correcto

    Given el usuario ingresa su número de celular
    When recibe e ingresa el código de verificación correcto
    Then el sistema le da acceso a su cuenta


#-------------------------------------------------------------------------------------------
Scenario: Código incorrecto

    Given el usuario ingresa un código de verificación incorrecto
    When presiona "Verificar"
    Then el sistema muestra un mensaje de error y permite reintentar


#-------------------------------------------------------------------------------------------
Scenario: Código expirado

    Given pasaron más de 5 minutos desde el envío del código
    When el usuario intenta usarlo
    Then el sistema indica que expiró y ofrece reenviar uno nuevo
