# Oznaczenia

`reg` - dowolny rejestr
`imm` - wartość podana bezpośrednio
`lab` - etykieta
`size`- rozmiar

# Podstawowe

#### MOV
Przenosi wartości pomiędzy rejestrami

`mov reg, reg/imm`

```
mov rax, 343
mov cl, dh
```

## Arytmetyczne

#### ADD
Dodaje

`add reg, reg/imm`

```
add rbx, 54
add r8, rax
```

#### SUB
Odejmuje

`sub reg, reg/imm`

```
sub rbx, 54
sub r8, rax
```

#### MUL
Mnoży

`mul reg, reg/imm`

```
mul rbx, 54
mul r8, rax
```

#### DIV
Dzieli

`div reg, reg/imm`

```
div rbx, 54
div r8, rax
```
Jest to operacja dzielenia całtowitego. Iloczyn jest zwrócony do `rax`, a reszta z dzielenia w `rdx` (jeśli działamy na 64 bitach, w przypadku 32 jest to odpowiednio `eax` i `edx`)

#### INC
Inkrementuje rejestr

`inc reg`

```
inc al
```

#### DEC
Dekrementuje rejestr

`dec reg`

```
dec ch
```

## Logiczne

#### NOT
Bitowe NOT

`not reg`

```
not rax
```

#### AND
Bitowe AND

`and reg, reg\imm`

```
and rax, rbx
```

#### OR
Bitowe OR

`or reg, reg\imm`

```
or rax, rbx
```

#### XOR
Bitowe XOR

`xor reg, reg\imm`

```
xor rax, rbx
```

## Instrukcje warunkowe

#### CMP
Instrukcja porównania
`cmp reg, size reg\imm`

#### JMP
Skok bezwarunkowy

`jmp lab`

#### Jxx
Skok warunkowy

##### JE
Skocz jeśli równe
`je lab`
##### JNE
Skocz jeśli nie równe
`jne lab`

##### JG
Skocz jeśli większe
`jg lab`
##### JNG
Skocz jeśli nie równe
`jng lab`

##### JS
Skocz jeśli mniejsze
`js lab`
##### JNS
Skocz jeśli nie mniejsze
`jns lab`

##### JO
Skocz jeśli nastąpiło przepełnienie
`jo lab`
##### JNO
Skocz jeśli nie nastąpiło przepełnienie
`jno lab`