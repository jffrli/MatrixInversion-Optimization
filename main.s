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
	.arch armv7-a
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
	b	.L2
.L5:
	mov	r5, #0
	b	.L3
.L4:
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
.L3:
	cmp	r5, #99
	ble	.L4
	mov	r0, #10
	bl	putchar
	uxth	r3, r4
	add	r3, r3, #1
	uxth	r3, r3
	sxth	r4, r3
.L2:
	cmp	r4, #99
	ble	.L5
	nop
	sub	sp, fp, #12
	@ sp needed
	pop	{r4, r5, fp, pc}
	.size	printMatrix, .-printMatrix
	.section	.rodata
	.align	2
.LC2:
	.ascii	"The matrix is ill-conditioned.\000"
	.global	__aeabi_ldivmod
	.text
	.align	2
	.global	gaussJordan
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	gaussJordan, %function
gaussJordan:
	@ args = 0, pretend = 0, frame = 160
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	add	fp, sp, #32
	sub	sp, sp, #164
	str	r0, [fp, #-80]
	str	r1, [fp, #-84]
	mov	r10, #0
	b	.L7
.L10:
	mov	r9, #0
	b	.L8
.L9:
	mov	r3, r10
	mov	r2, r3
	lsl	r2, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #5
	mov	r2, r3
	ldr	r3, [fp, #-80]
	add	r2, r3, r2
	mov	r3, r9
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r4, [r3]
	mov	r3, r10
	mov	r2, r3
	lsl	r2, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #5
	mov	r2, r3
	ldr	r3, [fp, #-80]
	add	r2, r3, r2
	mov	r3, r9
	mov	r0, #0
	mov	r1, #0
	lsl	r1, r5, #16
	orr	r1, r1, r4, lsr #16
	lsl	r0, r4, #16
	lsl	r3, r3, #3
	add	r3, r2, r3
	strd	r0, [r3]
	uxth	r3, r9
	add	r3, r3, #1
	uxth	r3, r3
	sxth	r9, r3
.L8:
	cmp	r9, #99
	ble	.L9
	mov	r3, r10
	mov	r2, r3
	lsl	r2, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #5
	mov	r2, r3
	ldr	r3, [fp, #-84]
	add	r2, r3, r2
	mov	r3, r10
	lsl	r3, r3, #3
	add	r1, r2, r3
	mov	r2, #65536
	mov	r3, #0
	strd	r2, [r1]
	uxth	r3, r10
	add	r3, r3, #1
	uxth	r3, r3
	sxth	r10, r3
.L7:
	cmp	r10, #99
	ble	.L10
	mov	r10, #0
	b	.L11
.L26:
	mov	r3, r10
	mov	r2, r3
	lsl	r2, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #5
	mov	r2, r3
	ldr	r3, [fp, #-80]
	add	r2, r3, r2
	mov	r3, r10
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r2, [r3]
	strd	r2, [fp, #-44]
	mov	r9, r10
	uxth	r3, r10
	add	r3, r3, #1
	uxth	r3, r3
	sxth	r8, r3
	b	.L12
.L14:
	mov	r3, r8
	mov	r2, r3
	lsl	r2, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #5
	mov	r2, r3
	ldr	r3, [fp, #-80]
	add	r2, r3, r2
	mov	r3, r10
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r2, [r3]
	strd	r2, [fp, #-52]
	ldrd	r2, [fp, #-52]
	mov	r0, #0
	mov	r1, #0
	asr	r0, r3, #31
	asr	r1, r3, #31
	ldrd	r2, [fp, #-52]
	eor	ip, r2, r0
	str	ip, [fp, #-124]
	eor	r3, r3, r1
	str	r3, [fp, #-120]
	ldrd	r2, [fp, #-124]
	mov	ip, r2
	subs	ip, ip, r0
	str	ip, [fp, #-132]
	sbc	r3, r3, r1
	str	r3, [fp, #-128]
	ldrd	r2, [fp, #-132]
	strd	r2, [fp, #-52]
	ldrd	r0, [fp, #-52]
	ldrd	r2, [fp, #-44]
	cmp	r2, r0
	sbcs	r3, r3, r1
	bge	.L13
	ldrd	r2, [fp, #-52]
	strd	r2, [fp, #-44]
	mov	r9, r8
.L13:
	uxth	r3, r8
	add	r3, r3, #1
	uxth	r3, r3
	sxth	r8, r3
.L12:
	cmp	r8, #99
	ble	.L14
	cmp	r10, r9
	beq	.L15
	mov	r8, #0
	b	.L16
.L17:
	mov	r3, r10
	mov	r2, r3
	lsl	r2, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #5
	mov	r2, r3
	ldr	r3, [fp, #-80]
	add	r2, r3, r2
	mov	r3, r8
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r2, [r3]
	strd	r2, [fp, #-60]
	mov	r3, r9
	mov	r2, r3
	lsl	r2, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #5
	mov	r2, r3
	ldr	r3, [fp, #-80]
	add	r1, r3, r2
	mov	r0, r8
	mov	r3, r10
	mov	r2, r3
	lsl	r2, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #5
	mov	r2, r3
	ldr	r3, [fp, #-80]
	add	r2, r3, r2
	mov	ip, r8
	lsl	r3, r0, #3
	add	r3, r1, r3
	ldrd	r0, [r3]
	lsl	r3, ip, #3
	add	r3, r2, r3
	strd	r0, [r3]
	mov	r3, r9
	mov	r2, r3
	lsl	r2, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #5
	mov	r2, r3
	ldr	r3, [fp, #-80]
	add	r2, r3, r2
	mov	r3, r8
	lsl	r3, r3, #3
	add	r1, r2, r3
	ldrd	r2, [fp, #-60]
	strd	r2, [r1]
	mov	r3, r10
	mov	r2, r3
	lsl	r2, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #5
	mov	r2, r3
	ldr	r3, [fp, #-84]
	add	r2, r3, r2
	mov	r3, r8
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r2, [r3]
	strd	r2, [fp, #-60]
	mov	r3, r9
	mov	r2, r3
	lsl	r2, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #5
	mov	r2, r3
	ldr	r3, [fp, #-84]
	add	r1, r3, r2
	mov	r0, r8
	mov	r3, r10
	mov	r2, r3
	lsl	r2, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #5
	mov	r2, r3
	ldr	r3, [fp, #-84]
	add	r2, r3, r2
	mov	ip, r8
	lsl	r3, r0, #3
	add	r3, r1, r3
	ldrd	r0, [r3]
	lsl	r3, ip, #3
	add	r3, r2, r3
	strd	r0, [r3]
	mov	r3, r9
	mov	r2, r3
	lsl	r2, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #5
	mov	r2, r3
	ldr	r3, [fp, #-84]
	add	r2, r3, r2
	mov	r3, r8
	lsl	r3, r3, #3
	add	r1, r2, r3
	ldrd	r2, [fp, #-60]
	strd	r2, [r1]
	uxth	r3, r8
	add	r3, r3, #1
	uxth	r3, r3
	sxth	r8, r3
.L16:
	cmp	r8, #99
	ble	.L17
.L15:
	mov	r3, r10
	mov	r2, r3
	lsl	r2, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #5
	mov	r2, r3
	ldr	r3, [fp, #-80]
	add	r2, r3, r2
	mov	r3, r10
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r2, [r3]
	strd	r2, [fp, #-44]
	ldrd	r2, [fp, #-44]
	orrs	r3, r2, r3
	bne	.L18
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	bl	puts
	mov	r0, #0
	bl	exit
.L18:
	mov	r9, #0
	b	.L19
.L25:
	cmp	r10, r9
	beq	.L20
	mov	r3, r9
	mov	r2, r3
	lsl	r2, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #5
	mov	r2, r3
	ldr	r3, [fp, #-80]
	add	r2, r3, r2
	mov	r3, r10
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r2, [r3]
	mov	r0, #0
	mov	r1, #0
	lsl	r1, r3, #16
	orr	r1, r1, r2, lsr #16
	lsl	r0, r2, #16
	ldrd	r2, [fp, #-44]
	bl	__aeabi_ldivmod
	mov	r2, r0
	mov	r3, r1
	strd	r2, [fp, #-68]
	mov	r8, #0
	b	.L21
.L22:
	mov	r3, r9
	mov	r2, r3
	lsl	r2, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #5
	mov	r2, r3
	ldr	r3, [fp, #-80]
	add	r2, r3, r2
	mov	r3, r8
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r6, [r3]
	mov	r3, r10
	mov	r2, r3
	lsl	r2, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #5
	mov	r2, r3
	ldr	r3, [fp, #-80]
	add	r2, r3, r2
	mov	r3, r8
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r2, [r3]
	ldr	r1, [fp, #-68]
	mul	r0, r3, r1
	ldr	r1, [fp, #-64]
	mul	r1, r2, r1
	add	r0, r0, r1
	ldr	r1, [fp, #-68]
	umull	r4, r5, r1, r2
	add	r3, r0, r5
	mov	r5, r3
	asr	r3, r5, #31
	mov	r0, r3
	asr	r1, r0, #31
	movw	r2, #65535
	mov	r3, #0
	and	ip, r0, r2
	str	ip, [fp, #-140]
	and	r3, r1, r3
	str	r3, [fp, #-136]
	ldrd	r2, [fp, #-140]
	mov	r1, r2
	adds	r1, r1, r4
	str	r1, [fp, #-148]
	adc	r3, r3, r5
	str	r3, [fp, #-144]
	mov	r2, #0
	mov	r3, #0
	ldrd	r0, [fp, #-148]
	mov	ip, r0
	lsr	r2, ip, #16
	mov	ip, r1
	orr	r2, r2, ip, lsl #16
	asr	r3, r1, #16
	rsbs	r2, r2, #0
	rsc	r3, r3, #0
	mov	r0, r2
	mov	r1, r3
	mov	r3, r9
	mov	r2, r3
	lsl	r2, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #5
	mov	r2, r3
	ldr	r3, [fp, #-80]
	add	r2, r3, r2
	mov	r3, r8
	adds	ip, r6, r0
	str	ip, [fp, #-92]
	adc	r1, r7, r1
	str	r1, [fp, #-88]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r0, [fp, #-92]
	strd	r0, [r3]
	mov	r3, r9
	mov	r2, r3
	lsl	r2, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #5
	mov	r2, r3
	ldr	r3, [fp, #-80]
	add	r2, r3, r2
	mov	r3, r8
	add	r3, r3, #1
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r6, [r3]
	mov	r3, r10
	mov	r2, r3
	lsl	r2, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #5
	mov	r2, r3
	ldr	r3, [fp, #-80]
	add	r2, r3, r2
	mov	r3, r8
	add	r3, r3, #1
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r2, [r3]
	ldr	r1, [fp, #-68]
	mul	r0, r3, r1
	ldr	r1, [fp, #-64]
	mul	r1, r2, r1
	add	r0, r0, r1
	ldr	r1, [fp, #-68]
	umull	r4, r5, r1, r2
	add	r3, r0, r5
	mov	r5, r3
	asr	r3, r5, #31
	mov	r0, r3
	asr	r1, r0, #31
	movw	r2, #65535
	mov	r3, #0
	and	ip, r0, r2
	str	ip, [fp, #-156]
	and	r3, r1, r3
	str	r3, [fp, #-152]
	ldrd	r2, [fp, #-156]
	mov	r1, r2
	adds	r1, r1, r4
	str	r1, [fp, #-164]
	adc	r3, r3, r5
	str	r3, [fp, #-160]
	mov	r2, #0
	mov	r3, #0
	ldrd	r0, [fp, #-164]
	mov	ip, r0
	lsr	r2, ip, #16
	mov	ip, r1
	orr	r2, r2, ip, lsl #16
	asr	r3, r1, #16
	rsbs	r2, r2, #0
	rsc	r3, r3, #0
	mov	r0, r2
	mov	r1, r3
	mov	r3, r9
	mov	r2, r3
	lsl	r2, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #5
	mov	r2, r3
	ldr	r3, [fp, #-80]
	add	r2, r3, r2
	mov	r3, r8
	add	r3, r3, #1
	adds	ip, r6, r0
	str	ip, [fp, #-100]
	adc	r1, r7, r1
	str	r1, [fp, #-96]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r0, [fp, #-100]
	strd	r0, [r3]
	uxth	r3, r8
	add	r3, r3, #2
	uxth	r3, r3
	sxth	r8, r3
.L21:
	cmp	r8, #99
	ble	.L22
	mov	r8, #0
	b	.L23
.L24:
	mov	r3, r9
	mov	r2, r3
	lsl	r2, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #5
	mov	r2, r3
	ldr	r3, [fp, #-84]
	add	r2, r3, r2
	mov	r3, r8
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r6, [r3]
	mov	r3, r10
	mov	r2, r3
	lsl	r2, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #5
	mov	r2, r3
	ldr	r3, [fp, #-84]
	add	r2, r3, r2
	mov	r3, r8
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r2, [r3]
	ldr	r1, [fp, #-68]
	mul	r0, r3, r1
	ldr	r1, [fp, #-64]
	mul	r1, r2, r1
	add	r0, r0, r1
	ldr	r1, [fp, #-68]
	umull	r4, r5, r1, r2
	add	r3, r0, r5
	mov	r5, r3
	asr	r3, r5, #31
	mov	r0, r3
	asr	r1, r0, #31
	movw	r2, #65535
	mov	r3, #0
	and	ip, r0, r2
	str	ip, [fp, #-172]
	and	r3, r1, r3
	str	r3, [fp, #-168]
	ldrd	r2, [fp, #-172]
	mov	r1, r2
	adds	r1, r1, r4
	str	r1, [fp, #-180]
	adc	r3, r3, r5
	str	r3, [fp, #-176]
	mov	r2, #0
	mov	r3, #0
	ldrd	r0, [fp, #-180]
	mov	ip, r0
	lsr	r2, ip, #16
	mov	ip, r1
	orr	r2, r2, ip, lsl #16
	asr	r3, r1, #16
	rsbs	r2, r2, #0
	rsc	r3, r3, #0
	mov	r0, r2
	mov	r1, r3
	mov	r3, r9
	mov	r2, r3
	lsl	r2, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #5
	mov	r2, r3
	ldr	r3, [fp, #-84]
	add	r2, r3, r2
	mov	r3, r8
	adds	ip, r6, r0
	str	ip, [fp, #-108]
	adc	r1, r7, r1
	str	r1, [fp, #-104]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r0, [fp, #-108]
	strd	r0, [r3]
	mov	r3, r9
	mov	r2, r3
	lsl	r2, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #5
	mov	r2, r3
	ldr	r3, [fp, #-84]
	add	r2, r3, r2
	mov	r3, r8
	add	r3, r3, #1
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r6, [r3]
	mov	r3, r10
	mov	r2, r3
	lsl	r2, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #5
	mov	r2, r3
	ldr	r3, [fp, #-84]
	add	r2, r3, r2
	mov	r3, r8
	add	r3, r3, #1
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r2, [r3]
	ldr	r1, [fp, #-68]
	mul	r0, r3, r1
	ldr	r1, [fp, #-64]
	mul	r1, r2, r1
	add	r0, r0, r1
	ldr	r1, [fp, #-68]
	umull	r4, r5, r1, r2
	add	r3, r0, r5
	mov	r5, r3
	asr	r3, r5, #31
	mov	r0, r3
	asr	r1, r0, #31
	movw	r2, #65535
	mov	r3, #0
	and	ip, r0, r2
	str	ip, [fp, #-188]
	and	r3, r1, r3
	str	r3, [fp, #-184]
	ldrd	r2, [fp, #-188]
	mov	r1, r2
	adds	r1, r1, r4
	str	r1, [fp, #-196]
	adc	r3, r3, r5
	str	r3, [fp, #-192]
	mov	r2, #0
	mov	r3, #0
	ldrd	r0, [fp, #-196]
	mov	ip, r0
	lsr	r2, ip, #16
	mov	ip, r1
	orr	r2, r2, ip, lsl #16
	asr	r3, r1, #16
	rsbs	r2, r2, #0
	rsc	r3, r3, #0
	mov	r0, r2
	mov	r1, r3
	mov	r3, r9
	mov	r2, r3
	lsl	r2, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #2
	add	r2, r2, r3
	lsl	r3, r2, #5
	mov	r2, r3
	ldr	r3, [fp, #-84]
	add	r2, r3, r2
	mov	r3, r8
	add	r3, r3, #1
	adds	ip, r6, r0
	str	ip, [fp, #-116]
	adc	r1, r7, r1
	str	r1, [fp, #-112]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r0, [fp, #-116]
	strd	r0, [r3]
	uxth	r3, r8
	add	r3, r3, #2
	uxth	r3, r3
	sxth	r8, r3
.L23:
	cmp	r8, #99
	ble	.L24
.L20:
	uxth	r3, r9
	add	r3, r3, #1
	uxth	r3, r3
	sxth	r9, r3
.L19:
	cmp	r9, #99
	ble	.L25
	uxth	r3, r10
	add	r3, r3, #1
	uxth	r3, r3
	sxth	r10, r3
.L11:
	cmp	r10, #99
	ble	.L26
	mov	r10, #0
	b	.L27
.L30:
	mov	r2, r10
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #5
	mov	r2, r3
	ldr	r3, [fp, #-80]
	add	r2, r3, r2
	mov	r3, r10
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r2, [r3]
	strd	r2, [fp, #-76]
	mov	r9, #0
	b	.L28
.L29:
	mov	r2, r10
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #5
	mov	r2, r3
	ldr	r3, [fp, #-84]
	add	r2, r3, r2
	mov	r3, r9
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldrd	r2, [r3]
	mov	r0, #0
	mov	r1, #0
	lsl	r1, r3, #16
	orr	r1, r1, r2, lsr #16
	lsl	r0, r2, #16
	mov	r2, r10
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #5
	mov	r2, r3
	ldr	r3, [fp, #-84]
	add	r4, r3, r2
	mov	r5, r9
	ldrd	r2, [fp, #-76]
	bl	__aeabi_ldivmod
	mov	r2, r0
	mov	r3, r1
	lsl	r1, r5, #3
	add	r1, r4, r1
	strd	r2, [r1]
	uxth	r3, r9
	add	r3, r3, #1
	uxth	r3, r3
	sxth	r9, r3
.L28:
	cmp	r9, #99
	ble	.L29
	uxth	r3, r10
	add	r3, r3, #1
	uxth	r3, r3
	sxth	r10, r3
.L27:
	cmp	r10, #99
	ble	.L30
	nop
	sub	sp, fp, #32
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
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
	beq	.L32
	movw	r0, #:lower16:.LC3
	movt	r0, #:upper16:.LC3
	bl	puts
	mov	r0, #1
	bl	exit
.L32:
	bl	clock
	str	r0, [fp, #-12]
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
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L33
	movw	r0, #:lower16:.LC5
	movt	r0, #:upper16:.LC5
	bl	puts
	mov	r0, #1
	bl	exit
.L33:
	mov	r3, #0
	strh	r3, [fp, #-8]	@ movhi
	b	.L34
.L38:
	mov	r3, #0
	strh	r3, [fp, #-6]	@ movhi
	b	.L35
.L37:
	ldrsh	r1, [fp, #-8]
	ldrsh	r0, [fp, #-6]
	sub	r2, fp, #79872
	sub	r2, r2, #4
	sub	r2, r2, #168
	mov	r3, r1
	lsl	r3, r3, #2
	add	r3, r3, r1
	lsl	r1, r3, #2
	add	r3, r3, r1
	lsl	r3, r3, #2
	add	r3, r3, r0
	lsl	r3, r3, #3
	add	r3, r2, r3
	mov	r2, r3
	movw	r1, #:lower16:.LC6
	movt	r1, #:upper16:.LC6
	ldr	r0, [fp, #-16]
	bl	__isoc99_fscanf
	mov	r3, r0
	cmp	r3, #1
	beq	.L36
	movw	r0, #:lower16:.LC7
	movt	r0, #:upper16:.LC7
	bl	puts
	mov	r0, #1
	bl	exit
.L36:
	ldrsh	r3, [fp, #-6]
	uxth	r3, r3
	add	r3, r3, #1
	uxth	r3, r3
	strh	r3, [fp, #-6]	@ movhi
.L35:
	ldrsh	r3, [fp, #-6]
	cmp	r3, #99
	ble	.L37
	ldrsh	r3, [fp, #-8]
	uxth	r3, r3
	add	r3, r3, #1
	uxth	r3, r3
	strh	r3, [fp, #-8]	@ movhi
.L34:
	ldrsh	r3, [fp, #-8]
	cmp	r3, #99
	ble	.L38
	ldr	r0, [fp, #-16]
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
	str	r0, [fp, #-20]
	sub	r3, fp, #159744
	sub	r3, r3, #4
	sub	r3, r3, #296
	mov	r0, r3
	bl	printMatrix
	bl	clock
	str	r0, [fp, #-24]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-12]
	sub	r3, r2, r3
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d6, .L40
	vmul.f64	d6, d7, d6
	vldr.64	d5, .L40+8
	vdiv.f64	d7, d6, d5
	vstr.64	d7, [fp, #-36]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	sub	r3, r2, r3
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d6, .L40
	vmul.f64	d6, d7, d6
	vldr.64	d5, .L40+8
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
.L41:
	.align	3
.L40:
	.word	0
	.word	1083129856
	.word	0
	.word	1093567616
	.size	main, .-main
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
