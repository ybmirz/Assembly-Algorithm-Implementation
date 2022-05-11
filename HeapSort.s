	AREA HeapSort, CODE, READONLY
	ENTRY
	
SRAM_BASE EQU 0x60000000 ; STACK that is used for storing LR 
	LDR sp, =SRAM_BASE
	
	; MAIN FUNCTION
	LDR r0, =array
	MOV r11, #10	; <----- Change number of elements here, 10 is the number of elements	
	
	; This code is mainly an implementation of the C heap sort code from this site: https://www.programiz.com/dsa/heap-sort
	; If you wanna see the visualization of how the heap sort code works, go to this link: https://tinyurl.com/yc7m8nuf
	; When you wanna run it, please memory map 0x00000000, 0x00000FFF for READ, WRITE, and EXEC
	; https://pythontutor.com/c.html#code=%23include%20%3Cstdio.h%3E%0A%20%20%0A%20%20//%20Function%20to%20swap%20the%20the%20position%20of%20two%20elements%0A%20%20void%20swap%28int%20*a,%20int%20*b%29%20%7B%0A%20%20%20%20int%20temp%20%3D%20*a%3B%0A%20%20%20%20*a%20%3D%20*b%3B%0A%20%20%20%20*b%20%3D%20temp%3B%0A%20%20%7D%0A%20%20%0A%20%20void%20heapify%28int%20arr%5B%5D,%20int%20n,%20int%20i%29%20%7B%0A%20%20%20%20//%20Find%20largest%20among%20root,%20left%20child%20and%20right%20child%0A%20%20%20%20int%20largest%20%3D%20i%3B%0A%20%20%20%20int%20left%20%3D%202%20*%20i%20%2B%201%3B%0A%20%20%20%20int%20right%20%3D%202%20*%20i%20%2B%202%3B%0A%20%20%0A%20%20%20%20if%20%28left%20%3C%20n%20%26%26%20arr%5Bleft%5D%20%3E%20arr%5Blargest%5D%29%0A%20%20%20%20%20%20largest%20%3D%20left%3B%0A%20%20%0A%20%20%20%20if%20%28right%20%3C%20n%20%26%26%20arr%5Bright%5D%20%3E%20arr%5Blargest%5D%29%0A%20%20%20%20%20%20largest%20%3D%20right%3B%0A%20%20%0A%20%20%20%20//%20Swap%20and%20continue%20heapifying%20if%20root%20is%20not%20largest%0A%20%20%20%20if%20%28largest%20!%3D%20i%29%20%7B%0A%20%20%20%20%20%20swap%28%26arr%5Bi%5D,%20%26arr%5Blargest%5D%29%3B%0A%20%20%20%20%20%20heapify%28arr,%20n,%20largest%29%3B%0A%20%20%20%20%7D%0A%20%20%7D%0A%20%20%0A%20%20//%20Main%20function%20to%20do%20heap%20sort%0A%20%20void%20heapSort%28int%20arr%5B%5D,%20int%20n%29%20%7B%0A%20%20%20%20//%20Build%20max%20heap%0A%20%20%20%20for%20%28int%20i%20%3D%20n%20/%202%20-%201%3B%20i%20%3E%3D%200%3B%20i--%29%0A%20%20%20%20%20%20heapify%28arr,%20n,%20i%29%3B%0A%20%20%0A%20%20%20%20//%20Heap%20sort%0A%20%20%20%20for%20%28int%20i%20%3D%20n%20-%201%3B%20i%20%3E%3D%200%3B%20i--%29%20%7B%0A%20%20%20%20%20%20swap%28%26arr%5B0%5D,%20%26arr%5Bi%5D%29%3B%0A%20%20%0A%20%20%20%20%20%20//%20Heapify%20root%20element%20to%20get%20highest%20element%20at%20root%20again%0A%20%20%20%20%20%20heapify%28arr,%20i,%200%29%3B%0A%20%20%20%20%7D%0A%20%20%7D%0A%20%20%0A%20%20//%20Print%20an%20array%0A%20%20void%20printArray%28int%20arr%5B%5D,%20int%20n%29%20%7B%0A%20%20%20%20for%20%28int%20i%20%3D%200%3B%20i%20%3C%20n%3B%20%2B%2Bi%29%0A%20%20%20%20%20%20printf%28%22%25d%20%22,%20arr%5Bi%5D%29%3B%0A%20%20%20%20printf%28%22%5Cn%22%29%3B%0A%20%20%7D%0A%20%20%0A%20%20//%20Driver%20code%0A%20%20int%20main%28%29%20%7B%0A%20%20%20%20int%20arr%5B%5D%20%3D%20%7B82,%2022,%2095,%2090,%2010,%2012,%2015,%2077,%2055,%2023%7D%3B%0A%20%20%20%20int%20n%20%3D%20sizeof%28arr%29%20/%20sizeof%28arr%5B0%5D%29%3B%0A%20%20%0A%20%20%20%20heapSort%28arr,%20n%29%3B%0A%20%20%0A%20%20%20%20printf%28%22Sorted%20array%20is%20%5Cn%22%29%3B%0A%20%20%20%20printArray%28arr,%20n%29%3B%0A%20%20%7D&curInstr=0&mode=display&origin=opt-frontend.js&py=c_gcc9.3.0&rawInputLstJSON=%5B%5D
	
	; List of registers and its usage
	; r0 - array[0] location
	; r1 - aray length (flexibly changed)
	; r2 - heapify index (substituing r11)
	; r3 - second for loop index
	; r4 is largest
	; r5 is left
	; r6 is right
	
	; r7 - used for swapping
	; r8 - used for swapping
	
	; r11 - Storage Register of Array Size

	; r12 - first for loop index 
	
	; Using the heap sort algorithm, we'll need to build a max heap first
	; and then heap sort from there.
	
	MOV r1, r11			; assign the flexible array size register (r1)
	BL main_heap_sort 	; start doing the heap sort!
