$palabras = []

def limpiar_pantalla
    system('cls') || system('clear')
end

def ingresar_palabras_numeros
    puts "\nIngrese la cantidad de palabras que desea ingresar (entre 1 y 10): "
    cantidad_palabras = gets.chomp.to_i
    if cantidad_palabras < 1 || cantidad_palabras > 10
        puts "Cantidad inválida. Por favor, ingrese un número entre 1 y 10."
        ingresar_palabras_numeros()
    end

    puts "Ingrese la primera palabra: "
    palabra = gets.chomp.to_s
    comparar_palabra = palabra
    $palabras.push(palabra)

     for i in 2..cantidad_palabras
        puts "Ingrese la palabra #{i}: "
        palabra = gets.chomp.to_s
        if palabra == comparar_palabra
            puts "La palabra ingresada es igual a la primera palabra. Por favor, ingrese una palabra diferente."
        else
            $palabras.push(palabra)
        end
    end
    menu()
end
   
def mostrar_palabras_numeros
    if $palabras.empty?
        puts "La lista de palabras está vacía."
    else
        puts "Palabras ingresadas: #{$palabras.sort()}"
        puts "presione enter para continuar"
        gets.chomp
    end
    limpiar_pantalla()
    menu()
end

def crear_usuario
    puts "\nAhora vamos a crear un usuario y una contraseña."
    puts "Ingrese su usuario: "
    usuario = gets.chomp.to_s
    puts "Ingrese su contraseña (entre 6 y 12 caracteres): "
    contrasena = gets.chomp.to_s
    if contrasena.length < 6 || contrasena.length > 12
        puts "La contraseña debe tener entre 6 y 12 caracteres. Por favor, intente nuevamente."
        limpiar_pantalla()
        crear_usuario()
    end
    puts "Ingrese nuevamente su contraseña para validarla: "
    validacion = gets.chomp.to_s
    if contrasena != validacion
        puts "Las contraseñas no coinciden. Por favor, intente nuevamente."
        limpiar_pantalla()
        crear_usuario()
    end 
    puts "Contraseña creada con éxito."
end

def menu
    puts "\nSeleccione una opción del menú:"
    puts "1 - Ingresar palabras y números"
    puts "2 - Mostrar palabras y números ingresados"
    puts "3 - Salir"
    opcion = gets.chomp.to_i
    case opcion
        when 1
            ingresar_palabras_numeros()
        when 2
            mostrar_palabras_numeros()
        when 3
            puts "¿Está seguro que desea salir? (s/n)"
            respuesta = gets.chomp.downcase
            if respuesta == "s"
                puts "Gracias por usar el programa. ¡Hasta luego!"
            exit
            else
                menu()
            end
        else
            puts "Opción inválida. Por favor, seleccione una opción válida."
            menu()
    end
end

def ingresar
    limpiar_pantalla()
    puts "======================================="
    puts "Bienvenid@s"
    puts "======================================="

    puts "Ingrese su nombre: "
    nombre = gets.chomp.to_s
    puts "Ingrese su apellido: "
    apellido = gets.chomp.to_s
    puts ""
    limpiar_pantalla()
    puts "Hola #{nombre} #{apellido}, bienvenido al programa.\n"
    crear_usuario()

    limpiar_pantalla()
    menu()
end