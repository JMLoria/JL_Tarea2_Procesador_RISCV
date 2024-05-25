.data
msg_operations:
    .string "Operacion se realizo \n"
    .text
    .global main
    
main:
    #Inicializar registros
    li a0, 25 #Cargar el valor 15 a a0
    li a1, 15 #Cargar el valor 25 a a0
    
    #Contador de operaciones
    li t0, 0 #Cargar valor 0 a t0
    
    #Realizar las operaciones y contar las mismas
    add a2, a0, a1 #Suma: a2 = a0 + a1
    addi t0, t0, 1
    li a7, 4  #Código de llamada al sistema para imprimir (5 para imprimir)
    la a0, msg_operations
    mv a1, t0
    ecall
    
    sub a3, a0, a1 # Resta: a3 = a0 - a1 (25 - 15)
    addi t0, t0, 1
    li a7, 4
    la a0, msg_operations
    mv a1, t0
    ecall
    
    and a4, a0, a1  # AND lógico: a4 = a0 & a1
    addi t0, t0, 1
    li a7, 4
    la a0, msg_operations
    mv a1, t0
    ecall
    
    or a5, a0, a1 # OR lógico: a5 = a0 | a
    addi t0, t0, 1
    li a7, 4
    la a0, msg_operations
    mv a1, t0
    ecall
    
    slt a6, a0, a1 # Establecer si menor que: a6 = (a0 < a1)
    addi t0, t0, 1
    li a7, 4
    la a0, msg_operations
    mv a1, t0
    ecall
    
    # Mostrar el resultado final del contador
    li a7, 1 # Código de llamada al sistema para imprimir un entero (1 para imprimir)
    mv a0, t0
    ecall
    
    # Finalizar el programa
    li a7, 10 # Código de llamada al sistema para finalizar el programa (10 para finalizar)
    ecall
