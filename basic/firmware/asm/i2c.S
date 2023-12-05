.equ I2C_BASE,   0x420000  
.equ DATA_IN,   0x04
.equ INIT,   0x08
.equ TAKE,   0x0C

.equ CAMERA_BASE,   0x430000  
.equ PIXEL,   0x14
.equ DONE,   0x10

.section .text
.globl i2c
.global camera

i2c:
  li   gp, I2C_BASE 
  li   a0, 0x421208
  sw   a0, DATA_IN (gp)  
  li   a1, 1
  sw   a1, INIT(gp) 
  sw   zero, INIT(gp) 
  
  .L0:
   li   t1, 1  
   lw   t2, TAKE(gp)

   and  t1, t1, t2
   beqz t1, .L0 
  
  .new_reg:
  li   a0, 0x421180
  sw   a0, DATA_IN (gp)  
  sw   a1, INIT(gp) 
  sw   zero, INIT(gp) 
  
.L01:
   li   t1, 1  
   lw   t2, TAKE(gp)

   and  t1, t1, t2
   beqz t1, .L01  
   
.new_reg1:
  li   a0, 0x424010
  sw   a0, DATA_IN (gp)  
  sw   a1, INIT(gp) 
  sw   zero, INIT(gp)
  
.L02:
   li   t1, 1  
   lw   t2, TAKE(gp)

   and  t1, t1, t2
   beqz t1, .L02 
   
 .new_reg2:
  li   a0, 0x421208
  sw   a0, DATA_IN (gp)  
  sw   a1, INIT(gp) 
  sw   zero, INIT(gp)
  
.L03:
   li   t1, 1  
   lw   t2, TAKE(gp)

   and  t1, t1, t2
   beqz t1, .L03
   
   
 .new_reg3:
  li   a0, 0x421802
  sw   a0, DATA_IN (gp)  
  sw   a1, INIT(gp) 
  sw   zero, INIT(gp)
  
.L04:
   li   t1, 1  
   lw   t2, TAKE(gp)

   and  t1, t1, t2
   beqz t1, .L04
   
 .new_reg4:
  li   a0, 0x423240
  sw   a0, DATA_IN (gp)  
  sw   a1, INIT(gp) 
  sw   zero, INIT(gp)
  
.L05:
   li   t1, 1  
   lw   t2, TAKE(gp)

   and  t1, t1, t2
   beqz t1, .L05
 .new_reg5:
  li   a0, 0x427777
  sw   a0, DATA_IN (gp)  
  sw   a1, INIT(gp) 
  sw   zero, INIT(gp)
  
.L06:
   li   t1, 1  
   lw   t2, TAKE(gp)

   and  t1, t1, t2
   beqz t1, .L06
 .new_reg6:
  li   a0, 0x421903
  sw   a0, DATA_IN (gp)  
  sw   a1, INIT(gp) 
  sw   zero, INIT(gp)
  
.L07:
   li   t1, 1  
   lw   t2, TAKE(gp)

   and  t1, t1, t2
   beqz t1, .L07
 .new_reg7:
  li   a0, 0x421A7B
  sw   a0, DATA_IN (gp)  
  sw   a1, INIT(gp) 
  sw   zero, INIT(gp)
  
.L08:
   li   t1, 1  
   lw   t2, TAKE(gp)

   and  t1, t1, t2
   beqz t1, .L08
 .new_reg8:
  li   a0, 0x42030A
  sw   a0, DATA_IN (gp)  
  sw   a1, INIT(gp) 
  sw   zero, INIT(gp)
  
.L09:
   li   t1, 1  
   lw   t2, TAKE(gp)

   and  t1, t1, t2
   beqz t1, .L09
   
   li   t0, 0               # Inicializa t0 a 0
   li   gp, CAMERA_BASE   # Inicializa sp a CAMERA_BASE
   
   .camera:
   li   t1, 1  
   lw   t2, DONE(gp)

   and  t1, t1, t2
   beqz t1, .camera
   
.camera1:
   lw   a0, PIXEL(gp)     # Carga el valor de píxel desde la dirección sp
   addi gp, gp, 4  
   sw   a0, 0(gp)         # Almacena el valor de píxel en la dirección apuntada por t0
   addi t0, t0, 1         # Incrementa t0 para apuntar a la siguiente dirección        
   li   t1, 50688         # Carga el valor 50688 en t1
   blt  t0, t1, .camera1   # Salta de nuevo a .camera si t0 < 50688

 
   
   
ret
