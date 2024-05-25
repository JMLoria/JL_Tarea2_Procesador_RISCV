.data 
    variable_origen: .word 42 # Variable en memoria
    variable_destino: .word 0 # Variable de destino inicializada
    
.text
.global _start

_start:
    # Acceso a memoria para cargar un valor en un registro
    lw t0, variable_origen  #Cargar el valor de "variable_origen" en el registro t0
    
    # Acceso a memoria para almacenar el valor desde el registro a la variablabe destino
    la t1, variable_destino
    sw t0, 0(t1)
    
    # Finalizacion del programa
    li a7, 10
    ecall
    
