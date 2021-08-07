.LC0:
	.ascii	"\012Inverse Matrix is:\000"
	.global	__aeabi_f2d
	.align	2
.LC1:
	.ascii	"%f\011\000"
	.text
	.align	2
	.global	printMatrix
	.type	printMatrix, %function
printMatrix:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	ldr	r0, .L7
	bl	puts
	mov	r1, #0
	str	r1, [fp, #-24]
	b	.L2
.L5:
	mov	r2, #0
	str	r2, [fp, #-20]
	b	.L3
.L4:
	ldr	r1, [fp, #-24]
	mov	r3, r1, asl #16
	mov	r3, r3, asr #16
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-16]
	add	r2, r3, r2
	ldr	r1, [fp, #-20]
	mov	r3, r1, asl #16
	mov	r3, r3, asr #16
	ldr	r3, [r2, r3, asl #2]	@ float
	mov	r0, r3
	bl	__aeabi_f2d
	mov	r3, r0
	mov	r4, r1
	ldr	r0, .L7+4
	mov	r2, r3
	mov	r3, r4
	bl	printf
	ldr	r2, [fp, #-24]
	mov	r3, r2, asl #16
	mov	r3, r3, asr #16
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-16]
	add	r2, r3, r2
	ldr	r1, [fp, #-20]
	mov	r3, r1, asl #16
	mov	r3, r3, asr #16
	add	r3, r3, #1
	ldr	r3, [r2, r3, asl #2]	@ float
	mov	r0, r3
	bl	__aeabi_f2d
	mov	r3, r0
	mov	r4, r1
	ldr	r0, .L7+4
	mov	r2, r3
	mov	r3, r4
	bl	printf
	ldr	r2, [fp, #-20]
	mov	r3, r2, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #2
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	str	r3, [fp, #-20]
.L3:
	ldr	r1, [fp, #-20]
	mov	r3, r1, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #2
	ble	.L4
	mov	r0, #10
	bl	putchar
	ldr	r2, [fp, #-24]
	mov	r3, r2	@ movhi
	add	r3, r3, #1
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	str	r3, [fp, #-24]
.L2:
	ldr	r1, [fp, #-24]
	mov	r3, r1, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #3
	ble	.L5
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	.LC0
	.word	.LC1
	.size	printMatrix, .-printMatrix
	.align	2
	.global	swapRows
	.type	swapRows, %function
swapRows:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-16]
	mov	r3, r1
	strh	r3, [fp, #-18]	@ movhi
	strh	r2, [fp, #-20]	@ movhi
	mov	r1, #0
	str	r1, [fp, #-24]
	b	.L10
.L11:
	ldrsh	r3, [fp, #-20]
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-16]
	add	r2, r3, r2
	ldr	ip, [fp, #-24]
	mov	r3, ip, asl #16
	mov	r3, r3, asr #16
	ldr	r3, [r2, r3, asl #2]	@ float
	str	r3, [fp, #-8]	@ float
	ldrsh	r3, [fp, #-20]
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-16]
	add	r1, r3, r2
	ldr	r2, [fp, #-24]
	mov	r3, r2, asl #16
	mov	r0, r3, asr #16
	ldrsh	r3, [fp, #-18]
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-16]
	add	r2, r3, r2
	ldr	ip, [fp, #-24]
	mov	r3, ip, asl #16
	mov	r3, r3, asr #16
	ldr	r3, [r2, r3, asl #2]	@ float
	str	r3, [r1, r0, asl #2]	@ float
	ldrsh	r3, [fp, #-18]
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-16]
	add	r1, r3, r2
	ldr	r2, [fp, #-24]
	mov	r3, r2, asl #16
	mov	r2, r3, asr #16
	ldr	r3, [fp, #-8]	@ float
	str	r3, [r1, r2, asl #2]	@ float
	ldrsh	r3, [fp, #-20]
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-16]
	add	r2, r3, r2
	ldr	ip, [fp, #-24]
	mov	r3, ip, asl #16
	mov	r3, r3, asr #16
	add	r3, r3, #1
	ldr	r3, [r2, r3, asl #2]	@ float
	str	r3, [fp, #-8]	@ float
	ldrsh	r3, [fp, #-20]
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-16]
	add	r0, r3, r2
	ldr	r1, [fp, #-24]
	mov	r3, r1, asl #16
	mov	r3, r3, asr #16
	add	r1, r3, #1
	ldrsh	r3, [fp, #-18]
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-16]
	add	r2, r3, r2
	ldr	ip, [fp, #-24]
	mov	r3, ip, asl #16
	mov	r3, r3, asr #16
	add	r3, r3, #1
	ldr	r3, [r2, r3, asl #2]	@ float
	str	r3, [r0, r1, asl #2]	@ float
	ldrsh	r3, [fp, #-18]
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-16]
	add	r1, r3, r2
	ldr	r2, [fp, #-24]
	mov	r3, r2, asl #16
	mov	r3, r3, asr #16
	add	r2, r3, #1
	ldr	r3, [fp, #-8]	@ float
	str	r3, [r1, r2, asl #2]	@ float
	ldr	ip, [fp, #-24]
	mov	r3, ip, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #2
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	str	r3, [fp, #-24]
.L10:
	ldr	r1, [fp, #-24]
	mov	r3, r1, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #2
	ble	.L11
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	swapRows, .-swapRows
	.global	__aeabi_f2iz
	.global	__aeabi_fcmpeq
	.section	.rodata
	.align	2
.LC2:
	.ascii	"The matrix is ill-conditioned.\000"
	.global	__aeabi_fdiv
	.global	__aeabi_fmul
	.global	__aeabi_fsub
	.text
	.align	2
	.global	gaussJordan
	.type	gaussJordan, %function
gaussJordan:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, fp, lr}
	add	fp, sp, #16
	sub	sp, sp, #52
	str	r0, [fp, #-56]
	str	r1, [fp, #-60]
	mov	r0, #0
	str	r0, [fp, #-68]
	b	.L14
.L15:
	ldr	r1, [fp, #-68]
	mov	r3, r1, asl #16
	mov	r3, r3, asr #16
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-60]
	add	r1, r3, r2
	ldr	r2, [fp, #-68]
	mov	r3, r2, asl #16
	mov	r2, r3, asr #16
	ldr	r3, .L38	@ float
	str	r3, [r1, r2, asl #2]	@ float
	ldr	r0, [fp, #-68]
	mov	r3, r0, asl #16
	mov	r3, r3, asr #16
	add	r3, r3, #1
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-60]
	add	r1, r3, r2
	ldr	r2, [fp, #-68]
	mov	r3, r2, asl #16
	mov	r3, r3, asr #16
	add	r2, r3, #1
	ldr	r3, .L38	@ float
	str	r3, [r1, r2, asl #2]	@ float
	ldr	r0, [fp, #-68]
	mov	r3, r0, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #2
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	str	r3, [fp, #-68]
.L14:
	ldr	r1, [fp, #-68]
	mov	r3, r1, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #3
	ble	.L15
	mov	r2, #0
	str	r2, [fp, #-68]
	b	.L16
.L30:
	ldr	r0, [fp, #-68]
	mov	r3, r0, asl #16
	mov	r3, r3, asr #16
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-56]
	add	r2, r3, r2
	ldr	r1, [fp, #-68]
	mov	r3, r1, asl #16
	mov	r3, r3, asr #16
	ldr	r3, [r2, r3, asl #2]	@ float
	mov	r0, r3
	bl	__aeabi_f2iz
	mov	r3, r0
	strh	r3, [fp, #-48]	@ movhi
	ldr	r2, [fp, #-68]
	strh	r2, [fp, #-42]	@ movhi
	ldr	r0, [fp, #-68]
	mov	r3, r0, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #1
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-44]	@ movhi
	b	.L17
.L20:
	ldrsh	r3, [fp, #-44]
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-56]
	add	r2, r3, r2
	ldr	r1, [fp, #-68]
	mov	r3, r1, asl #16
	mov	r3, r3, asr #16
	ldr	r3, [r2, r3, asl #2]	@ float
	mov	r0, r3
	bl	__aeabi_f2iz
	mov	r3, r0
	cmp	r3, #0
	rsblt	r3, r3, #0
	strh	r3, [fp, #-46]	@ movhi
	ldrsh	r2, [fp, #-46]
	ldrsh	r3, [fp, #-48]
	cmp	r2, r3
	ble	.L18
	ldrh	r3, [fp, #-46]	@ movhi
	strh	r3, [fp, #-48]	@ movhi
	ldrh	r3, [fp, #-44]	@ movhi
	strh	r3, [fp, #-42]	@ movhi
.L18:
	ldrsh	r3, [fp, #-44]
	add	r3, r3, #1
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-56]
	add	r2, r3, r2
	ldr	r0, [fp, #-68]
	mov	r3, r0, asl #16
	mov	r3, r3, asr #16
	ldr	r3, [r2, r3, asl #2]	@ float
	mov	r0, r3
	bl	__aeabi_f2iz
	mov	r3, r0
	cmp	r3, #0
	rsblt	r3, r3, #0
	strh	r3, [fp, #-46]	@ movhi
	ldrsh	r2, [fp, #-46]
	ldrsh	r3, [fp, #-48]
	cmp	r2, r3
	ble	.L19
	ldrh	r3, [fp, #-46]	@ movhi
	strh	r3, [fp, #-48]	@ movhi
	ldrh	r3, [fp, #-44]
	add	r3, r3, #1
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-42]	@ movhi
.L19:
	ldrh	r3, [fp, #-44]
	add	r3, r3, #2
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-44]	@ movhi
.L17:
	ldrsh	r3, [fp, #-44]
	cmp	r3, #2
	ble	.L20
	ldrsh	r2, [fp, #-42]
	ldr	r1, [fp, #-68]
	mov	r3, r1, asl #16
	mov	r3, r3, asr #16
	ldr	r0, [fp, #-56]
	mov	r1, r2
	mov	r2, r3
	bl	swapRows
	ldrsh	r2, [fp, #-42]
	ldr	r0, [fp, #-68]
	mov	r3, r0, asl #16
	mov	r3, r3, asr #16
	ldr	r0, [fp, #-60]
	mov	r1, r2
	mov	r2, r3
	bl	swapRows
	ldr	r1, [fp, #-68]
	mov	r3, r1, asl #16
	mov	r3, r3, asr #16
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-56]
	add	r2, r3, r2
	ldr	r0, [fp, #-68]
	mov	r3, r0, asl #16
	mov	r3, r3, asr #16
	ldr	r3, [r2, r3, asl #2]	@ float
	mov	r0, r3
	ldr	r1, .L38+4	@ float
	bl	__aeabi_fcmpeq
	mov	r3, r0
	cmp	r3, #0
	beq	.L37
.L36:
	ldr	r0, .L38+8
	bl	puts
	mov	r0, #0
	bl	exit
.L37:
	mov	r1, #0
	str	r1, [fp, #-64]
	b	.L23
.L29:
	ldr	r2, [fp, #-68]
	mov	r3, r2, asl #16
	mov	r2, r3, asr #16
	ldr	r0, [fp, #-64]
	mov	r3, r0, asl #16
	mov	r3, r3, asr #16
	cmp	r2, r3
	beq	.L24
	ldr	r1, [fp, #-64]
	mov	r3, r1, asl #16
	mov	r3, r3, asr #16
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-56]
	add	r2, r3, r2
	ldr	r0, [fp, #-68]
	mov	r3, r0, asl #16
	mov	r3, r3, asr #16
	ldr	r1, [r2, r3, asl #2]	@ float
	ldr	r2, [fp, #-68]
	mov	r3, r2, asl #16
	mov	r3, r3, asr #16
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-56]
	add	r2, r3, r2
	ldr	r0, [fp, #-68]
	mov	r3, r0, asl #16
	mov	r3, r3, asr #16
	ldr	r3, [r2, r3, asl #2]	@ float
	mov	r0, r1
	mov	r1, r3
	bl	__aeabi_fdiv
	mov	r3, r0
	str	r3, [fp, #-40]	@ float
	mov	r3, #0
	strh	r3, [fp, #-44]	@ movhi
	b	.L25
.L26:
	ldr	r1, [fp, #-64]
	mov	r3, r1, asl #16
	mov	r3, r3, asr #16
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-56]
	add	r4, r3, r2
	ldrsh	r5, [fp, #-44]
	ldr	r2, [fp, #-64]
	mov	r3, r2, asl #16
	mov	r3, r3, asr #16
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-56]
	add	r2, r3, r2
	ldrsh	r3, [fp, #-44]
	ldr	r6, [r2, r3, asl #2]	@ float
	ldr	r0, [fp, #-68]
	mov	r3, r0, asl #16
	mov	r3, r3, asr #16
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-56]
	add	r2, r3, r2
	ldrsh	r3, [fp, #-44]
	ldr	r3, [r2, r3, asl #2]	@ float
	ldr	r2, [fp, #-40]	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r0, r6
	mov	r1, r3
	bl	__aeabi_fsub
	mov	r3, r0
	str	r3, [r4, r5, asl #2]	@ float
	ldr	r1, [fp, #-64]
	mov	r3, r1, asl #16
	mov	r3, r3, asr #16
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-56]
	add	r4, r3, r2
	ldrsh	r3, [fp, #-44]
	add	r5, r3, #1
	ldr	r2, [fp, #-64]
	mov	r3, r2, asl #16
	mov	r3, r3, asr #16
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-56]
	add	r2, r3, r2
	ldrsh	r3, [fp, #-44]
	add	r3, r3, #1
	ldr	r6, [r2, r3, asl #2]	@ float
	ldr	r0, [fp, #-68]
	mov	r3, r0, asl #16
	mov	r3, r3, asr #16
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-56]
	add	r2, r3, r2
	ldrsh	r3, [fp, #-44]
	add	r3, r3, #1
	ldr	r3, [r2, r3, asl #2]	@ float
	ldr	r2, [fp, #-40]	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r0, r6
	mov	r1, r3
	bl	__aeabi_fsub
	mov	r3, r0
	str	r3, [r4, r5, asl #2]	@ float
	ldrh	r3, [fp, #-44]
	add	r3, r3, #2
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-44]	@ movhi
.L25:
	ldrsh	r3, [fp, #-44]
	cmp	r3, #2
	ble	.L26
	mov	r3, #0
	strh	r3, [fp, #-44]	@ movhi
	b	.L27
.L28:
	ldr	r1, [fp, #-64]
	mov	r3, r1, asl #16
	mov	r3, r3, asr #16
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-60]
	add	r4, r3, r2
	ldrsh	r5, [fp, #-44]
	ldr	r2, [fp, #-64]
	mov	r3, r2, asl #16
	mov	r3, r3, asr #16
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-60]
	add	r2, r3, r2
	ldrsh	r3, [fp, #-44]
	ldr	r6, [r2, r3, asl #2]	@ float
	ldr	r0, [fp, #-68]
	mov	r3, r0, asl #16
	mov	r3, r3, asr #16
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-60]
	add	r2, r3, r2
	ldrsh	r3, [fp, #-44]
	ldr	r3, [r2, r3, asl #2]	@ float
	ldr	r2, [fp, #-40]	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r0, r6
	mov	r1, r3
	bl	__aeabi_fsub
	mov	r3, r0
	str	r3, [r4, r5, asl #2]	@ float
	ldr	r1, [fp, #-64]
	mov	r3, r1, asl #16
	mov	r3, r3, asr #16
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-60]
	add	r4, r3, r2
	ldrsh	r3, [fp, #-44]
	add	r5, r3, #1
	ldr	r2, [fp, #-64]
	mov	r3, r2, asl #16
	mov	r3, r3, asr #16
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-60]
	add	r2, r3, r2
	ldrsh	r3, [fp, #-44]
	add	r3, r3, #1
	ldr	r6, [r2, r3, asl #2]	@ float
	ldr	r0, [fp, #-68]
	mov	r3, r0, asl #16
	mov	r3, r3, asr #16
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-60]
	add	r2, r3, r2
	ldrsh	r3, [fp, #-44]
	add	r3, r3, #1
	ldr	r3, [r2, r3, asl #2]	@ float
	ldr	r2, [fp, #-40]	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r0, r6
	mov	r1, r3
	bl	__aeabi_fsub
	mov	r3, r0
	str	r3, [r4, r5, asl #2]	@ float
	ldrh	r3, [fp, #-44]
	add	r3, r3, #2
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-44]	@ movhi
.L27:
	ldrsh	r3, [fp, #-44]
	cmp	r3, #2
	ble	.L28
.L24:
	ldr	r1, [fp, #-64]
	mov	r3, r1	@ movhi
	add	r3, r3, #1
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	str	r3, [fp, #-64]
.L23:
	ldr	r2, [fp, #-64]
	mov	r3, r2, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #3
	ble	.L29
	ldr	r0, [fp, #-68]
	mov	r3, r0	@ movhi
	add	r3, r3, #1
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	str	r3, [fp, #-68]
.L16:
	ldr	r1, [fp, #-68]
	mov	r3, r1, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #3
	ble	.L30
	mov	r2, #0
	str	r2, [fp, #-68]
	b	.L31
.L34:
	ldr	r0, [fp, #-68]
	mov	r3, r0, asl #16
	mov	r3, r3, asr #16
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-56]
	add	r2, r3, r2
	ldr	r1, [fp, #-68]
	mov	r3, r1, asl #16
	mov	r3, r3, asr #16
	ldr	r3, [r2, r3, asl #2]	@ float
	str	r3, [fp, #-36]	@ float
	ldr	r2, [fp, #-68]
	mov	r3, r2, asl #16
	mov	r3, r3, asr #16
	add	r3, r3, #1
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-56]
	add	r2, r3, r2
	ldr	r0, [fp, #-68]
	mov	r3, r0, asl #16
	mov	r3, r3, asr #16
	add	r3, r3, #1
	ldr	r3, [r2, r3, asl #2]	@ float
	str	r3, [fp, #-32]	@ float
	ldr	r1, [fp, #-68]
	mov	r3, r1, asl #16
	mov	r3, r3, asr #16
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	ldr	r3, [r3, #0]	@ float
	str	r3, [fp, #-28]	@ float
	ldr	r2, [fp, #-68]
	mov	r3, r2, asl #16
	mov	r3, r3, asr #16
	add	r3, r3, #1
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-60]
	add	r3, r3, r2
	ldr	r3, [r3, #0]	@ float
	str	r3, [fp, #-24]	@ float
	mov	r3, #0
	str	r3, [fp, #-64]
	b	.L32
.L33:
	ldr	r0, [fp, #-68]
	mov	r3, r0, asl #16
	mov	r3, r3, asr #16
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-60]
	add	r4, r3, r2
	ldr	r1, [fp, #-64]
	mov	r3, r1, asl #16
	mov	r5, r3, asr #16
	ldr	r3, [fp, #-28]	@ float
	ldr	r2, [fp, #-36]	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fdiv
	mov	r3, r0
	str	r3, [r4, r5, asl #2]	@ float
	ldr	r2, [fp, #-68]
	mov	r3, r2, asl #16
	mov	r3, r3, asr #16
	add	r3, r3, #1
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-60]
	add	r4, r3, r2
	ldr	r0, [fp, #-64]
	mov	r3, r0, asl #16
	mov	r5, r3, asr #16
	ldr	r3, [fp, #-24]	@ float
	ldr	r2, [fp, #-32]	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fdiv
	mov	r3, r0
	str	r3, [r4, r5, asl #2]	@ float
	ldr	r1, [fp, #-68]
	mov	r3, r1, asl #16
	mov	r3, r3, asr #16
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-60]
	add	r2, r3, r2
	ldr	r0, [fp, #-64]
	mov	r3, r0, asl #16
	mov	r3, r3, asr #16
	add	r3, r3, #1
	ldr	r3, [r2, r3, asl #2]	@ float
	str	r3, [fp, #-28]	@ float
	ldr	r1, [fp, #-68]
	mov	r3, r1, asl #16
	mov	r3, r3, asr #16
	add	r3, r3, #1
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-60]
	add	r2, r3, r2
	ldr	r0, [fp, #-64]
	mov	r3, r0, asl #16
	mov	r3, r3, asr #16
	add	r3, r3, #1
	ldr	r3, [r2, r3, asl #2]	@ float
	str	r3, [fp, #-24]	@ float
	ldr	r1, [fp, #-64]
	mov	r3, r1	@ movhi
	add	r3, r3, #1
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	str	r3, [fp, #-64]
.L32:
	ldr	r2, [fp, #-64]
	mov	r3, r2, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #2
	ble	.L33
	ldr	r0, [fp, #-68]
	mov	r3, r0, asl #16
	mov	r3, r3, asr #16
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-60]
	add	r4, r3, r2
	ldr	r3, [fp, #-28]	@ float
	ldr	r2, [fp, #-36]	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fdiv
	mov	r3, r0
	str	r3, [r4, #12]	@ float
	ldr	r1, [fp, #-68]
	mov	r3, r1, asl #16
	mov	r3, r3, asr #16
	add	r3, r3, #1
	mov	r2, r3, asl #4
	ldr	r3, [fp, #-60]
	add	r4, r3, r2
	ldr	r3, [fp, #-24]	@ float
	ldr	r2, [fp, #-32]	@ float
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_fdiv
	mov	r3, r0
	str	r3, [r4, #12]	@ float
	ldr	r2, [fp, #-68]
	mov	r3, r2, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #2
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	str	r3, [fp, #-68]
.L31:
	ldr	r0, [fp, #-68]
	mov	r3, r0, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #2
	ble	.L34
	sub	sp, fp, #16
	ldmfd	sp!, {r4, r5, r6, fp, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	1065353216
	.word	0
	.word	.LC2
	.size	gaussJordan, .-gaussJordan
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.section	.rodata
	.align	2
.LC3:
	.ascii	"Time to run algorithm: %fms\012Time to run full pro"
	.ascii	"gram: %fms\012\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 168
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, fp, lr}
	add	fp, sp, #16
	sub	sp, sp, #180
	str	r0, [fp, #-184]
	str	r1, [fp, #-188]
	bl	clock
	mov	r3, r0
	str	r3, [fp, #-48]
	sub	r3, fp, #176
	mov	r2, #64
	mov	r0, r3
	mov	r1, #0
	bl	memset
	ldr	r3, [fp, #-184]
	cmp	r3, #1
	ble	.L41
	sub	r3, fp, #112
	mov	r0, r3
	ldr	r1, .L44
	mov	r2, #100
	bl	memcpy
	b	.L42
.L41:
	sub	r3, fp, #112
	mov	r0, r3
	ldr	r1, .L44+4
	mov	r2, #64
	bl	memcpy
.L42:
	sub	r3, fp, #112
	sub	r2, fp, #176
	mov	r0, r3
	mov	r1, r2
	bl	gaussJordan
	bl	clock
	mov	r3, r0
	str	r3, [fp, #-44]
	sub	r3, fp, #176
	mov	r0, r3
	bl	printMatrix
	bl	clock
	mov	r3, r0
	str	r3, [fp, #-40]
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-48]
	rsb	r3, r3, r2
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r3, r0
	mov	r4, r1
	mov	r5, #0
	mov	r6, #1073741824
	add	r6, r6, #9371648
	add	r6, r6, #16384
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_dmul
	mov	r3, r0
	mov	r4, r1
	mov	r5, #0
	mov	r6, #1090519040
	add	r6, r6, #3047424
	add	r6, r6, #1152
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_ddiv
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-36]
	str	r4, [fp, #-32]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-48]
	rsb	r3, r3, r2
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r3, r0
	mov	r4, r1
	mov	r5, #0
	mov	r6, #1073741824
	add	r6, r6, #9371648
	add	r6, r6, #16384
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_dmul
	mov	r3, r0
	mov	r4, r1
	mov	r5, #0
	mov	r6, #1090519040
	add	r6, r6, #3047424
	add	r6, r6, #1152
	mov	r0, r3
	mov	r1, r4
	mov	r2, r5
	mov	r3, r6
	bl	__aeabi_ddiv
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-28]
	str	r4, [fp, #-24]
	sub	r4, fp, #28
	ldmia	r4, {r3-r4}
	stmia	sp, {r3-r4}
	ldr	r0, .L44+8
	sub	r3, fp, #36
	ldmia	r3, {r2-r3}
	bl	printf
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp!, {r4, r5, r6, fp, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	illCondTest5
	.word	wellCondTest4
	.word	.LC3
	.size	main, .-main
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
