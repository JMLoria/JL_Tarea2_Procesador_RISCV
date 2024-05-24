.data
msg0:
    .string "No cumple condicion. Salto condicional [beq] rechazado\n"
msg1:
    .string "Cumple condicion. Salto condicional [beq] ejecutado\n"
msg2:
    .string "Salto condicional [bne] ejecutado\n"
msg3:
    .string "Salto incondicional [jal] ejecutado\n"
.text
.global main

main:
    li t0, 10   # Cargar valor 10 al registro t0 
    li t1, 20   # Cargar valor 20 al registro t1
    li t2, 0    # Inicializar el contador
    li t3, 3    # Valor limite para el bucle

loop:
    beq t2, t3, end    # Salto a end si t2 == t3
    addi t2, t2, 1     # Incrementa el contador en 1
    # Imprimir estado del procesador
    la a0, msg0    # Direccion de la cadena de mensaje
    li a7, 4       # Codigo de llamada al sistema para imprimir 
    ecall
    
    bne t0, t1, not_equal    # Salto a not_equal si t0 != t1
    
    j loop    # Jump a loop
    
not_equal:
    # Imprimir estado del procesador
    la a0, msg2    # Direccion de la cadena de mensaje
    li a7, 4       # Codigo de llamada al sistema para imprimir 
    ecall
    
    jal function   # Salto JAL a function
    j loop         # Jump a loop
    
function:
    # Imprimir estado del procesador
    la a0, msg3    # Direccion de la cadena de mensaje
    li a7, 4       # Codigo de llamada al sistema para imprimir 
    ecall
    
    addi t0, t0, 10    # Incremento el valor de t0 en 10
    jalr x0, x1, 0     # Jump de retorno  a la direccion en x1
    
end:
    # Imprimir estado del procesador
    la a0, msg1    # Direccion de la cadena de mensaje
    li a7, 4       # Codigo de llamada al sistema para imprimir 
    ecall
    
    li a7, 10    # Codigo de llamada al sistema para finalizar el programa
    ecall