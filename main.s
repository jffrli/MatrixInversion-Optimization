	.arch armv7-a
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	fixed_multiplication
	.arch armv7-a
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	fixed_multiplication, %function
fixed_multiplication:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6, r7, r8, r9, fp}
	add	fp, sp, #24
	sub	sp, sp, #20
	strd	r0, [fp, #-36]
	strd	r2, [fp, #-44]
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-44]
	mul	r2, r2, r3
	ldr	r3, [fp, #-40]
	ldr	r1, [fp, #-36]
	mul	r3, r1, r3
	add	r1, r2, r3
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-44]
	umull	r2, r3, r2, r3
	add	r1, r1, r3
	mov	r3, r1
	asr	r1, r3, #31
	mov	r0, r1
	asr	r1, r0, #31
	movw	r8, #65535
	mov	r9, #0
	and	r6, r0, r8
	and	r7, r1, r9
	adds	r4, r6, r2
	adc	r5, r7, r3
	mov	r2, #0
	mov	r3, #0
	lsr	r2, r4, #16
	orr	r2, r2, r5, lsl #16
	asr	r3, r5, #16
	mov	r0, r2
	mov	r1, r3
	sub	sp, fp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, fp}
	bx	lr
	.size	fixed_multiplication, .-fixed_multiplication
	.global	__aeabi_ldivmod
	.align	2
	.global	fixed_division
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	fixed_division, %function
fixed_division:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	strd	r0, [fp, #-12]
	strd	r2, [fp, #-20]
	ldrd	r2, [fp, #-12]
	mov	r0, #0
	mov	r1, #0
	lsl	r1, r3, #16
	orr	r1, r1, r2, lsr #16
	lsl	r0, r2, #16
	ldrd	r2, [fp, #-20]
	bl	__aeabi_ldivmod
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	fixed_division, .-fixed_division
	.align	2
	.global	findLargestinCol
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	findLargestinCol, %function
findLargestinCol:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #36
	str	r0, [fp, #-32]
	mov	r3, r1
	strh	r3, [fp, #-34]	@ movhi
	ldrsh	r2, [fp, #-34]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #5
	mov	r2, r3
	ldr	r3, [fp, #-32]
	add	r2, r3, r2
	ldrsh	r3, [fp, #-34]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r2, [r3]
	strd	r2, [fp, #-12]
	ldrh	r3, [fp, #-34]	@ movhi
	strh	r3, [fp, #-16]	@ movhi
	ldrh	r3, [fp, #-34]
	add	r3, r3, #1
	uxth	r3, r3
	strh	r3, [fp, #-14]	@ movhi
	b	.L6
.L8:
	ldrsh	r2, [fp, #-14]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #5
	mov	r2, r3
	ldr	r3, [fp, #-32]
	add	r2, r3, r2
	ldrsh	r3, [fp, #-34]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r2, [r3]
	mov	r3, r2
	cmp	r3, #0
	rsblt	r3, r3, #0
	mov	r2, r3
	asr	r3, r2, #31
	strd	r2, [fp, #-28]
	ldrd	r2, [fp, #-28]
	ldrd	r0, [fp, #-12]
	cmp	r0, r2
	sbcs	r3, r1, r3
	bge	.L7
	ldrd	r2, [fp, #-28]
	strd	r2, [fp, #-12]
	ldrh	r3, [fp, #-14]	@ movhi
	strh	r3, [fp, #-16]	@ movhi
.L7:
	ldrh	r3, [fp, #-14]
	add	r3, r3, #1
	uxth	r3, r3
	strh	r3, [fp, #-14]	@ movhi
.L6:
	ldrsh	r3, [fp, #-14]
	cmp	r3, #99
	ble	.L8
	ldrsh	r3, [fp, #-16]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	findLargestinCol, .-findLargestinCol
	.section	.rodata
	.align	2
.LC0:
	.ascii	"\012Inverse Matrix is:\000"
	.align	2
.LC1:
	.ascii	"%i\011\000"
	.text
	.align	2
	.global	printMatrix
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	printMatrix, %function
printMatrix:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	movw	r0, #:lower16:.LC0
	movt	r0, #:upper16:.LC0
	bl	puts
	mov	r4, #0
	b	.L11
.L14:
	mov	r5, #0
	b	.L12
.L13:
	mov	r2, r4
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #5
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r2, r3, r2
	mov	r3, r5
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r2, [r3]
	sxth	r3, r2
	mov	r1, r3
	movw	r0, #:lower16:.LC1
	movt	r0, #:upper16:.LC1
	bl	printf
	uxth	r3, r5
	add	r3, r3, #1
	uxth	r3, r3
	sxth	r5, r3
.L12:
	cmp	r5, #99
	ble	.L13
	mov	r0, #10
	bl	putchar
	uxth	r3, r4
	add	r3, r3, #1
	uxth	r3, r3
	sxth	r4, r3
.L11:
	cmp	r4, #99
	ble	.L14
	nop
	sub	sp, fp, #12
	@ sp needed
	pop	{r4, r5, fp, pc}
	.size	printMatrix, .-printMatrix
	.align	2
	.global	swapRows
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	swapRows, %function
swapRows:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	mov	r3, r1
	strh	r3, [fp, #-26]	@ movhi
	mov	r3, r2	@ movhi
	strh	r3, [fp, #-28]	@ movhi
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L16
.L17:
	ldrsh	r2, [fp, #-28]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #5
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r2, r3, r2
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r2, [r3]
	strd	r2, [fp, #-20]
	ldrsh	r2, [fp, #-26]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #5
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r1, r3, r2
	ldrsh	r2, [fp, #-28]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #5
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r0, r3, r2
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #3
	add	r3, r1, r3
	ldrd	r2, [r3]
	ldr	r1, [fp, #-8]
	lsl	r1, r1, #3
	add	r1, r0, r1
	strd	r2, [r1]
	ldrsh	r2, [fp, #-26]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #5
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r2, r3, r2
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #3
	add	r1, r2, r3
	ldrd	r2, [fp, #-20]
	strd	r2, [r1]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L16:
	ldr	r3, [fp, #-8]
	cmp	r3, #99
	ble	.L17
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	swapRows, .-swapRows
	.section	.rodata
	.align	2
.LC2:
	.ascii	"The matrix is ill-conditioned.\000"
	.text
	.align	2
	.global	gaussJordan
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	gaussJordan, %function
gaussJordan:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, fp, lr}
	add	fp, sp, #28
	sub	sp, sp, #32
	str	r0, [fp, #-48]
	str	r1, [fp, #-52]
	mov	r4, #0
	b	.L19
.L20:
	mov	r2, r4
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #5
	mov	r2, r3
	ldr	r3, [fp, #-52]
	add	r2, r3, r2
	mov	r3, r4
	lsl	r3, r3, #3
	add	r1, r2, r3
	mov	r2, #65536
	mov	r3, #0
	strd	r2, [r1]
	uxth	r3, r4
	add	r3, r3, #1
	uxth	r3, r3
	sxth	r4, r3
.L19:
	cmp	r4, #99
	ble	.L20
	mov	r4, #0
	b	.L21
.L24:
	mov	r5, #0
	b	.L22
.L23:
	mov	r2, r4
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #5
	mov	r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	mov	r3, r5
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r0, [r3]
	mov	r2, r4
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #5
	mov	r2, r3
	ldr	r3, [fp, #-48]
	add	ip, r3, r2
	mov	lr, r5
	mov	r2, #0
	mov	r3, #0
	lsl	r3, r1, #16
	orr	r3, r3, r0, lsr #16
	lsl	r2, r0, #16
	lsl	r1, lr, #3
	add	r1, ip, r1
	strd	r2, [r1]
	uxth	r3, r5
	add	r3, r3, #1
	uxth	r3, r3
	sxth	r5, r3
.L22:
	cmp	r5, #99
	ble	.L23
	uxth	r3, r4
	add	r3, r3, #1
	uxth	r3, r3
	sxth	r4, r3
.L21:
	cmp	r4, #99
	ble	.L24
	mov	r4, #0
	b	.L25
.L32:
	mov	r1, r4
	ldr	r0, [fp, #-48]
	bl	findLargestinCol
	mov	r3, r0
	strh	r3, [fp, #-32]	@ movhi
	ldrsh	r3, [fp, #-32]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, [fp, #-48]
	bl	swapRows
	ldrsh	r3, [fp, #-32]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, [fp, #-52]
	bl	swapRows
	mov	r2, r4
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #5
	mov	r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	mov	r3, r4
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r2, [r3]
	orrs	r3, r2, r3
	bne	.L26
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	bl	puts
	mov	r0, #0
	bl	exit
.L26:
	mov	r5, #0
	b	.L27
.L31:
	cmp	r4, r5
	beq	.L28
	mov	r2, r5
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #5
	mov	r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	mov	r3, r4
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r0, [r3]
	mov	r2, r4
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #5
	mov	r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	mov	r3, r4
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r2, [r3]
	bl	fixed_division
	strd	r0, [fp, #-44]
	mov	r3, #0
	strh	r3, [fp, #-30]	@ movhi
	b	.L29
.L30:
	mov	r2, r5
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #5
	mov	r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	ldrsh	r3, [fp, #-30]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r6, [r3]
	mov	r2, r4
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #5
	mov	r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	ldrsh	r3, [fp, #-30]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r2, [r3]
	ldrd	r0, [fp, #-44]
	bl	fixed_multiplication
	mov	r2, r5
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #5
	mov	r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	ldrsh	r3, [fp, #-30]
	subs	r8, r6, r0
	sbc	r9, r7, r1
	lsl	r3, r3, #3
	add	r3, r2, r3
	strd	r8, [r3]
	mov	r2, r5
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #5
	mov	r2, r3
	ldr	r3, [fp, #-52]
	add	r2, r3, r2
	ldrsh	r3, [fp, #-30]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r6, [r3]
	mov	r2, r4
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #5
	mov	r2, r3
	ldr	r3, [fp, #-52]
	add	r2, r3, r2
	ldrsh	r3, [fp, #-30]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r2, [r3]
	ldrd	r0, [fp, #-44]
	bl	fixed_multiplication
	mov	r2, r5
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #5
	mov	r2, r3
	ldr	r3, [fp, #-52]
	add	r2, r3, r2
	ldrsh	r3, [fp, #-30]
	subs	ip, r6, r0
	str	ip, [fp, #-60]
	sbc	r1, r7, r1
	str	r1, [fp, #-56]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r0, [fp, #-60]
	strd	r0, [r3]
	ldrh	r3, [fp, #-30]
	add	r3, r3, #1
	uxth	r3, r3
	strh	r3, [fp, #-30]	@ movhi
.L29:
	ldrsh	r3, [fp, #-30]
	cmp	r3, #99
	ble	.L30
.L28:
	uxth	r3, r5
	add	r3, r3, #1
	uxth	r3, r3
	sxth	r5, r3
.L27:
	cmp	r5, #99
	ble	.L31
	uxth	r3, r4
	add	r3, r3, #1
	uxth	r3, r3
	sxth	r4, r3
.L25:
	cmp	r4, #99
	ble	.L32
	mov	r4, #0
	b	.L33
.L36:
	mov	r5, #0
	b	.L34
.L35:
	mov	r2, r4
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #5
	mov	r2, r3
	ldr	r3, [fp, #-52]
	add	r2, r3, r2
	mov	r3, r5
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r0, [r3]
	mov	r2, r4
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #5
	mov	r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r3, r2
	mov	r3, r4
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r6, [r3]
	mov	r2, r4
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #5
	mov	r2, r3
	ldr	r3, [fp, #-52]
	add	r8, r3, r2
	mov	r9, r5
	mov	r2, r6
	mov	r3, r7
	bl	fixed_division
	mov	r2, r0
	mov	r3, r1
	lsl	r1, r9, #3
	add	r1, r8, r1
	strd	r2, [r1]
	uxth	r3, r5
	add	r3, r3, #1
	uxth	r3, r3
	sxth	r5, r3
.L34:
	cmp	r5, #99
	ble	.L35
	uxth	r3, r4
	add	r3, r3, #1
	uxth	r3, r3
	sxth	r4, r3
.L33:
	cmp	r4, #99
	ble	.L36
	nop
	sub	sp, fp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
	.size	gaussJordan, .-gaussJordan
	.section	.rodata
	.align	2
.LC3:
	.ascii	"Usage: ./<executable> <matrix input file>\000"
	.align	2
.LC4:
	.ascii	"r\000"
	.align	2
.LC5:
	.ascii	"Bad file name.\000"
	.align	2
.LC6:
	.ascii	"%lli\000"
	.align	2
.LC7:
	.ascii	"Check file or ORDER constant.\000"
	.align	2
.LC8:
	.ascii	"Time to run algorithm: %fms\012Time to run full pro"
	.ascii	"gram: %fms\012\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 160048
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #159744
	sub	sp, sp, #312
	sub	r3, fp, #159744
	sub	r3, r3, #4
	str	r0, [r3, #-300]
	sub	r3, fp, #159744
	sub	r3, r3, #4
	str	r1, [r3, #-304]
	sub	r3, fp, #159744
	sub	r3, r3, #4
	ldr	r3, [r3, #-300]
	cmp	r3, #2
	beq	.L38
	movw	r0, #:lower16:.LC3
	movt	r0, #:upper16:.LC3
	bl	puts
	mov	r0, #1
	bl	exit
.L38:
	bl	clock
	str	r0, [fp, #-16]
	sub	r3, fp, #159744
	sub	r3, r3, #4
	sub	r0, r3, #296
	mov	r3, #14464
	movt	r3, 1
	mov	r2, r3
	mov	r1, #0
	bl	memset
	sub	r3, fp, #159744
	sub	r3, r3, #4
	ldr	r3, [r3, #-304]
	add	r3, r3, #4
	ldr	r3, [r3]
	movw	r1, #:lower16:.LC4
	movt	r1, #:upper16:.LC4
	mov	r0, r3
	bl	fopen
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L39
	movw	r0, #:lower16:.LC5
	movt	r0, #:upper16:.LC5
	bl	puts
	mov	r0, #1
	bl	exit
.L39:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L40
.L44:
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L41
.L43:
	sub	r2, fp, #79872
	sub	r2, r2, #4
	sub	r2, r2, #168
	ldr	r1, [fp, #-12]
	mov	r3, r1
	lsl	r3, r3, #2
	add	r3, r3, r1
	lsl	r1, r3, #2
	add	r3, r3, r1
	lsl	r3, r3, #2
	ldr	r1, [fp, #-8]
	add	r3, r3, r1
	lsl	r3, r3, #3
	add	r3, r2, r3
	mov	r2, r3
	movw	r1, #:lower16:.LC6
	movt	r1, #:upper16:.LC6
	ldr	r0, [fp, #-20]
	bl	__isoc99_fscanf
	mov	r3, r0
	cmp	r3, #1
	beq	.L42
	movw	r0, #:lower16:.LC7
	movt	r0, #:upper16:.LC7
	bl	puts
	mov	r0, #1
	bl	exit
.L42:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L41:
	ldr	r3, [fp, #-8]
	cmp	r3, #99
	ble	.L43
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L40:
	ldr	r3, [fp, #-12]
	cmp	r3, #99
	ble	.L44
	ldr	r0, [fp, #-20]
	bl	fclose
	sub	r2, fp, #159744
	sub	r2, r2, #4
	sub	r2, r2, #296
	sub	r3, fp, #79872
	sub	r3, r3, #4
	sub	r3, r3, #168
	mov	r1, r2
	mov	r0, r3
	bl	gaussJordan
	bl	clock
	str	r0, [fp, #-24]
	sub	r3, fp, #159744
	sub	r3, r3, #4
	sub	r3, r3, #296
	mov	r0, r3
	bl	printMatrix
	bl	clock
	str	r0, [fp, #-28]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	sub	r3, r2, r3
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d6, .L46
	vmul.f64	d6, d7, d6
	vldr.64	d5, .L46+8
	vdiv.f64	d7, d6, d5
	vstr.64	d7, [fp, #-36]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-16]
	sub	r3, r2, r3
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d6, .L46
	vmul.f64	d6, d7, d6
	vldr.64	d5, .L46+8
	vdiv.f64	d7, d6, d5
	vstr.64	d7, [fp, #-44]
	ldrd	r2, [fp, #-44]
	strd	r2, [sp]
	ldrd	r2, [fp, #-36]
	movw	r0, #:lower16:.LC8
	movt	r0, #:upper16:.LC8
	bl	printf
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L47:
	.align	3
.L46:
	.word	0
	.word	1083129856
	.word	0
	.word	1093567616
	.size	main, .-main
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