stop B stop				; ending the heap sort program!
	
	
; build_max_heap SUB
main_heap_sort
	STMIA sp!, {lr} ; store the LR value in memory so it can be used later (to jump back to the previous sub)
	; Register used
	; r12 used as for loop index.
	MOV r12, r1, LSR #1  
	SUB r12, r12, #1
for_sort1				; building the max heap for loop
	CMP r12, #0			; compares i = n/2-1 with 0
	BLT endfor_sort1 	; if (r11-r12 < 0) jump
	MOV r2, r12			; i (in function) = r12 (i from outside)
	BL heapify			; calling the heapify(arr[r0], arr_size[r1], index[r2]) function
	SUB r12, r12, #1	; decrementing the for loop index
	B for_sort1
	
endfor_sort1 			; sorting the heap after built
	SUB r3, r1, #1		; (2nd) index for loop = arr_size - 1
	CMP r3, #0			; compare index[r3] with 0
	BLT endfor_sort2	; if r3 < 0 jump and dont do the loop (if (r3 >= 0) true)
	; swapping
	LDR r6, [r0] 		; array[0]
	LDR r7, [r0, r3, LSL#2] ; array[i]
	STR r7, [r0] 		; swap array location for array[0]
	STR r6, [r0, r3, LSL#2] ; swap array location for array[i]
	
	MOV r2, #0 			; heapify's i set to 0
	MOV r1, r3 			; heapify's n (array size) is set to second for loop index
	BL heapify			; once value registers are ready, do heapify (of the heap) after swapping
	SUB r3, r3, #1		; decrement loop's index
	B endfor_sort1
endfor_sort2	
	LDMDB sp!, {pc}		; so it goes back to main function (by popping the stored LR value in memory to PC)
	
	
	
	
; HEAPIFY / BUILD SUB
heapify
	STMIA sp!, {lr}		; store LR as usual
	; r2 is index here
	; r4 is largest
	; r5 is left
	; r6 is right
repeat
	MOV r4, r2			; largest = i
	MOV r5, r2, LSL#1	; left = 2 * i
 	ADD r5, r5, #1		; left = 2i + 1
	MOV r6, r2, LSL#1	; right = 2 * i
	ADD r6, r6, #2		; right = 2i + 1
	
	; two conditions for left, if (left < n AND array[left] > array[largest])
	CMP r5, r1			; compare left with arr_size
	BGE not_left		; if left IS greater equal to arr_size, skip the body
	LDR r7, [r0, r5, LSL#2]	; array[left]
	LDR r8, [r0, r4, LSL#2]	; array[largest]
	CMP r7, r8			; compare array[left] in r7 with array[largest] in r8
	BLE	not_left		; if array[r7] IS less equal to array[r8]
	MOV r4, r5			; largest = left
	
not_left	; label to skip if body
	; two conditions for right, if (right < n AND array[right] > array[largest])
	CMP r6, r1			; compare right with arr_size
	BGE not_right		; if right IS greater equal to arr_size, skip body
	LDR r7, [r0, r6, LSL#2] ; array[right]
	LDR r8, [r0, r4, LSL#2]	; array[largest]
	CMP r7, r8			; compare array[right] with array[largest]
	BLE not_right		; if right IS less equal to array[r8]
	MOV r4, r6			; largest = right
	
not_right	; label to skip if body
	; if largest is not i,  swap and recursive
	CMP r4, r2			; compare the value of largest with index
	BEQ end_heapify	; if (largest == i) goto end_heapify (will be fulfilled when done building)
	; swapping
	LDR r7, [r0, r2, LSL#2] ; temp = array[i]
	LDR r8, [r0, r4, LSL#2]	; getting array[largest]
	STR r8, [r0, r2, LSL#2] ; store array[largest] in array[i]
	STR r7, [r0, r4, LSL#2]	; store array[i] in previous array[largest]
	MOV r2, r4	; i = largest
	B repeat	; ^ set to recursive the heapify function
end_heapify
	LDMDB sp!, {pc}			; pop out of the stack for LR value (instruction address) to PC
	
array	
	DCD 82, 22, 95, 90, 10, 12, 15, 77, 55, 23
	END
	
	
	
	