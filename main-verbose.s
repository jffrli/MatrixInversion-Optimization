	.arch armv7-a
	.eabi_attribute 28, 1	@ Tag_ABI_VFP_args
	.eabi_attribute 20, 1	@ Tag_ABI_FP_denormal
	.eabi_attribute 21, 1	@ Tag_ABI_FP_exceptions
	.eabi_attribute 23, 3	@ Tag_ABI_FP_number_model
	.eabi_attribute 24, 1	@ Tag_ABI_align8_needed
	.eabi_attribute 25, 1	@ Tag_ABI_align8_preserved
	.eabi_attribute 26, 2	@ Tag_ABI_enum_size
	.eabi_attribute 30, 6	@ Tag_ABI_optimization_goals
	.eabi_attribute 34, 1	@ Tag_CPU_unaligned_access
	.eabi_attribute 18, 4	@ Tag_ABI_PCS_wchar_t
	.file	"main.c"
@ GNU C17 (GCC) version 8.2.1 20180801 (Red Hat 8.2.1-2) (armv7hl-redhat-linux-gnueabi)
@	compiled by GNU C version 8.2.1 20180801 (Red Hat 8.2.1-2), GMP version 6.1.2, MPFR version 3.1.6-p2, MPC version 1.1.0, isl version none
@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed:  main.c -mtune=generic-armv7-a -mfloat-abi=hard
@ -mfpu=vfpv3-d16 -mabi=aapcs-linux -mtls-dialect=gnu -marm
@ -march=armv7-a+fp -fverbose-asm
@ options enabled:  -faggressive-loop-optimizations -fauto-inc-dec
@ -fchkp-check-incomplete-type -fchkp-check-read -fchkp-check-write
@ -fchkp-instrument-calls -fchkp-narrow-bounds -fchkp-optimize
@ -fchkp-store-bounds -fchkp-use-static-bounds
@ -fchkp-use-static-const-bounds -fchkp-use-wrappers -fcommon
@ -fdelete-null-pointer-checks -fdwarf2-cfi-asm -fearly-inlining
@ -feliminate-unused-debug-types -ffp-int-builtin-inexact -ffunction-cse
@ -fgcse-lm -fgnu-runtime -fgnu-unique -fident -finline-atomics
@ -fira-hoist-pressure -fira-share-save-slots -fira-share-spill-slots
@ -fivopts -fkeep-static-consts -fleading-underscore -flifetime-dse
@ -flto-odr-type-merging -fmath-errno -fmerge-debug-strings -fpeephole
@ -fplt -fprefetch-loop-arrays -freg-struct-return
@ -fsched-critical-path-heuristic -fsched-dep-count-heuristic
@ -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
@ -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
@ -fsched-stalled-insns-dep -fsemantic-interposition -fshow-column
@ -fshrink-wrap-separate -fsigned-zeros -fsplit-ivs-in-unroller
@ -fssa-backprop -fstdarg-opt -fstrict-volatile-bitfields -fsync-libcalls
@ -ftrapping-math -ftree-cselim -ftree-forwprop -ftree-loop-if-convert
@ -ftree-loop-im -ftree-loop-ivcanon -ftree-loop-optimize
@ -ftree-parallelize-loops= -ftree-phiprop -ftree-reassoc -ftree-scev-cprop
@ -funit-at-a-time -fverbose-asm -fzero-initialized-in-bss -marm -mbe32
@ -mglibc -mlittle-endian -mpic-data-is-text-relative -msched-prolog
@ -munaligned-access -mvectorize-with-neon-quad

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
	push	{r4, r5, r6, r7, r8, r9, fp}	@
	add	fp, sp, #24	@,,
	sub	sp, sp, #20	@,,
	strd	r0, [fp, #-36]	@ x,,
	strd	r2, [fp, #-44]	@ y,,
@ main.c:13:     return (((x) * (y)) / (SHIFT_MASK + 1));
	ldr	r3, [fp, #-32]	@ tmp114, x
	ldr	r2, [fp, #-44]	@ tmp115, y
	mul	r2, r2, r3	@ tmp113, tmp115, tmp114
	ldr	r3, [fp, #-40]	@ tmp117, y
	ldr	r1, [fp, #-36]	@ tmp118, x
	mul	r3, r1, r3	@ tmp116, tmp118, tmp117
	add	r1, r2, r3	@ tmp119, tmp113, tmp116
	ldr	r2, [fp, #-36]	@ tmp120, x
	ldr	r3, [fp, #-44]	@ tmp121, y
	umull	r2, r3, r2, r3	@ _1, tmp120, tmp121
	add	r1, r1, r3	@ tmp122, tmp119, _1
	mov	r3, r1	@ _1, tmp122
@ main.c:13:     return (((x) * (y)) / (SHIFT_MASK + 1));
	asr	r1, r3, #31	@ tmp127, _1,
	mov	r0, r1	@ tmp126, tmp127
	asr	r1, r0, #31	@, tmp126,
	movw	r8, #65535	@ tmp129,
	mov	r9, #0	@,
	and	r6, r0, r8	@ tmp128, tmp126, tmp129
	and	r7, r1, r9	@,,
	adds	r4, r6, r2	@ tmp130, tmp128, _1
	adc	r5, r7, r3	@,, _1
	mov	r2, #0	@ tmp131,
	mov	r3, #0	@,
	lsr	r2, r4, #16	@ tmp131, tmp130,
	orr	r2, r2, r5, lsl #16	@ tmp131, tmp131,,
	asr	r3, r5, #16	@,,
@ main.c:14: }
	mov	r0, r2	@, <retval>
	mov	r1, r3	@, <retval>
	sub	sp, fp, #24	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7, r8, r9, fp}	@
	bx	lr	@
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
	push	{fp, lr}	@
	add	fp, sp, #4	@,,
	sub	sp, sp, #16	@,,
	strd	r0, [fp, #-12]	@ x,,
	strd	r2, [fp, #-20]	@ y,,
@ main.c:18:     return (x * (SHIFT_MASK + 1)) / y;
	ldrd	r2, [fp, #-12]	@ tmp113,,
	mov	r0, #0	@ _1,
	mov	r1, #0	@ _1,
	lsl	r1, r3, #16	@ _1,,
	orr	r1, r1, r2, lsr #16	@ _1, _1, tmp113,
	lsl	r0, r2, #16	@ _1, tmp113,
@ main.c:18:     return (x * (SHIFT_MASK + 1)) / y;
	ldrd	r2, [fp, #-20]	@,,
	bl	__aeabi_ldivmod		@
	mov	r2, r0	@ tmp118,
	mov	r3, r1	@,
@ main.c:19: }
	mov	r0, r2	@, <retval>
	mov	r1, r3	@, <retval>
	sub	sp, fp, #4	@,,
	@ sp needed	@
	pop	{fp, pc}	@
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
	str	fp, [sp, #-4]!	@,
	add	fp, sp, #0	@,,
	sub	sp, sp, #36	@,,
	str	r0, [fp, #-32]	@ m, m
	mov	r3, r1	@ tmp127, i
	strh	r3, [fp, #-34]	@ movhi	@ tmp128, i
@ main.c:22:     long long largest = m[i][i], mag;
	ldrsh	r2, [fp, #-34]	@ _1, i
	mov	r3, r2	@ tmp129, _1
	lsl	r3, r3, #2	@ tmp129, tmp129,
	add	r3, r3, r2	@ tmp129, tmp129, _1
	lsl	r2, r3, #2	@ tmp130, tmp129,
	add	r3, r3, r2	@ tmp129, tmp129, tmp130
	lsl	r3, r3, #5	@ tmp131, tmp129,
	mov	r2, r3	@ _2, tmp129
	ldr	r3, [fp, #-32]	@ tmp132, m
	add	r2, r3, r2	@ _3, tmp132, _2
@ main.c:22:     long long largest = m[i][i], mag;
	ldrsh	r3, [fp, #-34]	@ _4, i
@ main.c:22:     long long largest = m[i][i], mag;
	lsl	r3, r3, #3	@ tmp133, _4,
	add	r3, r2, r3	@ tmp134, _3, tmp133
	ldrd	r2, [r3]	@ tmp135, *_3
	strd	r2, [fp, #-12]	@ tmp135,,
@ main.c:24:     short int n = i;
	ldrh	r3, [fp, #-34]	@ movhi	@ tmp136, i
	strh	r3, [fp, #-16]	@ movhi	@ tmp136, n
@ main.c:25:     for (k = i + 1; k < ORDER; ++k)
	ldrh	r3, [fp, #-34]	@ i.0_5, i
	add	r3, r3, #1	@ tmp137, i.0_5,
	uxth	r3, r3	@ _6, tmp137
@ main.c:25:     for (k = i + 1; k < ORDER; ++k)
	strh	r3, [fp, #-14]	@ movhi	@ _6, k
@ main.c:25:     for (k = i + 1; k < ORDER; ++k)
	b	.L6		@
.L8:
@ main.c:27:         mag = abs(m[k][i]);
	ldrsh	r2, [fp, #-14]	@ _7, k
	mov	r3, r2	@ tmp138, _7
	lsl	r3, r3, #2	@ tmp138, tmp138,
	add	r3, r3, r2	@ tmp138, tmp138, _7
	lsl	r2, r3, #2	@ tmp139, tmp138,
	add	r3, r3, r2	@ tmp138, tmp138, tmp139
	lsl	r3, r3, #5	@ tmp140, tmp138,
	mov	r2, r3	@ _8, tmp138
	ldr	r3, [fp, #-32]	@ tmp141, m
	add	r2, r3, r2	@ _9, tmp141, _8
@ main.c:27:         mag = abs(m[k][i]);
	ldrsh	r3, [fp, #-34]	@ _10, i
	lsl	r3, r3, #3	@ tmp142, _10,
	add	r3, r2, r3	@ tmp143, _9, tmp142
	ldrd	r2, [r3]	@ _11, *_9
@ main.c:27:         mag = abs(m[k][i]);
	mov	r3, r2	@ _12, _11
	cmp	r3, #0	@ _13,
	rsblt	r3, r3, #0	@ _13, _12,
@ main.c:27:         mag = abs(m[k][i]);
	mov	r2, r3	@ tmp144, _13
	asr	r3, r2, #31	@, tmp144,
	strd	r2, [fp, #-28]	@ tmp144,,
@ main.c:28:         if (mag > largest)
	ldrd	r2, [fp, #-28]	@ tmp145,,
	ldrd	r0, [fp, #-12]	@ tmp146,,
	cmp	r0, r2	@ tmp146, tmp145
	sbcs	r3, r1, r3	@ tmp152,,
	bge	.L7		@,
@ main.c:30:             largest = mag;
	ldrd	r2, [fp, #-28]	@ tmp147,,
	strd	r2, [fp, #-12]	@ tmp147,,
@ main.c:31:             n = k;
	ldrh	r3, [fp, #-14]	@ movhi	@ tmp148, k
	strh	r3, [fp, #-16]	@ movhi	@ tmp148, n
.L7:
@ main.c:25:     for (k = i + 1; k < ORDER; ++k)
	ldrh	r3, [fp, #-14]	@ k.1_14, k
	add	r3, r3, #1	@ tmp149, k.1_14,
	uxth	r3, r3	@ _15, tmp149
	strh	r3, [fp, #-14]	@ movhi	@ _15, k
.L6:
@ main.c:25:     for (k = i + 1; k < ORDER; ++k)
	ldrsh	r3, [fp, #-14]	@ tmp150, k
	cmp	r3, #99	@ tmp150,
	ble	.L8		@,
@ main.c:34:     return n;
	ldrsh	r3, [fp, #-16]	@ _31, n
@ main.c:35: }
	mov	r0, r3	@, <retval>
	add	sp, fp, #0	@,,
	@ sp needed	@
	ldr	fp, [sp], #4	@,
	bx	lr	@
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
	push	{r4, r5, fp, lr}	@
	add	fp, sp, #12	@,,
	sub	sp, sp, #8	@,,
	str	r0, [fp, #-16]	@ augmented, augmented
@ main.c:39:     printf("\nInverse Matrix is:\n");
	movw	r0, #:lower16:.LC0	@,
	movt	r0, #:upper16:.LC0	@,
	bl	puts		@
@ main.c:41:     for (i = 0; i < ORDER; ++i)
	mov	r4, #0	@ i,
@ main.c:41:     for (i = 0; i < ORDER; ++i)
	b	.L11		@
.L14:
@ main.c:43:         for (j = 0; j < ORDER; ++j)
	mov	r5, #0	@ j,
@ main.c:43:         for (j = 0; j < ORDER; ++j)
	b	.L12		@
.L13:
@ main.c:45:             printf("%i\t", (short int)augmented[i][j]);
	mov	r2, r4	@ _1, i
	mov	r3, r2	@ tmp123, _1
	lsl	r3, r3, #2	@ tmp123, tmp123,
	add	r3, r3, r2	@ tmp123, tmp123, _1
	lsl	r2, r3, #2	@ tmp124, tmp123,
	add	r3, r3, r2	@ tmp123, tmp123, tmp124
	lsl	r3, r3, #5	@ tmp125, tmp123,
	mov	r2, r3	@ _2, tmp123
	ldr	r3, [fp, #-16]	@ tmp126, augmented
	add	r2, r3, r2	@ _3, tmp126, _2
@ main.c:45:             printf("%i\t", (short int)augmented[i][j]);
	mov	r3, r5	@ _4, j
	lsl	r3, r3, #3	@ tmp127, _4,
	add	r3, r2, r3	@ tmp128, _3, tmp127
	ldrd	r2, [r3]	@ _5, *_3
@ main.c:45:             printf("%i\t", (short int)augmented[i][j]);
	sxth	r3, r2	@ _6, _5
@ main.c:45:             printf("%i\t", (short int)augmented[i][j]);
	mov	r1, r3	@, _7
	movw	r0, #:lower16:.LC1	@,
	movt	r0, #:upper16:.LC1	@,
	bl	printf		@
@ main.c:43:         for (j = 0; j < ORDER; ++j)
	uxth	r3, r5	@ j.2_8, j
	add	r3, r3, #1	@ tmp129, j.2_8,
	uxth	r3, r3	@ _9, tmp129
	sxth	r5, r3	@ j, _9
.L12:
@ main.c:43:         for (j = 0; j < ORDER; ++j)
	cmp	r5, #99	@ j,
	ble	.L13		@,
@ main.c:47:         printf("\n");
	mov	r0, #10	@,
	bl	putchar		@
@ main.c:41:     for (i = 0; i < ORDER; ++i)
	uxth	r3, r4	@ i.3_10, i
	add	r3, r3, #1	@ tmp130, i.3_10,
	uxth	r3, r3	@ _11, tmp130
	sxth	r4, r3	@ i, _11
.L11:
@ main.c:41:     for (i = 0; i < ORDER; ++i)
	cmp	r4, #99	@ i,
	ble	.L14		@,
@ main.c:49: }
	nop	
	sub	sp, fp, #12	@,,
	@ sp needed	@
	pop	{r4, r5, fp, pc}	@
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
	str	fp, [sp, #-4]!	@,
	add	fp, sp, #0	@,,
	sub	sp, sp, #28	@,,
	str	r0, [fp, #-24]	@ m, m
	mov	r3, r1	@ tmp123, n
	strh	r3, [fp, #-26]	@ movhi	@ tmp124, n
	mov	r3, r2	@ movhi	@ tmp126, tmp125
	strh	r3, [fp, #-28]	@ movhi	@ tmp126, i
@ main.c:54:     for (k = 0; k < ORDER; ++k)
	mov	r3, #0	@ tmp127,
	str	r3, [fp, #-8]	@ tmp127, k
@ main.c:54:     for (k = 0; k < ORDER; ++k)
	b	.L16		@
.L17:
@ main.c:56:         long long t = m[i][k];
	ldrsh	r2, [fp, #-28]	@ _1, i
	mov	r3, r2	@ tmp128, _1
	lsl	r3, r3, #2	@ tmp128, tmp128,
	add	r3, r3, r2	@ tmp128, tmp128, _1
	lsl	r2, r3, #2	@ tmp129, tmp128,
	add	r3, r3, r2	@ tmp128, tmp128, tmp129
	lsl	r3, r3, #5	@ tmp130, tmp128,
	mov	r2, r3	@ _2, tmp128
	ldr	r3, [fp, #-24]	@ tmp131, m
	add	r2, r3, r2	@ _3, tmp131, _2
@ main.c:56:         long long t = m[i][k];
	ldr	r3, [fp, #-8]	@ tmp132, k
	lsl	r3, r3, #3	@ tmp133, tmp132,
	add	r3, r2, r3	@ tmp134, _3, tmp133
	ldrd	r2, [r3]	@ tmp135, *_3
	strd	r2, [fp, #-20]	@ tmp135,,
@ main.c:57:         m[i][k] = m[n][k];
	ldrsh	r2, [fp, #-26]	@ _4, n
	mov	r3, r2	@ tmp136, _4
	lsl	r3, r3, #2	@ tmp136, tmp136,
	add	r3, r3, r2	@ tmp136, tmp136, _4
	lsl	r2, r3, #2	@ tmp137, tmp136,
	add	r3, r3, r2	@ tmp136, tmp136, tmp137
	lsl	r3, r3, #5	@ tmp138, tmp136,
	mov	r2, r3	@ _5, tmp136
	ldr	r3, [fp, #-24]	@ tmp139, m
	add	r1, r3, r2	@ _6, tmp139, _5
@ main.c:57:         m[i][k] = m[n][k];
	ldrsh	r2, [fp, #-28]	@ _7, i
	mov	r3, r2	@ tmp140, _7
	lsl	r3, r3, #2	@ tmp140, tmp140,
	add	r3, r3, r2	@ tmp140, tmp140, _7
	lsl	r2, r3, #2	@ tmp141, tmp140,
	add	r3, r3, r2	@ tmp140, tmp140, tmp141
	lsl	r3, r3, #5	@ tmp142, tmp140,
	mov	r2, r3	@ _8, tmp140
	ldr	r3, [fp, #-24]	@ tmp143, m
	add	r0, r3, r2	@ _9, tmp143, _8
@ main.c:57:         m[i][k] = m[n][k];
	ldr	r3, [fp, #-8]	@ tmp144, k
	lsl	r3, r3, #3	@ tmp145, tmp144,
	add	r3, r1, r3	@ tmp146, _6, tmp145
	ldrd	r2, [r3]	@ _10, *_6
@ main.c:57:         m[i][k] = m[n][k];
	ldr	r1, [fp, #-8]	@ tmp147, k
	lsl	r1, r1, #3	@ tmp148, tmp147,
	add	r1, r0, r1	@ tmp149, _9, tmp148
	strd	r2, [r1]	@ _10, *_9
@ main.c:58:         m[n][k] = t;
	ldrsh	r2, [fp, #-26]	@ _11, n
	mov	r3, r2	@ tmp150, _11
	lsl	r3, r3, #2	@ tmp150, tmp150,
	add	r3, r3, r2	@ tmp150, tmp150, _11
	lsl	r2, r3, #2	@ tmp151, tmp150,
	add	r3, r3, r2	@ tmp150, tmp150, tmp151
	lsl	r3, r3, #5	@ tmp152, tmp150,
	mov	r2, r3	@ _12, tmp150
	ldr	r3, [fp, #-24]	@ tmp153, m
	add	r2, r3, r2	@ _13, tmp153, _12
@ main.c:58:         m[n][k] = t;
	ldr	r3, [fp, #-8]	@ tmp154, k
	lsl	r3, r3, #3	@ tmp155, tmp154,
	add	r1, r2, r3	@ tmp156, _13, tmp155
	ldrd	r2, [fp, #-20]	@ tmp157,,
	strd	r2, [r1]	@ tmp157, *_13
@ main.c:54:     for (k = 0; k < ORDER; ++k)
	ldr	r3, [fp, #-8]	@ tmp159, k
	add	r3, r3, #1	@ tmp158, tmp159,
	str	r3, [fp, #-8]	@ tmp158, k
.L16:
@ main.c:54:     for (k = 0; k < ORDER; ++k)
	ldr	r3, [fp, #-8]	@ tmp160, k
	cmp	r3, #99	@ tmp160,
	ble	.L17		@,
@ main.c:60: }
	nop	
	add	sp, fp, #0	@,,
	@ sp needed	@
	ldr	fp, [sp], #4	@,
	bx	lr	@
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
	push	{r4, r5, r6, r7, r8, r9, fp, lr}	@
	add	fp, sp, #28	@,,
	sub	sp, sp, #32	@,,
	str	r0, [fp, #-48]	@ m, m
	str	r1, [fp, #-52]	@ augmented, augmented
@ main.c:65:     for (i = 0; i < ORDER; ++i)
	mov	r4, #0	@ i,
@ main.c:65:     for (i = 0; i < ORDER; ++i)
	b	.L19		@
.L20:
@ main.c:67:         augmented[i][i] = 1 << SHIFT_AMOUNT;
	mov	r2, r4	@ _1, i
	mov	r3, r2	@ tmp204, _1
	lsl	r3, r3, #2	@ tmp204, tmp204,
	add	r3, r3, r2	@ tmp204, tmp204, _1
	lsl	r2, r3, #2	@ tmp205, tmp204,
	add	r3, r3, r2	@ tmp204, tmp204, tmp205
	lsl	r3, r3, #5	@ tmp206, tmp204,
	mov	r2, r3	@ _2, tmp204
	ldr	r3, [fp, #-52]	@ tmp207, augmented
	add	r2, r3, r2	@ _3, tmp207, _2
@ main.c:67:         augmented[i][i] = 1 << SHIFT_AMOUNT;
	mov	r3, r4	@ _4, i
@ main.c:67:         augmented[i][i] = 1 << SHIFT_AMOUNT;
	lsl	r3, r3, #3	@ tmp208, _4,
	add	r1, r2, r3	@ tmp209, _3, tmp208
	mov	r2, #65536	@ tmp210,
	mov	r3, #0	@,
	strd	r2, [r1]	@ tmp210, *_3
@ main.c:65:     for (i = 0; i < ORDER; ++i)
	uxth	r3, r4	@ i.4_5, i
	add	r3, r3, #1	@ tmp211, i.4_5,
	uxth	r3, r3	@ _6, tmp211
	sxth	r4, r3	@ i, _6
.L19:
@ main.c:65:     for (i = 0; i < ORDER; ++i)
	cmp	r4, #99	@ i,
	ble	.L20		@,
@ main.c:70:     for (i = 0; i < ORDER; ++i)
	mov	r4, #0	@ i,
@ main.c:70:     for (i = 0; i < ORDER; ++i)
	b	.L21		@
.L24:
@ main.c:72:         for (j = 0; j < ORDER; ++j)
	mov	r5, #0	@ j,
@ main.c:72:         for (j = 0; j < ORDER; ++j)
	b	.L22		@
.L23:
@ main.c:74:             m[i][j] = m[i][j] << SHIFT_AMOUNT;
	mov	r2, r4	@ _7, i
	mov	r3, r2	@ tmp212, _7
	lsl	r3, r3, #2	@ tmp212, tmp212,
	add	r3, r3, r2	@ tmp212, tmp212, _7
	lsl	r2, r3, #2	@ tmp213, tmp212,
	add	r3, r3, r2	@ tmp212, tmp212, tmp213
	lsl	r3, r3, #5	@ tmp214, tmp212,
	mov	r2, r3	@ _8, tmp212
	ldr	r3, [fp, #-48]	@ tmp215, m
	add	r2, r3, r2	@ _9, tmp215, _8
@ main.c:74:             m[i][j] = m[i][j] << SHIFT_AMOUNT;
	mov	r3, r5	@ _10, j
	lsl	r3, r3, #3	@ tmp216, _10,
	add	r3, r2, r3	@ tmp217, _9, tmp216
	ldrd	r0, [r3]	@ _11, *_9
@ main.c:74:             m[i][j] = m[i][j] << SHIFT_AMOUNT;
	mov	r2, r4	@ _12, i
	mov	r3, r2	@ tmp218, _12
	lsl	r3, r3, #2	@ tmp218, tmp218,
	add	r3, r3, r2	@ tmp218, tmp218, _12
	lsl	r2, r3, #2	@ tmp219, tmp218,
	add	r3, r3, r2	@ tmp218, tmp218, tmp219
	lsl	r3, r3, #5	@ tmp220, tmp218,
	mov	r2, r3	@ _13, tmp218
	ldr	r3, [fp, #-48]	@ tmp221, m
	add	ip, r3, r2	@ _14, tmp221, _13
@ main.c:74:             m[i][j] = m[i][j] << SHIFT_AMOUNT;
	mov	lr, r5	@ _15, j
@ main.c:74:             m[i][j] = m[i][j] << SHIFT_AMOUNT;
	mov	r2, #0	@ _16,
	mov	r3, #0	@ _16,
	lsl	r3, r1, #16	@ _16, _11,
	orr	r3, r3, r0, lsr #16	@ _16, _16, _11,
	lsl	r2, r0, #16	@ _16, _11,
@ main.c:74:             m[i][j] = m[i][j] << SHIFT_AMOUNT;
	lsl	r1, lr, #3	@ tmp224, _15,
	add	r1, ip, r1	@ tmp225, _14, tmp224
	strd	r2, [r1]	@ _16, *_14
@ main.c:72:         for (j = 0; j < ORDER; ++j)
	uxth	r3, r5	@ j.5_17, j
	add	r3, r3, #1	@ tmp226, j.5_17,
	uxth	r3, r3	@ _18, tmp226
	sxth	r5, r3	@ j, _18
.L22:
@ main.c:72:         for (j = 0; j < ORDER; ++j)
	cmp	r5, #99	@ j,
	ble	.L23		@,
@ main.c:70:     for (i = 0; i < ORDER; ++i)
	uxth	r3, r4	@ i.6_19, i
	add	r3, r3, #1	@ tmp227, i.6_19,
	uxth	r3, r3	@ _20, tmp227
	sxth	r4, r3	@ i, _20
.L21:
@ main.c:70:     for (i = 0; i < ORDER; ++i)
	cmp	r4, #99	@ i,
	ble	.L24		@,
@ main.c:80:     for (i = 0; i < ORDER; ++i)
	mov	r4, #0	@ i,
@ main.c:80:     for (i = 0; i < ORDER; ++i)
	b	.L25		@
.L32:
@ main.c:84:         short int n = findLargestinCol(m,i);
	mov	r1, r4	@, i
	ldr	r0, [fp, #-48]	@, m
	bl	findLargestinCol		@
	mov	r3, r0	@ tmp228,
	strh	r3, [fp, #-32]	@ movhi	@ tmp228, n
@ main.c:86:         swapRows(m, n, i);
	ldrsh	r3, [fp, #-32]	@ tmp229, n
	mov	r2, r4	@, i
	mov	r1, r3	@, tmp229
	ldr	r0, [fp, #-48]	@, m
	bl	swapRows		@
@ main.c:87:         swapRows(augmented, n, i);
	ldrsh	r3, [fp, #-32]	@ tmp230, n
	mov	r2, r4	@, i
	mov	r1, r3	@, tmp230
	ldr	r0, [fp, #-52]	@, augmented
	bl	swapRows		@
@ main.c:89:         if (m[i][i] == 0)
	mov	r2, r4	@ _21, i
	mov	r3, r2	@ tmp231, _21
	lsl	r3, r3, #2	@ tmp231, tmp231,
	add	r3, r3, r2	@ tmp231, tmp231, _21
	lsl	r2, r3, #2	@ tmp232, tmp231,
	add	r3, r3, r2	@ tmp231, tmp231, tmp232
	lsl	r3, r3, #5	@ tmp233, tmp231,
	mov	r2, r3	@ _22, tmp231
	ldr	r3, [fp, #-48]	@ tmp234, m
	add	r2, r3, r2	@ _23, tmp234, _22
@ main.c:89:         if (m[i][i] == 0)
	mov	r3, r4	@ _24, i
	lsl	r3, r3, #3	@ tmp235, _24,
	add	r3, r2, r3	@ tmp236, _23, tmp235
	ldrd	r2, [r3]	@ _25, *_23
@ main.c:89:         if (m[i][i] == 0)
	orrs	r3, r2, r3	@ tmp311, _25
	bne	.L26		@,
@ main.c:91:             printf("The matrix is ill-conditioned.\n");
	movw	r0, #:lower16:.LC2	@,
	movt	r0, #:upper16:.LC2	@,
	bl	puts		@
@ main.c:92:             exit(0);
	mov	r0, #0	@,
	bl	exit		@
.L26:
@ main.c:95:         for (j = 0; j < ORDER; ++j)
	mov	r5, #0	@ j,
@ main.c:95:         for (j = 0; j < ORDER; ++j)
	b	.L27		@
.L31:
@ main.c:97:             if (i != j)
	cmp	r4, r5	@ i, j
	beq	.L28		@,
@ main.c:100:                 long long ratio = fixed_division(m[j][i], m[i][i]); // Float bad
	mov	r2, r5	@ _26, j
	mov	r3, r2	@ tmp237, _26
	lsl	r3, r3, #2	@ tmp237, tmp237,
	add	r3, r3, r2	@ tmp237, tmp237, _26
	lsl	r2, r3, #2	@ tmp238, tmp237,
	add	r3, r3, r2	@ tmp237, tmp237, tmp238
	lsl	r3, r3, #5	@ tmp239, tmp237,
	mov	r2, r3	@ _27, tmp237
	ldr	r3, [fp, #-48]	@ tmp240, m
	add	r2, r3, r2	@ _28, tmp240, _27
@ main.c:100:                 long long ratio = fixed_division(m[j][i], m[i][i]); // Float bad
	mov	r3, r4	@ _29, i
	lsl	r3, r3, #3	@ tmp241, _29,
	add	r3, r2, r3	@ tmp242, _28, tmp241
	ldrd	r0, [r3]	@ _30, *_28
@ main.c:100:                 long long ratio = fixed_division(m[j][i], m[i][i]); // Float bad
	mov	r2, r4	@ _31, i
	mov	r3, r2	@ tmp243, _31
	lsl	r3, r3, #2	@ tmp243, tmp243,
	add	r3, r3, r2	@ tmp243, tmp243, _31
	lsl	r2, r3, #2	@ tmp244, tmp243,
	add	r3, r3, r2	@ tmp243, tmp243, tmp244
	lsl	r3, r3, #5	@ tmp245, tmp243,
	mov	r2, r3	@ _32, tmp243
	ldr	r3, [fp, #-48]	@ tmp246, m
	add	r2, r3, r2	@ _33, tmp246, _32
@ main.c:100:                 long long ratio = fixed_division(m[j][i], m[i][i]); // Float bad
	mov	r3, r4	@ _34, i
	lsl	r3, r3, #3	@ tmp247, _34,
	add	r3, r2, r3	@ tmp248, _33, tmp247
	ldrd	r2, [r3]	@ _35, *_33
	bl	fixed_division		@
	strd	r0, [fp, #-44]	@,,
@ main.c:101:                 for (k = 0; k < ORDER; ++k)
	mov	r3, #0	@ tmp250,
	strh	r3, [fp, #-30]	@ movhi	@ tmp249, k
@ main.c:101:                 for (k = 0; k < ORDER; ++k)
	b	.L29		@
.L30:
@ main.c:103:                     m[j][k] = m[j][k] - fixed_multiplication(ratio, m[i][k]);
	mov	r2, r5	@ _36, j
	mov	r3, r2	@ tmp251, _36
	lsl	r3, r3, #2	@ tmp251, tmp251,
	add	r3, r3, r2	@ tmp251, tmp251, _36
	lsl	r2, r3, #2	@ tmp252, tmp251,
	add	r3, r3, r2	@ tmp251, tmp251, tmp252
	lsl	r3, r3, #5	@ tmp253, tmp251,
	mov	r2, r3	@ _37, tmp251
	ldr	r3, [fp, #-48]	@ tmp254, m
	add	r2, r3, r2	@ _38, tmp254, _37
@ main.c:103:                     m[j][k] = m[j][k] - fixed_multiplication(ratio, m[i][k]);
	ldrsh	r3, [fp, #-30]	@ _39, k
	lsl	r3, r3, #3	@ tmp255, _39,
	add	r3, r2, r3	@ tmp256, _38, tmp255
	ldrd	r6, [r3]	@ _40, *_38
@ main.c:103:                     m[j][k] = m[j][k] - fixed_multiplication(ratio, m[i][k]);
	mov	r2, r4	@ _41, i
	mov	r3, r2	@ tmp257, _41
	lsl	r3, r3, #2	@ tmp257, tmp257,
	add	r3, r3, r2	@ tmp257, tmp257, _41
	lsl	r2, r3, #2	@ tmp258, tmp257,
	add	r3, r3, r2	@ tmp257, tmp257, tmp258
	lsl	r3, r3, #5	@ tmp259, tmp257,
	mov	r2, r3	@ _42, tmp257
	ldr	r3, [fp, #-48]	@ tmp260, m
	add	r2, r3, r2	@ _43, tmp260, _42
@ main.c:103:                     m[j][k] = m[j][k] - fixed_multiplication(ratio, m[i][k]);
	ldrsh	r3, [fp, #-30]	@ _44, k
	lsl	r3, r3, #3	@ tmp261, _44,
	add	r3, r2, r3	@ tmp262, _43, tmp261
	ldrd	r2, [r3]	@ _45, *_43
	ldrd	r0, [fp, #-44]	@,,
	bl	fixed_multiplication		@
@ main.c:103:                     m[j][k] = m[j][k] - fixed_multiplication(ratio, m[i][k]);
	mov	r2, r5	@ _47, j
	mov	r3, r2	@ tmp263, _47
	lsl	r3, r3, #2	@ tmp263, tmp263,
	add	r3, r3, r2	@ tmp263, tmp263, _47
	lsl	r2, r3, #2	@ tmp264, tmp263,
	add	r3, r3, r2	@ tmp263, tmp263, tmp264
	lsl	r3, r3, #5	@ tmp265, tmp263,
	mov	r2, r3	@ _48, tmp263
	ldr	r3, [fp, #-48]	@ tmp266, m
	add	r2, r3, r2	@ _49, tmp266, _48
@ main.c:103:                     m[j][k] = m[j][k] - fixed_multiplication(ratio, m[i][k]);
	ldrsh	r3, [fp, #-30]	@ _50, k
@ main.c:103:                     m[j][k] = m[j][k] - fixed_multiplication(ratio, m[i][k]);
	subs	r8, r6, r0	@ _51, _40, _46
	sbc	r9, r7, r1	@ _51, _40, _46
@ main.c:103:                     m[j][k] = m[j][k] - fixed_multiplication(ratio, m[i][k]);
	lsl	r3, r3, #3	@ tmp267, _50,
	add	r3, r2, r3	@ tmp268, _49, tmp267
	strd	r8, [r3]	@ _51, *_49
@ main.c:104:                     augmented[j][k] = augmented[j][k] - fixed_multiplication(ratio, augmented[i][k]);
	mov	r2, r5	@ _52, j
	mov	r3, r2	@ tmp269, _52
	lsl	r3, r3, #2	@ tmp269, tmp269,
	add	r3, r3, r2	@ tmp269, tmp269, _52
	lsl	r2, r3, #2	@ tmp270, tmp269,
	add	r3, r3, r2	@ tmp269, tmp269, tmp270
	lsl	r3, r3, #5	@ tmp271, tmp269,
	mov	r2, r3	@ _53, tmp269
	ldr	r3, [fp, #-52]	@ tmp272, augmented
	add	r2, r3, r2	@ _54, tmp272, _53
@ main.c:104:                     augmented[j][k] = augmented[j][k] - fixed_multiplication(ratio, augmented[i][k]);
	ldrsh	r3, [fp, #-30]	@ _55, k
	lsl	r3, r3, #3	@ tmp273, _55,
	add	r3, r2, r3	@ tmp274, _54, tmp273
	ldrd	r6, [r3]	@ _56, *_54
@ main.c:104:                     augmented[j][k] = augmented[j][k] - fixed_multiplication(ratio, augmented[i][k]);
	mov	r2, r4	@ _57, i
	mov	r3, r2	@ tmp275, _57
	lsl	r3, r3, #2	@ tmp275, tmp275,
	add	r3, r3, r2	@ tmp275, tmp275, _57
	lsl	r2, r3, #2	@ tmp276, tmp275,
	add	r3, r3, r2	@ tmp275, tmp275, tmp276
	lsl	r3, r3, #5	@ tmp277, tmp275,
	mov	r2, r3	@ _58, tmp275
	ldr	r3, [fp, #-52]	@ tmp278, augmented
	add	r2, r3, r2	@ _59, tmp278, _58
@ main.c:104:                     augmented[j][k] = augmented[j][k] - fixed_multiplication(ratio, augmented[i][k]);
	ldrsh	r3, [fp, #-30]	@ _60, k
	lsl	r3, r3, #3	@ tmp279, _60,
	add	r3, r2, r3	@ tmp280, _59, tmp279
	ldrd	r2, [r3]	@ _61, *_59
	ldrd	r0, [fp, #-44]	@,,
	bl	fixed_multiplication		@
@ main.c:104:                     augmented[j][k] = augmented[j][k] - fixed_multiplication(ratio, augmented[i][k]);
	mov	r2, r5	@ _63, j
	mov	r3, r2	@ tmp281, _63
	lsl	r3, r3, #2	@ tmp281, tmp281,
	add	r3, r3, r2	@ tmp281, tmp281, _63
	lsl	r2, r3, #2	@ tmp282, tmp281,
	add	r3, r3, r2	@ tmp281, tmp281, tmp282
	lsl	r3, r3, #5	@ tmp283, tmp281,
	mov	r2, r3	@ _64, tmp281
	ldr	r3, [fp, #-52]	@ tmp284, augmented
	add	r2, r3, r2	@ _65, tmp284, _64
@ main.c:104:                     augmented[j][k] = augmented[j][k] - fixed_multiplication(ratio, augmented[i][k]);
	ldrsh	r3, [fp, #-30]	@ _66, k
@ main.c:104:                     augmented[j][k] = augmented[j][k] - fixed_multiplication(ratio, augmented[i][k]);
	subs	ip, r6, r0	@ tmp312, _56, _62
	str	ip, [fp, #-60]	@ tmp312, %sfp
	sbc	r1, r7, r1	@ tmp313, _56, _62
	str	r1, [fp, #-56]	@ tmp313, %sfp
@ main.c:104:                     augmented[j][k] = augmented[j][k] - fixed_multiplication(ratio, augmented[i][k]);
	lsl	r3, r3, #3	@ tmp285, _66,
	add	r3, r2, r3	@ tmp286, _65, tmp285
	ldrd	r0, [fp, #-60]	@ _67,,
	strd	r0, [r3]	@ _67, *_65
@ main.c:101:                 for (k = 0; k < ORDER; ++k)
	ldrh	r3, [fp, #-30]	@ k.7_68, k
	add	r3, r3, #1	@ tmp287, k.7_68,
	uxth	r3, r3	@ _69, tmp287
	strh	r3, [fp, #-30]	@ movhi	@ _69, k
.L29:
@ main.c:101:                 for (k = 0; k < ORDER; ++k)
	ldrsh	r3, [fp, #-30]	@ tmp288, k
	cmp	r3, #99	@ tmp288,
	ble	.L30		@,
.L28:
@ main.c:95:         for (j = 0; j < ORDER; ++j)
	uxth	r3, r5	@ j.8_70, j
	add	r3, r3, #1	@ tmp289, j.8_70,
	uxth	r3, r3	@ _71, tmp289
	sxth	r5, r3	@ j, _71
.L27:
@ main.c:95:         for (j = 0; j < ORDER; ++j)
	cmp	r5, #99	@ j,
	ble	.L31		@,
@ main.c:80:     for (i = 0; i < ORDER; ++i)
	uxth	r3, r4	@ i.9_72, i
	add	r3, r3, #1	@ tmp290, i.9_72,
	uxth	r3, r3	@ _73, tmp290
	sxth	r4, r3	@ i, _73
.L25:
@ main.c:80:     for (i = 0; i < ORDER; ++i)
	cmp	r4, #99	@ i,
	ble	.L32		@,
@ main.c:111:     for (i ^= i; i < ORDER; ++i)
	mov	r4, #0	@ i,
@ main.c:111:     for (i ^= i; i < ORDER; ++i)
	b	.L33		@
.L36:
@ main.c:113:         for (j ^= j; j < ORDER; ++j)
	mov	r5, #0	@ j,
@ main.c:113:         for (j ^= j; j < ORDER; ++j)
	b	.L34		@
.L35:
@ main.c:115:             augmented[i][j] = fixed_division(augmented[i][j], m[i][i]);
	mov	r2, r4	@ _74, i
	mov	r3, r2	@ tmp291, _74
	lsl	r3, r3, #2	@ tmp291, tmp291,
	add	r3, r3, r2	@ tmp291, tmp291, _74
	lsl	r2, r3, #2	@ tmp292, tmp291,
	add	r3, r3, r2	@ tmp291, tmp291, tmp292
	lsl	r3, r3, #5	@ tmp293, tmp291,
	mov	r2, r3	@ _75, tmp291
	ldr	r3, [fp, #-52]	@ tmp294, augmented
	add	r2, r3, r2	@ _76, tmp294, _75
@ main.c:115:             augmented[i][j] = fixed_division(augmented[i][j], m[i][i]);
	mov	r3, r5	@ _77, j
	lsl	r3, r3, #3	@ tmp295, _77,
	add	r3, r2, r3	@ tmp296, _76, tmp295
	ldrd	r0, [r3]	@ _78, *_76
@ main.c:115:             augmented[i][j] = fixed_division(augmented[i][j], m[i][i]);
	mov	r2, r4	@ _79, i
	mov	r3, r2	@ tmp297, _79
	lsl	r3, r3, #2	@ tmp297, tmp297,
	add	r3, r3, r2	@ tmp297, tmp297, _79
	lsl	r2, r3, #2	@ tmp298, tmp297,
	add	r3, r3, r2	@ tmp297, tmp297, tmp298
	lsl	r3, r3, #5	@ tmp299, tmp297,
	mov	r2, r3	@ _80, tmp297
	ldr	r3, [fp, #-48]	@ tmp300, m
	add	r2, r3, r2	@ _81, tmp300, _80
@ main.c:115:             augmented[i][j] = fixed_division(augmented[i][j], m[i][i]);
	mov	r3, r4	@ _82, i
	lsl	r3, r3, #3	@ tmp301, _82,
	add	r3, r2, r3	@ tmp302, _81, tmp301
	ldrd	r6, [r3]	@ _83, *_81
@ main.c:115:             augmented[i][j] = fixed_division(augmented[i][j], m[i][i]);
	mov	r2, r4	@ _84, i
	mov	r3, r2	@ tmp303, _84
	lsl	r3, r3, #2	@ tmp303, tmp303,
	add	r3, r3, r2	@ tmp303, tmp303, _84
	lsl	r2, r3, #2	@ tmp304, tmp303,
	add	r3, r3, r2	@ tmp303, tmp303, tmp304
	lsl	r3, r3, #5	@ tmp305, tmp303,
	mov	r2, r3	@ _85, tmp303
	ldr	r3, [fp, #-52]	@ tmp306, augmented
	add	r8, r3, r2	@ _86, tmp306, _85
@ main.c:115:             augmented[i][j] = fixed_division(augmented[i][j], m[i][i]);
	mov	r9, r5	@ _87, j
@ main.c:115:             augmented[i][j] = fixed_division(augmented[i][j], m[i][i]);
	mov	r2, r6	@, _83
	mov	r3, r7	@, _83
	bl	fixed_division		@
	mov	r2, r0	@ _88,
	mov	r3, r1	@ _88,
@ main.c:115:             augmented[i][j] = fixed_division(augmented[i][j], m[i][i]);
	lsl	r1, r9, #3	@ tmp307, _87,
	add	r1, r8, r1	@ tmp308, _86, tmp307
	strd	r2, [r1]	@ _88, *_86
@ main.c:113:         for (j ^= j; j < ORDER; ++j)
	uxth	r3, r5	@ j.10_89, j
	add	r3, r3, #1	@ tmp309, j.10_89,
	uxth	r3, r3	@ _90, tmp309
	sxth	r5, r3	@ j, _90
.L34:
@ main.c:113:         for (j ^= j; j < ORDER; ++j)
	cmp	r5, #99	@ j,
	ble	.L35		@,
@ main.c:111:     for (i ^= i; i < ORDER; ++i)
	uxth	r3, r4	@ i.11_91, i
	add	r3, r3, #1	@ tmp310, i.11_91,
	uxth	r3, r3	@ _92, tmp310
	sxth	r4, r3	@ i, _92
.L33:
@ main.c:111:     for (i ^= i; i < ORDER; ++i)
	cmp	r4, #99	@ i,
	ble	.L36		@,
@ main.c:118: }
	nop	
	sub	sp, fp, #28	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7, r8, r9, fp, pc}	@
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
	push	{fp, lr}	@
	add	fp, sp, #4	@,,
	sub	sp, sp, #159744	@,,
	sub	sp, sp, #312	@,,
	sub	r3, fp, #159744	@ tmp123,,
	sub	r3, r3, #4	@ tmp123, tmp123,
	str	r0, [r3, #-300]	@ argc, argc
	sub	r3, fp, #159744	@ tmp125,,
	sub	r3, r3, #4	@ tmp125, tmp125,
	str	r1, [r3, #-304]	@ argv, argv
@ main.c:122:     if (argc != 2)
	sub	r3, fp, #159744	@ tmp127,,
	sub	r3, r3, #4	@ tmp127, tmp127,
	ldr	r3, [r3, #-300]	@ tmp128, argc
	cmp	r3, #2	@ tmp128,
	beq	.L38		@,
@ main.c:124:         printf("Usage: ./<executable> <matrix input file>\n");
	movw	r0, #:lower16:.LC3	@,
	movt	r0, #:upper16:.LC3	@,
	bl	puts		@
@ main.c:125:         exit(1);
	mov	r0, #1	@,
	bl	exit		@
.L38:
@ main.c:128:     clock_t start = clock();
	bl	clock		@
	str	r0, [fp, #-16]	@, start
@ main.c:132:     long long augmented[ORDER][ORDER] = {0};
	sub	r3, fp, #159744	@ tmp130,,
	sub	r3, r3, #4	@ tmp130, tmp130,
	sub	r0, r3, #296	@ tmp131, tmp129,
	mov	r3, #14464	@ tmp132,
	movt	r3, 1	@ tmp132,
	mov	r2, r3	@, tmp132
	mov	r1, #0	@,
	bl	memset		@
@ main.c:137:     if ((f = fopen(argv[1], "r")) == NULL)
	sub	r3, fp, #159744	@ tmp135,,
	sub	r3, r3, #4	@ tmp135, tmp135,
	ldr	r3, [r3, #-304]	@ tmp136, argv
	add	r3, r3, #4	@ _1, tmp136,
@ main.c:137:     if ((f = fopen(argv[1], "r")) == NULL)
	ldr	r3, [r3]	@ _2, *_1
	movw	r1, #:lower16:.LC4	@,
	movt	r1, #:upper16:.LC4	@,
	mov	r0, r3	@, _2
	bl	fopen		@
	str	r0, [fp, #-20]	@, f
@ main.c:137:     if ((f = fopen(argv[1], "r")) == NULL)
	ldr	r3, [fp, #-20]	@ tmp137, f
	cmp	r3, #0	@ tmp137,
	bne	.L39		@,
@ main.c:139:         printf("Bad file name.\n");
	movw	r0, #:lower16:.LC5	@,
	movt	r0, #:upper16:.LC5	@,
	bl	puts		@
@ main.c:140:         exit(1);
	mov	r0, #1	@,
	bl	exit		@
.L39:
@ main.c:143:     for (jj = 0; jj < ORDER; jj++)
	mov	r3, #0	@ tmp138,
	str	r3, [fp, #-12]	@ tmp138, jj
@ main.c:143:     for (jj = 0; jj < ORDER; jj++)
	b	.L40		@
.L44:
@ main.c:144:         for (ii = 0; ii < ORDER; ii++)
	mov	r3, #0	@ tmp139,
	str	r3, [fp, #-8]	@ tmp139, ii
@ main.c:144:         for (ii = 0; ii < ORDER; ii++)
	b	.L41		@
.L43:
@ main.c:145:             if (fscanf(f, "%lli", &m[jj][ii]) != 1)
	sub	r2, fp, #79872	@ tmp140,,
	sub	r2, r2, #4	@ tmp140, tmp140,
	sub	r2, r2, #168	@ tmp140, tmp140,
	ldr	r1, [fp, #-12]	@ tmp141, jj
	mov	r3, r1	@ tmp142, tmp141
	lsl	r3, r3, #2	@ tmp142, tmp142,
	add	r3, r3, r1	@ tmp142, tmp142, tmp141
	lsl	r1, r3, #2	@ tmp143, tmp142,
	add	r3, r3, r1	@ tmp142, tmp142, tmp143
	lsl	r3, r3, #2	@ tmp144, tmp142,
	ldr	r1, [fp, #-8]	@ tmp146, ii
	add	r3, r3, r1	@ tmp145, tmp142, tmp146
	lsl	r3, r3, #3	@ tmp147, tmp145,
	add	r3, r2, r3	@ _3, tmp140, tmp147
	mov	r2, r3	@, _3
	movw	r1, #:lower16:.LC6	@,
	movt	r1, #:upper16:.LC6	@,
	ldr	r0, [fp, #-20]	@, f
	bl	__isoc99_fscanf		@
	mov	r3, r0	@ _4,
@ main.c:145:             if (fscanf(f, "%lli", &m[jj][ii]) != 1)
	cmp	r3, #1	@ _4,
	beq	.L42		@,
@ main.c:147:                 printf("Check file or ORDER constant.\n");
	movw	r0, #:lower16:.LC7	@,
	movt	r0, #:upper16:.LC7	@,
	bl	puts		@
@ main.c:148:                 exit(1);
	mov	r0, #1	@,
	bl	exit		@
.L42:
@ main.c:144:         for (ii = 0; ii < ORDER; ii++)
	ldr	r3, [fp, #-8]	@ tmp149, ii
	add	r3, r3, #1	@ tmp148, tmp149,
	str	r3, [fp, #-8]	@ tmp148, ii
.L41:
@ main.c:144:         for (ii = 0; ii < ORDER; ii++)
	ldr	r3, [fp, #-8]	@ tmp150, ii
	cmp	r3, #99	@ tmp150,
	ble	.L43		@,
@ main.c:143:     for (jj = 0; jj < ORDER; jj++)
	ldr	r3, [fp, #-12]	@ tmp152, jj
	add	r3, r3, #1	@ tmp151, tmp152,
	str	r3, [fp, #-12]	@ tmp151, jj
.L40:
@ main.c:143:     for (jj = 0; jj < ORDER; jj++)
	ldr	r3, [fp, #-12]	@ tmp153, jj
	cmp	r3, #99	@ tmp153,
	ble	.L44		@,
@ main.c:151:     fclose(f);
	ldr	r0, [fp, #-20]	@, f
	bl	fclose		@
@ main.c:153:     gaussJordan(m, augmented);
	sub	r2, fp, #159744	@ tmp154,,
	sub	r2, r2, #4	@ tmp154, tmp154,
	sub	r2, r2, #296	@ tmp154, tmp154,
	sub	r3, fp, #79872	@ tmp155,,
	sub	r3, r3, #4	@ tmp155, tmp155,
	sub	r3, r3, #168	@ tmp155, tmp155,
	mov	r1, r2	@, tmp154
	mov	r0, r3	@, tmp155
	bl	gaussJordan		@
@ main.c:155:     clock_t alg_end = clock();
	bl	clock		@
	str	r0, [fp, #-24]	@, alg_end
@ main.c:157:     printMatrix(augmented);
	sub	r3, fp, #159744	@ tmp156,,
	sub	r3, r3, #4	@ tmp156, tmp156,
	sub	r3, r3, #296	@ tmp156, tmp156,
	mov	r0, r3	@, tmp156
	bl	printMatrix		@
@ main.c:159:     clock_t end = clock();
	bl	clock		@
	str	r0, [fp, #-28]	@, end
@ main.c:160:     double alg_time = ((double)(alg_end - start)) * 1000 / CLOCKS_PER_SEC;
	ldr	r2, [fp, #-24]	@ tmp157, alg_end
	ldr	r3, [fp, #-16]	@ tmp158, start
	sub	r3, r2, r3	@ _5, tmp157, tmp158
@ main.c:160:     double alg_time = ((double)(alg_end - start)) * 1000 / CLOCKS_PER_SEC;
	vmov	s15, r3	@ int	@ _5, _5
	vcvt.f64.s32	d7, s15	@ _6, _5
@ main.c:160:     double alg_time = ((double)(alg_end - start)) * 1000 / CLOCKS_PER_SEC;
	vldr.64	d6, .L46	@ tmp159,
	vmul.f64	d6, d7, d6	@ _7, _6, tmp159
@ main.c:160:     double alg_time = ((double)(alg_end - start)) * 1000 / CLOCKS_PER_SEC;
	vldr.64	d5, .L46+8	@ tmp161,
	vdiv.f64	d7, d6, d5	@ tmp160, _7, tmp161
	vstr.64	d7, [fp, #-36]	@ tmp160, alg_time
@ main.c:161:     double total_time = ((double)(end - start)) * 1000 / CLOCKS_PER_SEC;
	ldr	r2, [fp, #-28]	@ tmp162, end
	ldr	r3, [fp, #-16]	@ tmp163, start
	sub	r3, r2, r3	@ _8, tmp162, tmp163
@ main.c:161:     double total_time = ((double)(end - start)) * 1000 / CLOCKS_PER_SEC;
	vmov	s15, r3	@ int	@ _8, _8
	vcvt.f64.s32	d7, s15	@ _9, _8
@ main.c:161:     double total_time = ((double)(end - start)) * 1000 / CLOCKS_PER_SEC;
	vldr.64	d6, .L46	@ tmp164,
	vmul.f64	d6, d7, d6	@ _10, _9, tmp164
@ main.c:161:     double total_time = ((double)(end - start)) * 1000 / CLOCKS_PER_SEC;
	vldr.64	d5, .L46+8	@ tmp166,
	vdiv.f64	d7, d6, d5	@ tmp165, _10, tmp166
	vstr.64	d7, [fp, #-44]	@ tmp165, total_time
@ main.c:162:     printf("Time to run algorithm: %fms\nTime to run full program: %fms\n", alg_time, total_time);
	ldrd	r2, [fp, #-44]	@ tmp167,,
	strd	r2, [sp]	@ tmp167,
	ldrd	r2, [fp, #-36]	@,,
	movw	r0, #:lower16:.LC8	@,
	movt	r0, #:upper16:.LC8	@,
	bl	printf		@
@ main.c:164:     return (0);
	mov	r3, #0	@ _44,
@ main.c:165: };
	mov	r0, r3	@, <retval>
	sub	sp, fp, #4	@,,
	@ sp needed	@
	pop	{fp, pc}	@
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
