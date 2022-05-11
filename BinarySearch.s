    AREA BinarySearch, CODE, READONLY
    ENTRY

; Make sure to Memory Map 0x00000000 - 0x00000FFF.

; Quesition 1:
; the smallest value will apear at register 5 after running
; the largest value will apear at register 6 after running
    
        adr r0, array    ; address of array in register r0
n * 20                    ; input the number of elements here
c * n-1                 ; number of comparisons for bubble sortig 
    
; THE CODE TO SORT ARRAY IN ASCENDING ORDER:    
        
        mov r5,#c        ; counter for iterations
L1      mov r6,r5        ; counter for comparisons
        mov r3,r0        ; temporarly storing the address of array
        
L2      ldr r1,[r3]        ; load the value of a member
        ldr r2,[r3,#4]    ; load the value of the next member
        cmp r1,r2        ; compare the two members
        blt SKIP        ; if the two members are in order, skip
        str r2,[r3]        ; 
        str r1,[r3,#4]    ; if members are not in order, then swap positions
    
SKIP    add r3,r3,#4    ; the address of the next member in the array
        subs r6,#1        ; comparison-1
        bne L2            ; jump for new comparison
        subs r5,#1        ; iteration - 1
        bne L1            ; jump for new iteration
        
; THE CODE TO FIND THE SMALLEST VALUE USING BST ALGORITHM:
        
        mov r1,#0        ; index for the first member of the array
        mov r2,#n-1        ; index of the last member of the array
L3      mov r3,r2,asr #1; index for the middle member
        sub r2,r3,#1    ; last member in the left side of the middle will be the last member in the sub-array we are intrested in
        cmp r2, #0        ; to check if we reached the most left of the array (the smallest value)
        bne L3            ; loop until we reach the smallest value
        ldr r5,[r0,r2]    ; the smallest value will be shown on register 5
        
; THE CODE TO FIND THE Largest VALUE USING BST ALGORITHM:
        
        mov r7,#0                ; index for the first member of the array
        mov r8,#n-1                ; index of the last member of the array
L4      add r4,r7,r8            ; first member index+ last member index
        mov r4,r4,asr #1        ; index for the middle number
        add r7,r4,#1            ; first member in the right side of the middle will be the first member in the sub-array we are intrested in
        cmp r7, #n-1            ; to check if we reached the most right of the array (the largest value)
        bne L4                    ; loop until we reach the largest value
        ldr r6,[r0,r7,lsl #2]    ; the largest value will be shown on register 6

;the given array in the question is:
array dcd 21, 02, 34, 54, 33, 22, 11, 09, 98, 67, 59, 89, 50, 60, 77, 71, 37, 44,47, 93

    END