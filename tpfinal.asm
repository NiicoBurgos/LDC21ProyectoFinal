title tpfinal
cr equ 13
lf equ 10       

include macros.lib      

pila segment stack
        db 64 dup('PILA')
pila ends          

datos segment 
;componentes del menu    
    menu0 db cr,lf,'*************MENU************','$'             
    menu1 db cr,lf,'*   1- Ingresar numero      *','$'
    menu2 db cr,lf,'*   2- Factores primos      *','$'
    menu3 db cr,lf,'*   3- Mostrar divisores    *','$'
    menu4 db cr,lf,'*   4- Salir                *','$'
    menu5 db cr,lf,'*****************************','$'             
    menugap db cr,lf,'*                           *','$'             

;textos del programa        
    advertirOpc1 db cr,lf,'Advertencia, debe realizar antes la Opcion 1','$'
    advertirOpc2 db cr,lf,'Advertencia, debe realizar antes la Opcion 2','$'
    coma db ', ','$'  
    divisoresDe db cr,lf,'Divisores de ','$'    
    dospuntos db ':','$'
    elegirOpcion db cr,lf,'Elija una opcion:','$'       
    errorOpcion db cr,lf,'Error! Elija una opcion valida','$' 
    ceroDivisor db cr,lf,'El valor 0 no cuenta con divisores','$'
    ceroPrimo db cr,lf,'El valor 0 no cuenta con factores primos','$'
    espacioBlanco db cr,lf,'','$' 
    esNumeroPrimo db cr,lf,'Es un numero primo','$'
    excluirPrimos db ' (excluidos los factores primos):','$'
    factoresPrimos db cr,lf,'Factores primos de ','$'
    finPrograma db cr,lf,'FIN DE PROGRAMA','$'
    ingresoErroneo db cr,lf,'Error! Debe ingresar un numero','$'
    ingresoExitoso db cr,lf,'Numero ingresado correctamente','$'
    ingresoNumero db cr,lf,'Ingrese un numero de hasta 4 cifras:','$'  
    presioneTecla db cr,lf,'Presione una tecla para continuar','$' 
    unoDivisor db cr,lf,'El valor 1 no contiene divisores distintos de 1','$'
    
;cadenas necesarias para el programa       
    auxcaddiv db 4 dup(''),'$'
    auxcadprim db 4 dup(''),'$'
    cadena db 4 dup('0'),'$' 

;variables del programa    
    auxcoma db 0,'$'     
    habilitar2 db 0,'$'         
    habilitar3 db 0,'$'    
    opcion db 0,'$'   
    primo db 0,'$'  
    sonido db 0,'$'
    acc dw 0,'$'    
    aux dw 0,'$' 
    auxdivisor dw 0,'$'
    auxprim dw 0,'$' 
    long dw 0,'$'
    mitad dw 0,'$'    
    numero dw 0,'$'        
               
datos ends       

codigo segment
inicio proc far
        assume ds:datos,ss:pila,cs:codigo 
        push ds
        sub ax,ax
        push ax
        mov ax,datos 
        mov ds,ax 
menu:   
        call posicionar
        call borrar     
        ESCRIBE menu0
        ESCRIBE menugap
        ESCRIBE menu1
        ESCRIBE menu2
        ESCRIBE menu3
        ESCRIBE menu4
        ESCRIBE menugap
        ESCRIBE menu5
        ESCRIBE espacioBlanco
        
        LEEROPCION opcion
        
        cmp opcion,1
		je op1		
		cmp opcion,2
		je op2
		cmp opcion,3
		je op3
		cmp opcion,4
		je op4
op1:
		OPCION1 cadena,numero
		ESCRIBE presioneTecla 
		call esperar
		jmp menu
op2:	
		OPCION2 numero 
		ESCRIBE presioneTecla 
		call esperar
		jmp menu
op3:
		OPCION3 numero,auxdivisor
		ESCRIBE presioneTecla 
		call esperar
		jmp menu	
op4:    
        OPCION4		      
        call esperar 
        ret
inicio endp   
                                                  
escribir proc 
        push ax                                   
        mov ah,09 
        int 21h 
        pop ax 
        ret
escribir endp  

esperar proc 
        push ax 
        mov ah,00
        int 16h 
        pop ax 
        ret
esperar endp 
            
            
borrar proc
        push ax
        push bx
        push cx
        mov ax,0600h 
        mov bh,10
        mov cx,0000 
        mov dx,184fh 
        int 10h
        pop cx
        pop bx
        pop ax
        ret
borrar endp 

posicionar proc
        push ax
        push bx
        push dx
        mov ah,2 
        mov bh,0
        mov dh,01h 
        mov dl,01h 
        int 10h 
        pop dx
        pop bx
        pop ax
        ret
posicionar endp

codigo ends 
end inicio