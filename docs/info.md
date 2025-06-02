#  ALU de 2 Bits - Proyecto para Tiny Tapeout
## VIDEO

[VIDEO](https://youtu.be/cZcN54I_L-A)
Este proyecto implementa una **Unidad Aritmético-Lógica (ALU) de 2 bits** utilizando la plataforma **Tiny Tapeout**, que permite a cualquier persona diseñar y fabricar su propio circuito integrado.

##  Descripción del Diseño

El diseño está escrito en Verilog y se encuentra en el módulo:

verilog
module tt_um_alu_2bit

###  Operaciones soportadas

La ALU implementa las siguientes operaciones:

| Control (`ui_in[6:4]`) | Operación     | Descripción               |
|------------------------|---------------|---------------------------|
| `000`                  | Suma          | `A + B`, con bit de overflow |
| `001`                  | Resta         | `A - B`                   |
| `010`                  | AND           | `A & B`                   |
| `011`                  | OR            | `A | B`                   |
| `100`                  | XOR           | `A ^ B`                   |
| `101`                  | NOT           | `~A` (ignora B)           |
| `110`                  | Shift Left    | `A << 1`                  |
| `111`                  | Shift Right   | `A >> 1`                  |


###  Mapeo de Entradas y Salidas

| Señal             | Función                               |
|-------------------|----------------------------------------|
| `ui_in[1:0]`      | Operando A (2 bits)                   |
| `ui_in[3:2]`      | Operando B (2 bits)                   |
| `ui_in[6:4]`      | Código de operación (3 bits)          |
| `uo_out[3:0]`     | Resultado de la operación             |
| `uo_out[7]`       | Bit de overflow (solo en suma)        |
| `uo_out[6:4]`     | No usados (relleno con ceros)         |
| `uio_*`           | No utilizados                         |
| `clk`, `ena`, `rst_n` | Reservados por formato Tiny Tapeout |



