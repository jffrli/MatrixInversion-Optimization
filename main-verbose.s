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
@ main.c:23:     printf("\nInverse Matrix is:\n");
	movw	r0, #:lower16:.LC0	@,
	movt	r0, #:upper16:.LC0	@,
	bl	puts		@
@ main.c:25:     for (i ^= i; i < ORDER; ++i)
	mov	r4, #0	@ i,
@ main.c:25:     for (i ^= i; i < ORDER; ++i)
	b	.L6		@
.L9:
@ main.c:27:         for (j ^= j; j < ORDER - 1; j += 2)
	mov	r5, #0	@ j,
@ main.c:27:         for (j ^= j; j < ORDER - 1; j += 2)
	b	.L7		@
.L8:
@ main.c:29:             printf("%i\t", (short int)augmented[i][j]);
	mov	r2, r4	@ _1, i
	mov	r3, r2	@ tmp131, _1
	lsl	r3, r3, #2	@ tmp131, tmp131,
	add	r3, r3, r2	@ tmp131, tmp131, _1
	lsl	r2, r3, #2	@ tmp132, tmp131,
	add	r3, r3, r2	@ tmp131, tmp131, tmp132
	lsl	r3, r3, #5	@ tmp133, tmp131,
	mov	r2, r3	@ _2, tmp131
	ldr	r3, [fp, #-16]	@ tmp134, augmented
	add	r2, r3, r2	@ _3, tmp134, _2
@ main.c:29:             printf("%i\t", (short int)augmented[i][j]);
	mov	r3, r5	@ _4, j
	lsl	r3, r3, #3	@ tmp135, _4,
	add	r3, r2, r3	@ tmp136, _3, tmp135
	ldrd	r2, [r3]	@ _5, *_3
@ main.c:29:             printf("%i\t", (short int)augmented[i][j]);
	sxth	r3, r2	@ _6, _5
@ main.c:29:             printf("%i\t", (short int)augmented[i][j]);
	mov	r1, r3	@, _7
	movw	r0, #:lower16:.LC1	@,
	movt	r0, #:upper16:.LC1	@,
	bl	printf		@
@ main.c:30:             printf("%i\t", (short int)augmented[i][j + 1]);
	mov	r2, r4	@ _8, i
	mov	r3, r2	@ tmp137, _8
	lsl	r3, r3, #2	@ tmp137, tmp137,
	add	r3, r3, r2	@ tmp137, tmp137, _8
	lsl	r2, r3, #2	@ tmp138, tmp137,
	add	r3, r3, r2	@ tmp137, tmp137, tmp138
	lsl	r3, r3, #5	@ tmp139, tmp137,
	mov	r2, r3	@ _9, tmp137
	ldr	r3, [fp, #-16]	@ tmp140, augmented
	add	r2, r3, r2	@ _10, tmp140, _9
@ main.c:30:             printf("%i\t", (short int)augmented[i][j + 1]);
	mov	r3, r5	@ _11, j
	add	r3, r3, #1	@ _12, _11,
@ main.c:30:             printf("%i\t", (short int)augmented[i][j + 1]);
	lsl	r3, r3, #3	@ tmp141, _12,
	add	r3, r2, r3	@ tmp142, _10, tmp141
	ldrd	r2, [r3]	@ _13, *_10
@ main.c:30:             printf("%i\t", (short int)augmented[i][j + 1]);
	sxth	r3, r2	@ _14, _13
@ main.c:30:             printf("%i\t", (short int)augmented[i][j + 1]);
	mov	r1, r3	@, _15
	movw	r0, #:lower16:.LC1	@,
	movt	r0, #:upper16:.LC1	@,
	bl	printf		@
@ main.c:27:         for (j ^= j; j < ORDER - 1; j += 2)
	uxth	r3, r5	@ j.0_16, j
	add	r3, r3, #2	@ tmp143, j.0_16,
	uxth	r3, r3	@ _17, tmp143
	sxth	r5, r3	@ j, _17
.L7:
@ main.c:27:         for (j ^= j; j < ORDER - 1; j += 2)
	cmp	r5, #98	@ j,
	ble	.L8		@,
@ main.c:32:         printf("\n");
	mov	r0, #10	@,
	bl	putchar		@
@ main.c:25:     for (i ^= i; i < ORDER; ++i)
	uxth	r3, r4	@ i.1_18, i
	add	r3, r3, #1	@ tmp144, i.1_18,
	uxth	r3, r3	@ _19, tmp144
	sxth	r4, r3	@ i, _19
.L6:
@ main.c:25:     for (i ^= i; i < ORDER; ++i)
	cmp	r4, #99	@ i,
	ble	.L9		@,
@ main.c:34: }
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
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}	@
	add	fp, sp, #8	@,,
	sub	sp, sp, #20	@,,
	str	r0, [fp, #-24]	@ m, m
	mov	r3, r1	@ tmp151, n
	strh	r3, [fp, #-26]	@ movhi	@ tmp152, n
	mov	r3, r2	@ movhi	@ tmp154, tmp153
	strh	r3, [fp, #-28]	@ movhi	@ tmp154, i
@ main.c:39:     for (k ^= k; k < ORDER - 1; k += 2)
	mov	r4, #0	@ k,
@ main.c:39:     for (k ^= k; k < ORDER - 1; k += 2)
	b	.L11		@
.L12:
@ main.c:41:         long long t = m[i][k];
	ldrsh	r2, [fp, #-28]	@ _1, i
	mov	r3, r2	@ tmp155, _1
	lsl	r3, r3, #2	@ tmp155, tmp155,
	add	r3, r3, r2	@ tmp155, tmp155, _1
	lsl	r2, r3, #2	@ tmp156, tmp155,
	add	r3, r3, r2	@ tmp155, tmp155, tmp156
	lsl	r3, r3, #5	@ tmp157, tmp155,
	mov	r2, r3	@ _2, tmp155
	ldr	r3, [fp, #-24]	@ tmp158, m
	add	r2, r3, r2	@ _3, tmp158, _2
@ main.c:41:         long long t = m[i][k];
	mov	r3, r4	@ _4, k
@ main.c:41:         long long t = m[i][k];
	lsl	r3, r3, #3	@ tmp159, _4,
	add	r3, r2, r3	@ tmp160, _3, tmp159
	ldrd	r2, [r3]	@ tmp161, *_3
	strd	r2, [fp, #-20]	@ tmp161,,
@ main.c:42:         m[i][k] = m[n][k];
	ldrsh	r2, [fp, #-26]	@ _5, n
	mov	r3, r2	@ tmp162, _5
	lsl	r3, r3, #2	@ tmp162, tmp162,
	add	r3, r3, r2	@ tmp162, tmp162, _5
	lsl	r2, r3, #2	@ tmp163, tmp162,
	add	r3, r3, r2	@ tmp162, tmp162, tmp163
	lsl	r3, r3, #5	@ tmp164, tmp162,
	mov	r2, r3	@ _6, tmp162
	ldr	r3, [fp, #-24]	@ tmp165, m
	add	r1, r3, r2	@ _7, tmp165, _6
@ main.c:42:         m[i][k] = m[n][k];
	mov	lr, r4	@ _8, k
@ main.c:42:         m[i][k] = m[n][k];
	ldrsh	r2, [fp, #-28]	@ _9, i
	mov	r3, r2	@ tmp166, _9
	lsl	r3, r3, #2	@ tmp166, tmp166,
	add	r3, r3, r2	@ tmp166, tmp166, _9
	lsl	r2, r3, #2	@ tmp167, tmp166,
	add	r3, r3, r2	@ tmp166, tmp166, tmp167
	lsl	r3, r3, #5	@ tmp168, tmp166,
	mov	r2, r3	@ _10, tmp166
	ldr	r3, [fp, #-24]	@ tmp169, m
	add	r0, r3, r2	@ _11, tmp169, _10
@ main.c:42:         m[i][k] = m[n][k];
	mov	ip, r4	@ _12, k
@ main.c:42:         m[i][k] = m[n][k];
	lsl	r3, lr, #3	@ tmp170, _8,
	add	r3, r1, r3	@ tmp171, _7, tmp170
	ldrd	r2, [r3]	@ _13, *_7
@ main.c:42:         m[i][k] = m[n][k];
	lsl	r1, ip, #3	@ tmp172, _12,
	add	r1, r0, r1	@ tmp173, _11, tmp172
	strd	r2, [r1]	@ _13, *_11
@ main.c:43:         m[n][k] = t;
	ldrsh	r2, [fp, #-26]	@ _14, n
	mov	r3, r2	@ tmp174, _14
	lsl	r3, r3, #2	@ tmp174, tmp174,
	add	r3, r3, r2	@ tmp174, tmp174, _14
	lsl	r2, r3, #2	@ tmp175, tmp174,
	add	r3, r3, r2	@ tmp174, tmp174, tmp175
	lsl	r3, r3, #5	@ tmp176, tmp174,
	mov	r2, r3	@ _15, tmp174
	ldr	r3, [fp, #-24]	@ tmp177, m
	add	r2, r3, r2	@ _16, tmp177, _15
@ main.c:43:         m[n][k] = t;
	mov	r3, r4	@ _17, k
@ main.c:43:         m[n][k] = t;
	lsl	r3, r3, #3	@ tmp178, _17,
	add	r1, r2, r3	@ tmp179, _16, tmp178
	ldrd	r2, [fp, #-20]	@ tmp180,,
	strd	r2, [r1]	@ tmp180, *_16
@ main.c:44:         t = m[i][k + 1];
	ldrsh	r2, [fp, #-28]	@ _18, i
	mov	r3, r2	@ tmp181, _18
	lsl	r3, r3, #2	@ tmp181, tmp181,
	add	r3, r3, r2	@ tmp181, tmp181, _18
	lsl	r2, r3, #2	@ tmp182, tmp181,
	add	r3, r3, r2	@ tmp181, tmp181, tmp182
	lsl	r3, r3, #5	@ tmp183, tmp181,
	mov	r2, r3	@ _19, tmp181
	ldr	r3, [fp, #-24]	@ tmp184, m
	add	r2, r3, r2	@ _20, tmp184, _19
@ main.c:44:         t = m[i][k + 1];
	mov	r3, r4	@ _21, k
	add	r3, r3, #1	@ _22, _21,
@ main.c:44:         t = m[i][k + 1];
	lsl	r3, r3, #3	@ tmp185, _22,
	add	r3, r2, r3	@ tmp186, _20, tmp185
	ldrd	r2, [r3]	@ tmp187, *_20
	strd	r2, [fp, #-20]	@ tmp187,,
@ main.c:45:         m[i][k + 1] = m[n][k + 1];
	ldrsh	r2, [fp, #-26]	@ _23, n
	mov	r3, r2	@ tmp188, _23
	lsl	r3, r3, #2	@ tmp188, tmp188,
	add	r3, r3, r2	@ tmp188, tmp188, _23
	lsl	r2, r3, #2	@ tmp189, tmp188,
	add	r3, r3, r2	@ tmp188, tmp188, tmp189
	lsl	r3, r3, #5	@ tmp190, tmp188,
	mov	r2, r3	@ _24, tmp188
	ldr	r3, [fp, #-24]	@ tmp191, m
	add	ip, r3, r2	@ _25, tmp191, _24
@ main.c:45:         m[i][k + 1] = m[n][k + 1];
	mov	r3, r4	@ _26, k
	add	lr, r3, #1	@ _27, _26,
@ main.c:45:         m[i][k + 1] = m[n][k + 1];
	ldrsh	r2, [fp, #-28]	@ _28, i
	mov	r3, r2	@ tmp192, _28
	lsl	r3, r3, #2	@ tmp192, tmp192,
	add	r3, r3, r2	@ tmp192, tmp192, _28
	lsl	r2, r3, #2	@ tmp193, tmp192,
	add	r3, r3, r2	@ tmp192, tmp192, tmp193
	lsl	r3, r3, #5	@ tmp194, tmp192,
	mov	r2, r3	@ _29, tmp192
	ldr	r3, [fp, #-24]	@ tmp195, m
	add	r0, r3, r2	@ _30, tmp195, _29
@ main.c:45:         m[i][k + 1] = m[n][k + 1];
	mov	r3, r4	@ _31, k
	add	r1, r3, #1	@ _32, _31,
@ main.c:45:         m[i][k + 1] = m[n][k + 1];
	lsl	r3, lr, #3	@ tmp196, _27,
	add	r3, ip, r3	@ tmp197, _25, tmp196
	ldrd	r2, [r3]	@ _33, *_25
@ main.c:45:         m[i][k + 1] = m[n][k + 1];
	lsl	r1, r1, #3	@ tmp198, _32,
	add	r1, r0, r1	@ tmp199, _30, tmp198
	strd	r2, [r1]	@ _33, *_30
@ main.c:46:         m[n][k + 1] = t;
	ldrsh	r2, [fp, #-26]	@ _34, n
	mov	r3, r2	@ tmp200, _34
	lsl	r3, r3, #2	@ tmp200, tmp200,
	add	r3, r3, r2	@ tmp200, tmp200, _34
	lsl	r2, r3, #2	@ tmp201, tmp200,
	add	r3, r3, r2	@ tmp200, tmp200, tmp201
	lsl	r3, r3, #5	@ tmp202, tmp200,
	mov	r2, r3	@ _35, tmp200
	ldr	r3, [fp, #-24]	@ tmp203, m
	add	r2, r3, r2	@ _36, tmp203, _35
@ main.c:46:         m[n][k + 1] = t;
	mov	r3, r4	@ _37, k
	add	r3, r3, #1	@ _38, _37,
@ main.c:46:         m[n][k + 1] = t;
	lsl	r3, r3, #3	@ tmp204, _38,
	add	r1, r2, r3	@ tmp205, _36, tmp204
	ldrd	r2, [fp, #-20]	@ tmp206,,
	strd	r2, [r1]	@ tmp206, *_36
@ main.c:39:     for (k ^= k; k < ORDER - 1; k += 2)
	uxth	r3, r4	@ k.2_39, k
	add	r3, r3, #2	@ tmp207, k.2_39,
	uxth	r3, r3	@ _40, tmp207
	sxth	r4, r3	@ k, _40
.L11:
@ main.c:39:     for (k ^= k; k < ORDER - 1; k += 2)
	cmp	r4, #98	@ k,
	ble	.L12		@,
@ main.c:48: }
	nop	
	sub	sp, fp, #8	@,,
	@ sp needed	@
	pop	{r4, fp, pc}	@
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
	@ args = 0, pretend = 0, frame = 96
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, fp, lr}	@
	add	fp, sp, #28	@,,
	sub	sp, sp, #96	@,,
	str	r0, [fp, #-96]	@ m, m
	str	r1, [fp, #-100]	@ augmented, augmented
@ main.c:53:     for (i ^= i; i < ORDER; i += 2)
	mov	r6, #0	@ i,
@ main.c:53:     for (i ^= i; i < ORDER; i += 2)
	b	.L14		@
.L15:
@ main.c:55:         augmented[i][i] = 1 << SHIFT_AMOUNT;
	mov	r2, r6	@ _1, i
	mov	r3, r2	@ tmp308, _1
	lsl	r3, r3, #2	@ tmp308, tmp308,
	add	r3, r3, r2	@ tmp308, tmp308, _1
	lsl	r2, r3, #2	@ tmp309, tmp308,
	add	r3, r3, r2	@ tmp308, tmp308, tmp309
	lsl	r3, r3, #5	@ tmp310, tmp308,
	mov	r2, r3	@ _2, tmp308
	ldr	r3, [fp, #-100]	@ tmp311, augmented
	add	r2, r3, r2	@ _3, tmp311, _2
@ main.c:55:         augmented[i][i] = 1 << SHIFT_AMOUNT;
	mov	r3, r6	@ _4, i
@ main.c:55:         augmented[i][i] = 1 << SHIFT_AMOUNT;
	lsl	r3, r3, #3	@ tmp312, _4,
	add	r1, r2, r3	@ tmp313, _3, tmp312
	mov	r2, #65536	@ tmp314,
	mov	r3, #0	@,
	strd	r2, [r1]	@ tmp314, *_3
@ main.c:56:         augmented[i + 1][i + 1] = 1 << SHIFT_AMOUNT;
	mov	r3, r6	@ _5, i
	add	r2, r3, #1	@ _6, _5,
	mov	r3, r2	@ tmp315, _6
	lsl	r3, r3, #2	@ tmp315, tmp315,
	add	r3, r3, r2	@ tmp315, tmp315, _6
	lsl	r2, r3, #2	@ tmp316, tmp315,
	add	r3, r3, r2	@ tmp315, tmp315, tmp316
	lsl	r3, r3, #5	@ tmp317, tmp315,
	mov	r2, r3	@ _7, tmp315
	ldr	r3, [fp, #-100]	@ tmp318, augmented
	add	r2, r3, r2	@ _8, tmp318, _7
@ main.c:56:         augmented[i + 1][i + 1] = 1 << SHIFT_AMOUNT;
	mov	r3, r6	@ _9, i
	add	r3, r3, #1	@ _10, _9,
@ main.c:56:         augmented[i + 1][i + 1] = 1 << SHIFT_AMOUNT;
	lsl	r3, r3, #3	@ tmp319, _10,
	add	r1, r2, r3	@ tmp320, _8, tmp319
	mov	r2, #65536	@ tmp321,
	mov	r3, #0	@,
	strd	r2, [r1]	@ tmp321, *_8
@ main.c:53:     for (i ^= i; i < ORDER; i += 2)
	uxth	r3, r6	@ i.3_11, i
	add	r3, r3, #2	@ tmp322, i.3_11,
	uxth	r3, r3	@ _12, tmp322
	sxth	r6, r3	@ i, _12
.L14:
@ main.c:53:     for (i ^= i; i < ORDER; i += 2)
	cmp	r6, #99	@ i,
	ble	.L15		@,
@ main.c:59:     for (i ^= i; i < ORDER; ++i)
	mov	r6, #0	@ i,
@ main.c:59:     for (i ^= i; i < ORDER; ++i)
	b	.L16		@
.L19:
@ main.c:61:         for (j ^= j; j < ORDER; ++j)
	mov	r7, #0	@ j,
@ main.c:61:         for (j ^= j; j < ORDER; ++j)
	b	.L17		@
.L18:
@ main.c:63:             m[i][j] = m[i][j] << SHIFT_AMOUNT;
	mov	r2, r6	@ _13, i
	mov	r3, r2	@ tmp323, _13
	lsl	r3, r3, #2	@ tmp323, tmp323,
	add	r3, r3, r2	@ tmp323, tmp323, _13
	lsl	r2, r3, #2	@ tmp324, tmp323,
	add	r3, r3, r2	@ tmp323, tmp323, tmp324
	lsl	r3, r3, #5	@ tmp325, tmp323,
	mov	r2, r3	@ _14, tmp323
	ldr	r3, [fp, #-96]	@ tmp326, m
	add	r2, r3, r2	@ _15, tmp326, _14
@ main.c:63:             m[i][j] = m[i][j] << SHIFT_AMOUNT;
	mov	r3, r7	@ _16, j
	lsl	r3, r3, #3	@ tmp327, _16,
	add	r3, r2, r3	@ tmp328, _15, tmp327
	ldrd	r4, [r3]	@ _17, *_15
@ main.c:63:             m[i][j] = m[i][j] << SHIFT_AMOUNT;
	mov	r2, r6	@ _18, i
	mov	r3, r2	@ tmp329, _18
	lsl	r3, r3, #2	@ tmp329, tmp329,
	add	r3, r3, r2	@ tmp329, tmp329, _18
	lsl	r2, r3, #2	@ tmp330, tmp329,
	add	r3, r3, r2	@ tmp329, tmp329, tmp330
	lsl	r3, r3, #5	@ tmp331, tmp329,
	mov	r2, r3	@ _19, tmp329
	ldr	r3, [fp, #-96]	@ tmp332, m
	add	r2, r3, r2	@ _20, tmp332, _19
@ main.c:63:             m[i][j] = m[i][j] << SHIFT_AMOUNT;
	mov	r3, r7	@ _21, j
@ main.c:63:             m[i][j] = m[i][j] << SHIFT_AMOUNT;
	mov	r0, #0	@ _22,
	mov	r1, #0	@ _22,
	lsl	r1, r5, #16	@ _22, _17,
	orr	r1, r1, r4, lsr #16	@ _22, _22, _17,
	lsl	r0, r4, #16	@ _22, _17,
@ main.c:63:             m[i][j] = m[i][j] << SHIFT_AMOUNT;
	lsl	r3, r3, #3	@ tmp335, _21,
	add	r3, r2, r3	@ tmp336, _20, tmp335
	strd	r0, [r3]	@ _22, *_20
@ main.c:61:         for (j ^= j; j < ORDER; ++j)
	uxth	r3, r7	@ j.4_23, j
	add	r3, r3, #1	@ tmp337, j.4_23,
	uxth	r3, r3	@ _24, tmp337
	sxth	r7, r3	@ j, _24
.L17:
@ main.c:61:         for (j ^= j; j < ORDER; ++j)
	cmp	r7, #99	@ j,
	ble	.L18		@,
@ main.c:59:     for (i ^= i; i < ORDER; ++i)
	uxth	r3, r6	@ i.5_25, i
	add	r3, r3, #1	@ tmp338, i.5_25,
	uxth	r3, r3	@ _26, tmp338
	sxth	r6, r3	@ i, _26
.L16:
@ main.c:59:     for (i ^= i; i < ORDER; ++i)
	cmp	r6, #99	@ i,
	ble	.L19		@,
@ main.c:69:     for (i ^= i; i < ORDER; ++i)
	mov	r6, #0	@ i,
@ main.c:69:     for (i ^= i; i < ORDER; ++i)
	b	.L20		@
.L33:
@ main.c:73:         long long largest = m[i][i], mag;
	mov	r2, r6	@ _27, i
	mov	r3, r2	@ tmp339, _27
	lsl	r3, r3, #2	@ tmp339, tmp339,
	add	r3, r3, r2	@ tmp339, tmp339, _27
	lsl	r2, r3, #2	@ tmp340, tmp339,
	add	r3, r3, r2	@ tmp339, tmp339, tmp340
	lsl	r3, r3, #5	@ tmp341, tmp339,
	mov	r2, r3	@ _28, tmp339
	ldr	r3, [fp, #-96]	@ tmp342, m
	add	r2, r3, r2	@ _29, tmp342, _28
@ main.c:73:         long long largest = m[i][i], mag;
	mov	r3, r6	@ _30, i
@ main.c:73:         long long largest = m[i][i], mag;
	lsl	r3, r3, #3	@ tmp343, _30,
	add	r3, r2, r3	@ tmp344, _29, tmp343
	ldrd	r2, [r3]	@ tmp345, *_29
	strd	r2, [fp, #-36]	@ tmp345,,
@ main.c:75:         short int n = i;
	strh	r6, [fp, #-40]	@ movhi	@ i, n
@ main.c:77:         for (k = i + 1; k < ORDER - 1; k += 2)
	uxth	r3, r6	@ i.6_31, i
	add	r3, r3, #1	@ tmp346, i.6_31,
	uxth	r3, r3	@ _32, tmp346
@ main.c:77:         for (k = i + 1; k < ORDER - 1; k += 2)
	strh	r3, [fp, #-38]	@ movhi	@ _32, k
@ main.c:77:         for (k = i + 1; k < ORDER - 1; k += 2)
	b	.L21		@
.L24:
@ main.c:79:             mag = abs(m[k][i]);
	ldrsh	r2, [fp, #-38]	@ _33, k
	mov	r3, r2	@ tmp347, _33
	lsl	r3, r3, #2	@ tmp347, tmp347,
	add	r3, r3, r2	@ tmp347, tmp347, _33
	lsl	r2, r3, #2	@ tmp348, tmp347,
	add	r3, r3, r2	@ tmp347, tmp347, tmp348
	lsl	r3, r3, #5	@ tmp349, tmp347,
	mov	r2, r3	@ _34, tmp347
	ldr	r3, [fp, #-96]	@ tmp350, m
	add	r2, r3, r2	@ _35, tmp350, _34
@ main.c:79:             mag = abs(m[k][i]);
	mov	r3, r6	@ _36, i
	lsl	r3, r3, #3	@ tmp351, _36,
	add	r3, r2, r3	@ tmp352, _35, tmp351
	ldrd	r2, [r3]	@ _37, *_35
@ main.c:79:             mag = abs(m[k][i]);
	mov	r3, r2	@ _38, _37
	cmp	r3, #0	@ _39,
	rsblt	r3, r3, #0	@ _39, _38,
@ main.c:79:             mag = abs(m[k][i]);
	mov	r2, r3	@ tmp353, _39
	asr	r3, r2, #31	@, tmp353,
	strd	r2, [fp, #-68]	@ tmp353,,
@ main.c:80:             if (mag > largest)
	ldrd	r2, [fp, #-68]	@ tmp354,,
	ldrd	r0, [fp, #-36]	@ tmp355,,
	cmp	r0, r2	@ tmp355, tmp354
	sbcs	r3, r1, r3	@ tmp537,,
	bge	.L22		@,
@ main.c:82:                 largest = mag;
	ldrd	r2, [fp, #-68]	@ tmp356,,
	strd	r2, [fp, #-36]	@ tmp356,,
@ main.c:83:                 n = k;
	ldrh	r3, [fp, #-38]	@ movhi	@ tmp357, k
	strh	r3, [fp, #-40]	@ movhi	@ tmp357, n
.L22:
@ main.c:85:             mag = abs(m[k + 1][i]);
	ldrsh	r3, [fp, #-38]	@ _40, k
	add	r2, r3, #1	@ _41, _40,
	mov	r3, r2	@ tmp358, _41
	lsl	r3, r3, #2	@ tmp358, tmp358,
	add	r3, r3, r2	@ tmp358, tmp358, _41
	lsl	r2, r3, #2	@ tmp359, tmp358,
	add	r3, r3, r2	@ tmp358, tmp358, tmp359
	lsl	r3, r3, #5	@ tmp360, tmp358,
	mov	r2, r3	@ _42, tmp358
	ldr	r3, [fp, #-96]	@ tmp361, m
	add	r2, r3, r2	@ _43, tmp361, _42
@ main.c:85:             mag = abs(m[k + 1][i]);
	mov	r3, r6	@ _44, i
	lsl	r3, r3, #3	@ tmp362, _44,
	add	r3, r2, r3	@ tmp363, _43, tmp362
	ldrd	r2, [r3]	@ _45, *_43
@ main.c:85:             mag = abs(m[k + 1][i]);
	mov	r3, r2	@ _46, _45
	cmp	r3, #0	@ _47,
	rsblt	r3, r3, #0	@ _47, _46,
@ main.c:85:             mag = abs(m[k + 1][i]);
	mov	r2, r3	@ tmp364, _47
	asr	r3, r2, #31	@, tmp364,
	strd	r2, [fp, #-68]	@ tmp364,,
@ main.c:86:             if (mag > largest)
	ldrd	r2, [fp, #-68]	@ tmp365,,
	ldrd	r0, [fp, #-36]	@ tmp366,,
	cmp	r0, r2	@ tmp366, tmp365
	sbcs	r3, r1, r3	@ tmp538,,
	bge	.L23		@,
@ main.c:88:                 largest = mag;
	ldrd	r2, [fp, #-68]	@ tmp367,,
	strd	r2, [fp, #-36]	@ tmp367,,
@ main.c:89:                 n = k + 1;
	ldrh	r3, [fp, #-38]	@ k.7_48, k
	add	r3, r3, #1	@ tmp368, k.7_48,
	uxth	r3, r3	@ _49, tmp368
@ main.c:89:                 n = k + 1;
	strh	r3, [fp, #-40]	@ movhi	@ _49, n
.L23:
@ main.c:77:         for (k = i + 1; k < ORDER - 1; k += 2)
	ldrh	r3, [fp, #-38]	@ k.8_50, k
	add	r3, r3, #2	@ tmp369, k.8_50,
	uxth	r3, r3	@ _51, tmp369
	strh	r3, [fp, #-38]	@ movhi	@ _51, k
.L21:
@ main.c:77:         for (k = i + 1; k < ORDER - 1; k += 2)
	ldrsh	r3, [fp, #-38]	@ tmp370, k
	cmp	r3, #98	@ tmp370,
	ble	.L24		@,
@ main.c:93:         swapRows(m, n, i);
	ldrsh	r3, [fp, #-40]	@ tmp371, n
	mov	r2, r6	@, i
	mov	r1, r3	@, tmp371
	ldr	r0, [fp, #-96]	@, m
	bl	swapRows		@
@ main.c:94:         swapRows(augmented, n, i);
	ldrsh	r3, [fp, #-40]	@ tmp372, n
	mov	r2, r6	@, i
	mov	r1, r3	@, tmp372
	ldr	r0, [fp, #-100]	@, augmented
	bl	swapRows		@
@ main.c:96:         if (m[i][i] == 0)
	mov	r2, r6	@ _52, i
	mov	r3, r2	@ tmp373, _52
	lsl	r3, r3, #2	@ tmp373, tmp373,
	add	r3, r3, r2	@ tmp373, tmp373, _52
	lsl	r2, r3, #2	@ tmp374, tmp373,
	add	r3, r3, r2	@ tmp373, tmp373, tmp374
	lsl	r3, r3, #5	@ tmp375, tmp373,
	mov	r2, r3	@ _53, tmp373
	ldr	r3, [fp, #-96]	@ tmp376, m
	add	r2, r3, r2	@ _54, tmp376, _53
@ main.c:96:         if (m[i][i] == 0)
	mov	r3, r6	@ _55, i
	lsl	r3, r3, #3	@ tmp377, _55,
	add	r3, r2, r3	@ tmp378, _54, tmp377
	ldrd	r2, [r3]	@ _56, *_54
@ main.c:96:         if (m[i][i] == 0)
	orrs	r3, r2, r3	@ tmp539, _56
	bne	.L25		@,
@ main.c:98:             printf("The matrix is ill-conditioned.\n");
	movw	r0, #:lower16:.LC2	@,
	movt	r0, #:upper16:.LC2	@,
	bl	puts		@
@ main.c:99:             exit(0);
	mov	r0, #0	@,
	bl	exit		@
.L25:
@ main.c:102:         for (j ^= j; j < ORDER; ++j)
	mov	r7, #0	@ j,
@ main.c:102:         for (j ^= j; j < ORDER; ++j)
	b	.L26		@
.L32:
@ main.c:104:             if (i != j)
	cmp	r6, r7	@ i, j
	beq	.L27		@,
@ main.c:106:                 long long ratio = fixed_division(m[j][i], m[i][i]); // Float bad
	mov	r2, r7	@ _57, j
	mov	r3, r2	@ tmp379, _57
	lsl	r3, r3, #2	@ tmp379, tmp379,
	add	r3, r3, r2	@ tmp379, tmp379, _57
	lsl	r2, r3, #2	@ tmp380, tmp379,
	add	r3, r3, r2	@ tmp379, tmp379, tmp380
	lsl	r3, r3, #5	@ tmp381, tmp379,
	mov	r2, r3	@ _58, tmp379
	ldr	r3, [fp, #-96]	@ tmp382, m
	add	r2, r3, r2	@ _59, tmp382, _58
@ main.c:106:                 long long ratio = fixed_division(m[j][i], m[i][i]); // Float bad
	mov	r3, r6	@ _60, i
	lsl	r3, r3, #3	@ tmp383, _60,
	add	r3, r2, r3	@ tmp384, _59, tmp383
	ldrd	r0, [r3]	@ _61, *_59
@ main.c:106:                 long long ratio = fixed_division(m[j][i], m[i][i]); // Float bad
	mov	r2, r6	@ _62, i
	mov	r3, r2	@ tmp385, _62
	lsl	r3, r3, #2	@ tmp385, tmp385,
	add	r3, r3, r2	@ tmp385, tmp385, _62
	lsl	r2, r3, #2	@ tmp386, tmp385,
	add	r3, r3, r2	@ tmp385, tmp385, tmp386
	lsl	r3, r3, #5	@ tmp387, tmp385,
	mov	r2, r3	@ _63, tmp385
	ldr	r3, [fp, #-96]	@ tmp388, m
	add	r2, r3, r2	@ _64, tmp388, _63
@ main.c:106:                 long long ratio = fixed_division(m[j][i], m[i][i]); // Float bad
	mov	r3, r6	@ _65, i
	lsl	r3, r3, #3	@ tmp389, _65,
	add	r3, r2, r3	@ tmp390, _64, tmp389
	ldrd	r2, [r3]	@ _66, *_64
	bl	fixed_division		@
	strd	r0, [fp, #-76]	@,,
@ main.c:107:                 for (k ^= k; k < ORDER - 1; k += 2)
	mov	r3, #0	@ tmp392,
	strh	r3, [fp, #-38]	@ movhi	@ tmp391, k
@ main.c:107:                 for (k ^= k; k < ORDER - 1; k += 2)
	b	.L28		@
.L29:
@ main.c:109:                     m[j][k] = m[j][k] - fixed_multiplication(ratio, m[i][k]);
	mov	r2, r7	@ _67, j
	mov	r3, r2	@ tmp393, _67
	lsl	r3, r3, #2	@ tmp393, tmp393,
	add	r3, r3, r2	@ tmp393, tmp393, _67
	lsl	r2, r3, #2	@ tmp394, tmp393,
	add	r3, r3, r2	@ tmp393, tmp393, tmp394
	lsl	r3, r3, #5	@ tmp395, tmp393,
	mov	r2, r3	@ _68, tmp393
	ldr	r3, [fp, #-96]	@ tmp396, m
	add	r2, r3, r2	@ _69, tmp396, _68
@ main.c:109:                     m[j][k] = m[j][k] - fixed_multiplication(ratio, m[i][k]);
	ldrsh	r3, [fp, #-38]	@ _70, k
	lsl	r3, r3, #3	@ tmp397, _70,
	add	r3, r2, r3	@ tmp398, _69, tmp397
	ldrd	r4, [r3]	@ _71, *_69
@ main.c:109:                     m[j][k] = m[j][k] - fixed_multiplication(ratio, m[i][k]);
	mov	r2, r6	@ _72, i
	mov	r3, r2	@ tmp399, _72
	lsl	r3, r3, #2	@ tmp399, tmp399,
	add	r3, r3, r2	@ tmp399, tmp399, _72
	lsl	r2, r3, #2	@ tmp400, tmp399,
	add	r3, r3, r2	@ tmp399, tmp399, tmp400
	lsl	r3, r3, #5	@ tmp401, tmp399,
	mov	r2, r3	@ _73, tmp399
	ldr	r3, [fp, #-96]	@ tmp402, m
	add	r2, r3, r2	@ _74, tmp402, _73
@ main.c:109:                     m[j][k] = m[j][k] - fixed_multiplication(ratio, m[i][k]);
	ldrsh	r3, [fp, #-38]	@ _75, k
	lsl	r3, r3, #3	@ tmp403, _75,
	add	r3, r2, r3	@ tmp404, _74, tmp403
	ldrd	r2, [r3]	@ _76, *_74
	ldrd	r0, [fp, #-76]	@,,
	bl	fixed_multiplication		@
@ main.c:109:                     m[j][k] = m[j][k] - fixed_multiplication(ratio, m[i][k]);
	mov	r3, r7	@ _78, j
	mov	r2, r3	@ tmp405, _78
	lsl	r2, r2, #2	@ tmp405, tmp405,
	add	r2, r2, r3	@ tmp405, tmp405, _78
	lsl	r3, r2, #2	@ tmp406, tmp405,
	add	r2, r2, r3	@ tmp405, tmp405, tmp406
	lsl	r3, r2, #5	@ tmp407, tmp405,
	mov	r2, r3	@ tmp405, tmp407
	ldr	r3, [fp, #-96]	@ tmp408, m
	add	r2, r3, r2	@ _80, tmp408, _79
@ main.c:109:                     m[j][k] = m[j][k] - fixed_multiplication(ratio, m[i][k]);
	ldrsh	r3, [fp, #-38]	@ _81, k
@ main.c:109:                     m[j][k] = m[j][k] - fixed_multiplication(ratio, m[i][k]);
	subs	r8, r4, r0	@ _82, _71, _77
	sbc	r9, r5, r1	@ _82, _71, _77
@ main.c:109:                     m[j][k] = m[j][k] - fixed_multiplication(ratio, m[i][k]);
	lsl	r3, r3, #3	@ tmp409, _81,
	add	r3, r2, r3	@ tmp410, _80, tmp409
	strd	r8, [r3]	@ _82, *_80
@ main.c:110:                     m[j][k + 1] = m[j][k + 1] - fixed_multiplication(ratio, m[i][k + 1]);
	mov	r2, r7	@ _83, j
	mov	r3, r2	@ tmp411, _83
	lsl	r3, r3, #2	@ tmp411, tmp411,
	add	r3, r3, r2	@ tmp411, tmp411, _83
	lsl	r2, r3, #2	@ tmp412, tmp411,
	add	r3, r3, r2	@ tmp411, tmp411, tmp412
	lsl	r3, r3, #5	@ tmp413, tmp411,
	mov	r2, r3	@ _84, tmp411
	ldr	r3, [fp, #-96]	@ tmp414, m
	add	r2, r3, r2	@ _85, tmp414, _84
@ main.c:110:                     m[j][k + 1] = m[j][k + 1] - fixed_multiplication(ratio, m[i][k + 1]);
	ldrsh	r3, [fp, #-38]	@ _86, k
	add	r3, r3, #1	@ _87, _86,
@ main.c:110:                     m[j][k + 1] = m[j][k + 1] - fixed_multiplication(ratio, m[i][k + 1]);
	lsl	r3, r3, #3	@ tmp415, _87,
	add	r3, r2, r3	@ tmp416, _85, tmp415
	ldrd	r4, [r3]	@ _88, *_85
@ main.c:110:                     m[j][k + 1] = m[j][k + 1] - fixed_multiplication(ratio, m[i][k + 1]);
	mov	r2, r6	@ _89, i
	mov	r3, r2	@ tmp417, _89
	lsl	r3, r3, #2	@ tmp417, tmp417,
	add	r3, r3, r2	@ tmp417, tmp417, _89
	lsl	r2, r3, #2	@ tmp418, tmp417,
	add	r3, r3, r2	@ tmp417, tmp417, tmp418
	lsl	r3, r3, #5	@ tmp419, tmp417,
	mov	r2, r3	@ _90, tmp417
	ldr	r3, [fp, #-96]	@ tmp420, m
	add	r2, r3, r2	@ _91, tmp420, _90
@ main.c:110:                     m[j][k + 1] = m[j][k + 1] - fixed_multiplication(ratio, m[i][k + 1]);
	ldrsh	r3, [fp, #-38]	@ _92, k
	add	r3, r3, #1	@ _93, _92,
@ main.c:110:                     m[j][k + 1] = m[j][k + 1] - fixed_multiplication(ratio, m[i][k + 1]);
	lsl	r3, r3, #3	@ tmp421, _93,
	add	r3, r2, r3	@ tmp422, _91, tmp421
	ldrd	r2, [r3]	@ _94, *_91
	ldrd	r0, [fp, #-76]	@,,
	bl	fixed_multiplication		@
@ main.c:110:                     m[j][k + 1] = m[j][k + 1] - fixed_multiplication(ratio, m[i][k + 1]);
	mov	r3, r7	@ _96, j
	mov	r2, r3	@ tmp423, _96
	lsl	r2, r2, #2	@ tmp423, tmp423,
	add	r2, r2, r3	@ tmp423, tmp423, _96
	lsl	r3, r2, #2	@ tmp424, tmp423,
	add	r2, r2, r3	@ tmp423, tmp423, tmp424
	lsl	r3, r2, #5	@ tmp425, tmp423,
	mov	r2, r3	@ tmp423, tmp425
	ldr	r3, [fp, #-96]	@ tmp426, m
	add	r2, r3, r2	@ _98, tmp426, _97
@ main.c:110:                     m[j][k + 1] = m[j][k + 1] - fixed_multiplication(ratio, m[i][k + 1]);
	ldrsh	r3, [fp, #-38]	@ _99, k
	add	r3, r3, #1	@ _100, _99,
@ main.c:110:                     m[j][k + 1] = m[j][k + 1] - fixed_multiplication(ratio, m[i][k + 1]);
	subs	ip, r4, r0	@ tmp540, _88, _95
	str	ip, [fp, #-108]	@ tmp540, %sfp
	sbc	r1, r5, r1	@ tmp541, _88, _95
	str	r1, [fp, #-104]	@ tmp541, %sfp
@ main.c:110:                     m[j][k + 1] = m[j][k + 1] - fixed_multiplication(ratio, m[i][k + 1]);
	lsl	r3, r3, #3	@ tmp427, _100,
	add	r3, r2, r3	@ tmp428, _98, tmp427
	ldrd	r0, [fp, #-108]	@ _101,,
	strd	r0, [r3]	@ _101, *_98
@ main.c:107:                 for (k ^= k; k < ORDER - 1; k += 2)
	ldrh	r3, [fp, #-38]	@ k.9_102, k
	add	r3, r3, #2	@ tmp429, k.9_102,
	uxth	r3, r3	@ _103, tmp429
	strh	r3, [fp, #-38]	@ movhi	@ _103, k
.L28:
@ main.c:107:                 for (k ^= k; k < ORDER - 1; k += 2)
	ldrsh	r3, [fp, #-38]	@ tmp430, k
	cmp	r3, #98	@ tmp430,
	ble	.L29		@,
@ main.c:112:                 for (k ^= k; k < ORDER - 1; k += 2)
	mov	r3, #0	@ tmp432,
	strh	r3, [fp, #-38]	@ movhi	@ tmp431, k
@ main.c:112:                 for (k ^= k; k < ORDER - 1; k += 2)
	b	.L30		@
.L31:
@ main.c:114:                     augmented[j][k] = augmented[j][k] - fixed_multiplication(ratio, augmented[i][k]);
	mov	r2, r7	@ _104, j
	mov	r3, r2	@ tmp433, _104
	lsl	r3, r3, #2	@ tmp433, tmp433,
	add	r3, r3, r2	@ tmp433, tmp433, _104
	lsl	r2, r3, #2	@ tmp434, tmp433,
	add	r3, r3, r2	@ tmp433, tmp433, tmp434
	lsl	r3, r3, #5	@ tmp435, tmp433,
	mov	r2, r3	@ _105, tmp433
	ldr	r3, [fp, #-100]	@ tmp436, augmented
	add	r2, r3, r2	@ _106, tmp436, _105
@ main.c:114:                     augmented[j][k] = augmented[j][k] - fixed_multiplication(ratio, augmented[i][k]);
	ldrsh	r3, [fp, #-38]	@ _107, k
	lsl	r3, r3, #3	@ tmp437, _107,
	add	r3, r2, r3	@ tmp438, _106, tmp437
	ldrd	r4, [r3]	@ _108, *_106
@ main.c:114:                     augmented[j][k] = augmented[j][k] - fixed_multiplication(ratio, augmented[i][k]);
	mov	r2, r6	@ _109, i
	mov	r3, r2	@ tmp439, _109
	lsl	r3, r3, #2	@ tmp439, tmp439,
	add	r3, r3, r2	@ tmp439, tmp439, _109
	lsl	r2, r3, #2	@ tmp440, tmp439,
	add	r3, r3, r2	@ tmp439, tmp439, tmp440
	lsl	r3, r3, #5	@ tmp441, tmp439,
	mov	r2, r3	@ _110, tmp439
	ldr	r3, [fp, #-100]	@ tmp442, augmented
	add	r2, r3, r2	@ _111, tmp442, _110
@ main.c:114:                     augmented[j][k] = augmented[j][k] - fixed_multiplication(ratio, augmented[i][k]);
	ldrsh	r3, [fp, #-38]	@ _112, k
	lsl	r3, r3, #3	@ tmp443, _112,
	add	r3, r2, r3	@ tmp444, _111, tmp443
	ldrd	r2, [r3]	@ _113, *_111
	ldrd	r0, [fp, #-76]	@,,
	bl	fixed_multiplication		@
@ main.c:114:                     augmented[j][k] = augmented[j][k] - fixed_multiplication(ratio, augmented[i][k]);
	mov	r3, r7	@ _115, j
	mov	r2, r3	@ tmp445, _115
	lsl	r2, r2, #2	@ tmp445, tmp445,
	add	r2, r2, r3	@ tmp445, tmp445, _115
	lsl	r3, r2, #2	@ tmp446, tmp445,
	add	r2, r2, r3	@ tmp445, tmp445, tmp446
	lsl	r3, r2, #5	@ tmp447, tmp445,
	mov	r2, r3	@ tmp445, tmp447
	ldr	r3, [fp, #-100]	@ tmp448, augmented
	add	r2, r3, r2	@ _117, tmp448, _116
@ main.c:114:                     augmented[j][k] = augmented[j][k] - fixed_multiplication(ratio, augmented[i][k]);
	ldrsh	r3, [fp, #-38]	@ _118, k
@ main.c:114:                     augmented[j][k] = augmented[j][k] - fixed_multiplication(ratio, augmented[i][k]);
	subs	ip, r4, r0	@ tmp543, _108, _114
	str	ip, [fp, #-116]	@ tmp543, %sfp
	sbc	r1, r5, r1	@ tmp544, _108, _114
	str	r1, [fp, #-112]	@ tmp544, %sfp
@ main.c:114:                     augmented[j][k] = augmented[j][k] - fixed_multiplication(ratio, augmented[i][k]);
	lsl	r3, r3, #3	@ tmp449, _118,
	add	r3, r2, r3	@ tmp450, _117, tmp449
	ldrd	r0, [fp, #-116]	@ _119,,
	strd	r0, [r3]	@ _119, *_117
@ main.c:115:                     augmented[j][k + 1] = augmented[j][k + 1] - fixed_multiplication(ratio, augmented[i][k + 1]);
	mov	r2, r7	@ _120, j
	mov	r3, r2	@ tmp451, _120
	lsl	r3, r3, #2	@ tmp451, tmp451,
	add	r3, r3, r2	@ tmp451, tmp451, _120
	lsl	r2, r3, #2	@ tmp452, tmp451,
	add	r3, r3, r2	@ tmp451, tmp451, tmp452
	lsl	r3, r3, #5	@ tmp453, tmp451,
	mov	r2, r3	@ _121, tmp451
	ldr	r3, [fp, #-100]	@ tmp454, augmented
	add	r2, r3, r2	@ _122, tmp454, _121
@ main.c:115:                     augmented[j][k + 1] = augmented[j][k + 1] - fixed_multiplication(ratio, augmented[i][k + 1]);
	ldrsh	r3, [fp, #-38]	@ _123, k
	add	r3, r3, #1	@ _124, _123,
@ main.c:115:                     augmented[j][k + 1] = augmented[j][k + 1] - fixed_multiplication(ratio, augmented[i][k + 1]);
	lsl	r3, r3, #3	@ tmp455, _124,
	add	r3, r2, r3	@ tmp456, _122, tmp455
	ldrd	r4, [r3]	@ _125, *_122
@ main.c:115:                     augmented[j][k + 1] = augmented[j][k + 1] - fixed_multiplication(ratio, augmented[i][k + 1]);
	mov	r2, r6	@ _126, i
	mov	r3, r2	@ tmp457, _126
	lsl	r3, r3, #2	@ tmp457, tmp457,
	add	r3, r3, r2	@ tmp457, tmp457, _126
	lsl	r2, r3, #2	@ tmp458, tmp457,
	add	r3, r3, r2	@ tmp457, tmp457, tmp458
	lsl	r3, r3, #5	@ tmp459, tmp457,
	mov	r2, r3	@ _127, tmp457
	ldr	r3, [fp, #-100]	@ tmp460, augmented
	add	r2, r3, r2	@ _128, tmp460, _127
@ main.c:115:                     augmented[j][k + 1] = augmented[j][k + 1] - fixed_multiplication(ratio, augmented[i][k + 1]);
	ldrsh	r3, [fp, #-38]	@ _129, k
	add	r3, r3, #1	@ _130, _129,
@ main.c:115:                     augmented[j][k + 1] = augmented[j][k + 1] - fixed_multiplication(ratio, augmented[i][k + 1]);
	lsl	r3, r3, #3	@ tmp461, _130,
	add	r3, r2, r3	@ tmp462, _128, tmp461
	ldrd	r2, [r3]	@ _131, *_128
	ldrd	r0, [fp, #-76]	@,,
	bl	fixed_multiplication		@
@ main.c:115:                     augmented[j][k + 1] = augmented[j][k + 1] - fixed_multiplication(ratio, augmented[i][k + 1]);
	mov	r3, r7	@ _133, j
	mov	r2, r3	@ tmp463, _133
	lsl	r2, r2, #2	@ tmp463, tmp463,
	add	r2, r2, r3	@ tmp463, tmp463, _133
	lsl	r3, r2, #2	@ tmp464, tmp463,
	add	r2, r2, r3	@ tmp463, tmp463, tmp464
	lsl	r3, r2, #5	@ tmp465, tmp463,
	mov	r2, r3	@ tmp463, tmp465
	ldr	r3, [fp, #-100]	@ tmp466, augmented
	add	r2, r3, r2	@ _135, tmp466, _134
@ main.c:115:                     augmented[j][k + 1] = augmented[j][k + 1] - fixed_multiplication(ratio, augmented[i][k + 1]);
	ldrsh	r3, [fp, #-38]	@ _136, k
	add	r3, r3, #1	@ _137, _136,
@ main.c:115:                     augmented[j][k + 1] = augmented[j][k + 1] - fixed_multiplication(ratio, augmented[i][k + 1]);
	subs	ip, r4, r0	@ tmp546, _125, _132
	str	ip, [fp, #-124]	@ tmp546, %sfp
	sbc	r1, r5, r1	@ tmp547, _125, _132
	str	r1, [fp, #-120]	@ tmp547, %sfp
@ main.c:115:                     augmented[j][k + 1] = augmented[j][k + 1] - fixed_multiplication(ratio, augmented[i][k + 1]);
	lsl	r3, r3, #3	@ tmp467, _137,
	add	r3, r2, r3	@ tmp468, _135, tmp467
	ldrd	r0, [fp, #-124]	@ _138,,
	strd	r0, [r3]	@ _138, *_135
@ main.c:112:                 for (k ^= k; k < ORDER - 1; k += 2)
	ldrh	r3, [fp, #-38]	@ k.10_139, k
	add	r3, r3, #2	@ tmp469, k.10_139,
	uxth	r3, r3	@ _140, tmp469
	strh	r3, [fp, #-38]	@ movhi	@ _140, k
.L30:
@ main.c:112:                 for (k ^= k; k < ORDER - 1; k += 2)
	ldrsh	r3, [fp, #-38]	@ tmp470, k
	cmp	r3, #98	@ tmp470,
	ble	.L31		@,
.L27:
@ main.c:102:         for (j ^= j; j < ORDER; ++j)
	uxth	r3, r7	@ j.11_141, j
	add	r3, r3, #1	@ tmp471, j.11_141,
	uxth	r3, r3	@ _142, tmp471
	sxth	r7, r3	@ j, _142
.L26:
@ main.c:102:         for (j ^= j; j < ORDER; ++j)
	cmp	r7, #99	@ j,
	ble	.L32		@,
@ main.c:69:     for (i ^= i; i < ORDER; ++i)
	uxth	r3, r6	@ i.12_143, i
	add	r3, r3, #1	@ tmp472, i.12_143,
	uxth	r3, r3	@ _144, tmp472
	sxth	r6, r3	@ i, _144
.L20:
@ main.c:69:     for (i ^= i; i < ORDER; ++i)
	cmp	r6, #99	@ i,
	ble	.L33		@,
@ main.c:122:     for (i ^= i; i < ORDER - 1; i += 2)
	mov	r6, #0	@ i,
@ main.c:122:     for (i ^= i; i < ORDER - 1; i += 2)
	b	.L34		@
.L37:
@ main.c:124:         long long m_temp = m[i][i], m2_temp = m[i + 1][i + 1];
	mov	r2, r6	@ _145, i
	mov	r3, r2	@ tmp473, _145
	lsl	r3, r3, #2	@ tmp473, tmp473,
	add	r3, r3, r2	@ tmp473, tmp473, _145
	lsl	r2, r3, #2	@ tmp474, tmp473,
	add	r3, r3, r2	@ tmp473, tmp473, tmp474
	lsl	r3, r3, #5	@ tmp475, tmp473,
	mov	r2, r3	@ _146, tmp473
	ldr	r3, [fp, #-96]	@ tmp476, m
	add	r2, r3, r2	@ _147, tmp476, _146
@ main.c:124:         long long m_temp = m[i][i], m2_temp = m[i + 1][i + 1];
	mov	r3, r6	@ _148, i
@ main.c:124:         long long m_temp = m[i][i], m2_temp = m[i + 1][i + 1];
	lsl	r3, r3, #3	@ tmp477, _148,
	add	r3, r2, r3	@ tmp478, _147, tmp477
	ldrd	r2, [r3]	@ tmp479, *_147
	strd	r2, [fp, #-84]	@ tmp479,,
@ main.c:124:         long long m_temp = m[i][i], m2_temp = m[i + 1][i + 1];
	mov	r3, r6	@ _149, i
	add	r2, r3, #1	@ _150, _149,
	mov	r3, r2	@ tmp480, _150
	lsl	r3, r3, #2	@ tmp480, tmp480,
	add	r3, r3, r2	@ tmp480, tmp480, _150
	lsl	r2, r3, #2	@ tmp481, tmp480,
	add	r3, r3, r2	@ tmp480, tmp480, tmp481
	lsl	r3, r3, #5	@ tmp482, tmp480,
	mov	r2, r3	@ _151, tmp480
	ldr	r3, [fp, #-96]	@ tmp483, m
	add	r2, r3, r2	@ _152, tmp483, _151
@ main.c:124:         long long m_temp = m[i][i], m2_temp = m[i + 1][i + 1];
	mov	r3, r6	@ _153, i
	add	r3, r3, #1	@ _154, _153,
@ main.c:124:         long long m_temp = m[i][i], m2_temp = m[i + 1][i + 1];
	lsl	r3, r3, #3	@ tmp484, _154,
	add	r3, r2, r3	@ tmp485, _152, tmp484
	ldrd	r2, [r3]	@ tmp486, *_152
	strd	r2, [fp, #-92]	@ tmp486,,
@ main.c:125:         long long a_temp = augmented[i][0], a2_temp = augmented[i + 1][0];
	mov	r2, r6	@ _155, i
	mov	r3, r2	@ tmp487, _155
	lsl	r3, r3, #2	@ tmp487, tmp487,
	add	r3, r3, r2	@ tmp487, tmp487, _155
	lsl	r2, r3, #2	@ tmp488, tmp487,
	add	r3, r3, r2	@ tmp487, tmp487, tmp488
	lsl	r3, r3, #5	@ tmp489, tmp487,
	mov	r2, r3	@ _156, tmp487
	ldr	r3, [fp, #-100]	@ tmp490, augmented
	add	r3, r3, r2	@ _157, tmp490, _156
@ main.c:125:         long long a_temp = augmented[i][0], a2_temp = augmented[i + 1][0];
	ldrd	r2, [r3]	@ tmp491, *_157
	strd	r2, [fp, #-52]	@ tmp491,,
@ main.c:125:         long long a_temp = augmented[i][0], a2_temp = augmented[i + 1][0];
	mov	r3, r6	@ _158, i
	add	r2, r3, #1	@ _159, _158,
	mov	r3, r2	@ tmp492, _159
	lsl	r3, r3, #2	@ tmp492, tmp492,
	add	r3, r3, r2	@ tmp492, tmp492, _159
	lsl	r2, r3, #2	@ tmp493, tmp492,
	add	r3, r3, r2	@ tmp492, tmp492, tmp493
	lsl	r3, r3, #5	@ tmp494, tmp492,
	mov	r2, r3	@ _160, tmp492
	ldr	r3, [fp, #-100]	@ tmp495, augmented
	add	r3, r3, r2	@ _161, tmp495, _160
@ main.c:125:         long long a_temp = augmented[i][0], a2_temp = augmented[i + 1][0];
	ldrd	r2, [r3]	@ tmp496, *_161
	strd	r2, [fp, #-60]	@ tmp496,,
@ main.c:126:         for (j ^= j; j < ORDER - 1; ++j)
	mov	r7, #0	@ j,
@ main.c:126:         for (j ^= j; j < ORDER - 1; ++j)
	b	.L35		@
.L36:
@ main.c:128:             augmented[i][j] = fixed_division(a_temp, m_temp);
	mov	r2, r6	@ _162, i
	mov	r3, r2	@ tmp497, _162
	lsl	r3, r3, #2	@ tmp497, tmp497,
	add	r3, r3, r2	@ tmp497, tmp497, _162
	lsl	r2, r3, #2	@ tmp498, tmp497,
	add	r3, r3, r2	@ tmp497, tmp497, tmp498
	lsl	r3, r3, #5	@ tmp499, tmp497,
	mov	r2, r3	@ _163, tmp497
	ldr	r3, [fp, #-100]	@ tmp500, augmented
	add	r4, r3, r2	@ _164, tmp500, _163
@ main.c:128:             augmented[i][j] = fixed_division(a_temp, m_temp);
	mov	r5, r7	@ _165, j
@ main.c:128:             augmented[i][j] = fixed_division(a_temp, m_temp);
	ldrd	r2, [fp, #-84]	@,,
	ldrd	r0, [fp, #-52]	@,,
	bl	fixed_division		@
	mov	r2, r0	@ _166,
	mov	r3, r1	@ _166,
@ main.c:128:             augmented[i][j] = fixed_division(a_temp, m_temp);
	lsl	r1, r5, #3	@ tmp501, _165,
	add	r1, r4, r1	@ tmp502, _164, tmp501
	strd	r2, [r1]	@ _166, *_164
@ main.c:129:             augmented[i + 1][j] = fixed_division(a2_temp, m2_temp);
	mov	r3, r6	@ _167, i
	add	r2, r3, #1	@ _168, _167,
	mov	r3, r2	@ tmp503, _168
	lsl	r3, r3, #2	@ tmp503, tmp503,
	add	r3, r3, r2	@ tmp503, tmp503, _168
	lsl	r2, r3, #2	@ tmp504, tmp503,
	add	r3, r3, r2	@ tmp503, tmp503, tmp504
	lsl	r3, r3, #5	@ tmp505, tmp503,
	mov	r2, r3	@ _169, tmp503
	ldr	r3, [fp, #-100]	@ tmp506, augmented
	add	r4, r3, r2	@ _170, tmp506, _169
@ main.c:129:             augmented[i + 1][j] = fixed_division(a2_temp, m2_temp);
	mov	r5, r7	@ _171, j
@ main.c:129:             augmented[i + 1][j] = fixed_division(a2_temp, m2_temp);
	ldrd	r2, [fp, #-92]	@,,
	ldrd	r0, [fp, #-60]	@,,
	bl	fixed_division		@
	mov	r2, r0	@ _172,
	mov	r3, r1	@ _172,
@ main.c:129:             augmented[i + 1][j] = fixed_division(a2_temp, m2_temp);
	lsl	r1, r5, #3	@ tmp507, _171,
	add	r1, r4, r1	@ tmp508, _170, tmp507
	strd	r2, [r1]	@ _172, *_170
@ main.c:130:             a_temp = augmented[i][j + 1];
	mov	r2, r6	@ _173, i
	mov	r3, r2	@ tmp509, _173
	lsl	r3, r3, #2	@ tmp509, tmp509,
	add	r3, r3, r2	@ tmp509, tmp509, _173
	lsl	r2, r3, #2	@ tmp510, tmp509,
	add	r3, r3, r2	@ tmp509, tmp509, tmp510
	lsl	r3, r3, #5	@ tmp511, tmp509,
	mov	r2, r3	@ _174, tmp509
	ldr	r3, [fp, #-100]	@ tmp512, augmented
	add	r2, r3, r2	@ _175, tmp512, _174
@ main.c:130:             a_temp = augmented[i][j + 1];
	mov	r3, r7	@ _176, j
	add	r3, r3, #1	@ _177, _176,
@ main.c:130:             a_temp = augmented[i][j + 1];
	lsl	r3, r3, #3	@ tmp513, _177,
	add	r3, r2, r3	@ tmp514, _175, tmp513
	ldrd	r2, [r3]	@ tmp515, *_175
	strd	r2, [fp, #-52]	@ tmp515,,
@ main.c:131:             a2_temp = augmented[i + 1][j + 1];
	mov	r3, r6	@ _178, i
	add	r2, r3, #1	@ _179, _178,
	mov	r3, r2	@ tmp516, _179
	lsl	r3, r3, #2	@ tmp516, tmp516,
	add	r3, r3, r2	@ tmp516, tmp516, _179
	lsl	r2, r3, #2	@ tmp517, tmp516,
	add	r3, r3, r2	@ tmp516, tmp516, tmp517
	lsl	r3, r3, #5	@ tmp518, tmp516,
	mov	r2, r3	@ _180, tmp516
	ldr	r3, [fp, #-100]	@ tmp519, augmented
	add	r2, r3, r2	@ _181, tmp519, _180
@ main.c:131:             a2_temp = augmented[i + 1][j + 1];
	mov	r3, r7	@ _182, j
	add	r3, r3, #1	@ _183, _182,
@ main.c:131:             a2_temp = augmented[i + 1][j + 1];
	lsl	r3, r3, #3	@ tmp520, _183,
	add	r3, r2, r3	@ tmp521, _181, tmp520
	ldrd	r2, [r3]	@ tmp522, *_181
	strd	r2, [fp, #-60]	@ tmp522,,
@ main.c:126:         for (j ^= j; j < ORDER - 1; ++j)
	uxth	r3, r7	@ j.13_184, j
	add	r3, r3, #1	@ tmp523, j.13_184,
	uxth	r3, r3	@ _185, tmp523
	sxth	r7, r3	@ j, _185
.L35:
@ main.c:126:         for (j ^= j; j < ORDER - 1; ++j)
	cmp	r7, #98	@ j,
	ble	.L36		@,
@ main.c:133:         augmented[i][ORDER - 1] = fixed_division(a_temp, m_temp);
	mov	r2, r6	@ _186, i
	mov	r3, r2	@ tmp524, _186
	lsl	r3, r3, #2	@ tmp524, tmp524,
	add	r3, r3, r2	@ tmp524, tmp524, _186
	lsl	r2, r3, #2	@ tmp525, tmp524,
	add	r3, r3, r2	@ tmp524, tmp524, tmp525
	lsl	r3, r3, #5	@ tmp526, tmp524,
	mov	r2, r3	@ _187, tmp524
	ldr	r3, [fp, #-100]	@ tmp527, augmented
	add	r4, r3, r2	@ _188, tmp527, _187
@ main.c:133:         augmented[i][ORDER - 1] = fixed_division(a_temp, m_temp);
	ldrd	r2, [fp, #-84]	@,,
	ldrd	r0, [fp, #-52]	@,,
	bl	fixed_division		@
	mov	r2, r0	@ _189,
	mov	r3, r1	@ _189,
@ main.c:133:         augmented[i][ORDER - 1] = fixed_division(a_temp, m_temp);
	add	r1, r4, #800	@ tmp529, _188,
	strd	r2, [r1, #-8]	@ _189, tmp528,
@ main.c:134:         augmented[i + 1][ORDER - 1] = fixed_division(a2_temp, m2_temp);
	mov	r3, r6	@ _190, i
	add	r2, r3, #1	@ _191, _190,
	mov	r3, r2	@ tmp530, _191
	lsl	r3, r3, #2	@ tmp530, tmp530,
	add	r3, r3, r2	@ tmp530, tmp530, _191
	lsl	r2, r3, #2	@ tmp531, tmp530,
	add	r3, r3, r2	@ tmp530, tmp530, tmp531
	lsl	r3, r3, #5	@ tmp532, tmp530,
	mov	r2, r3	@ _192, tmp530
	ldr	r3, [fp, #-100]	@ tmp533, augmented
	add	r4, r3, r2	@ _193, tmp533, _192
@ main.c:134:         augmented[i + 1][ORDER - 1] = fixed_division(a2_temp, m2_temp);
	ldrd	r2, [fp, #-92]	@,,
	ldrd	r0, [fp, #-60]	@,,
	bl	fixed_division		@
	mov	r2, r0	@ _194,
	mov	r3, r1	@ _194,
@ main.c:134:         augmented[i + 1][ORDER - 1] = fixed_division(a2_temp, m2_temp);
	add	r1, r4, #800	@ tmp535, _193,
	strd	r2, [r1, #-8]	@ _194, tmp534,
@ main.c:122:     for (i ^= i; i < ORDER - 1; i += 2)
	uxth	r3, r6	@ i.14_195, i
	add	r3, r3, #2	@ tmp536, i.14_195,
	uxth	r3, r3	@ _196, tmp536
	sxth	r6, r3	@ i, _196
.L34:
@ main.c:122:     for (i ^= i; i < ORDER - 1; i += 2)
	cmp	r6, #98	@ i,
	ble	.L37		@,
@ main.c:136: }
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
@ main.c:140:     if (argc != 2)
	sub	r3, fp, #159744	@ tmp127,,
	sub	r3, r3, #4	@ tmp127, tmp127,
	ldr	r3, [r3, #-300]	@ tmp128, argc
	cmp	r3, #2	@ tmp128,
	beq	.L39		@,
@ main.c:142:         printf("Usage: ./<executable> <matrix input file>\n");
	movw	r0, #:lower16:.LC3	@,
	movt	r0, #:upper16:.LC3	@,
	bl	puts		@
@ main.c:143:         exit(1);
	mov	r0, #1	@,
	bl	exit		@
.L39:
@ main.c:146:     clock_t start = clock();
	bl	clock		@
	str	r0, [fp, #-16]	@, start
@ main.c:150:     long long augmented[ORDER][ORDER] = {0};
	sub	r3, fp, #159744	@ tmp130,,
	sub	r3, r3, #4	@ tmp130, tmp130,
	sub	r0, r3, #296	@ tmp131, tmp129,
	mov	r3, #14464	@ tmp132,
	movt	r3, 1	@ tmp132,
	mov	r2, r3	@, tmp132
	mov	r1, #0	@,
	bl	memset		@
@ main.c:155:     if ((f = fopen(argv[1], "r")) == NULL)
	sub	r3, fp, #159744	@ tmp135,,
	sub	r3, r3, #4	@ tmp135, tmp135,
	ldr	r3, [r3, #-304]	@ tmp136, argv
	add	r3, r3, #4	@ _1, tmp136,
@ main.c:155:     if ((f = fopen(argv[1], "r")) == NULL)
	ldr	r3, [r3]	@ _2, *_1
	movw	r1, #:lower16:.LC4	@,
	movt	r1, #:upper16:.LC4	@,
	mov	r0, r3	@, _2
	bl	fopen		@
	str	r0, [fp, #-20]	@, f
@ main.c:155:     if ((f = fopen(argv[1], "r")) == NULL)
	ldr	r3, [fp, #-20]	@ tmp137, f
	cmp	r3, #0	@ tmp137,
	bne	.L40		@,
@ main.c:157:         printf("Bad file name.\n");
	movw	r0, #:lower16:.LC5	@,
	movt	r0, #:upper16:.LC5	@,
	bl	puts		@
@ main.c:158:         exit(1);
	mov	r0, #1	@,
	bl	exit		@
.L40:
@ main.c:161:     for (jj = 0; jj < ORDER; jj++)
	mov	r3, #0	@ tmp138,
	str	r3, [fp, #-12]	@ tmp138, jj
@ main.c:161:     for (jj = 0; jj < ORDER; jj++)
	b	.L41		@
.L45:
@ main.c:162:         for (ii = 0; ii < ORDER; ii++)
	mov	r3, #0	@ tmp139,
	str	r3, [fp, #-8]	@ tmp139, ii
@ main.c:162:         for (ii = 0; ii < ORDER; ii++)
	b	.L42		@
.L44:
@ main.c:163:             if (fscanf(f, "%lli", &m[jj][ii]) != 1)
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
@ main.c:163:             if (fscanf(f, "%lli", &m[jj][ii]) != 1)
	cmp	r3, #1	@ _4,
	beq	.L43		@,
@ main.c:165:                 printf("Check file or ORDER constant.\n");
	movw	r0, #:lower16:.LC7	@,
	movt	r0, #:upper16:.LC7	@,
	bl	puts		@
@ main.c:166:                 exit(1);
	mov	r0, #1	@,
	bl	exit		@
.L43:
@ main.c:162:         for (ii = 0; ii < ORDER; ii++)
	ldr	r3, [fp, #-8]	@ tmp149, ii
	add	r3, r3, #1	@ tmp148, tmp149,
	str	r3, [fp, #-8]	@ tmp148, ii
.L42:
@ main.c:162:         for (ii = 0; ii < ORDER; ii++)
	ldr	r3, [fp, #-8]	@ tmp150, ii
	cmp	r3, #99	@ tmp150,
	ble	.L44		@,
@ main.c:161:     for (jj = 0; jj < ORDER; jj++)
	ldr	r3, [fp, #-12]	@ tmp152, jj
	add	r3, r3, #1	@ tmp151, tmp152,
	str	r3, [fp, #-12]	@ tmp151, jj
.L41:
@ main.c:161:     for (jj = 0; jj < ORDER; jj++)
	ldr	r3, [fp, #-12]	@ tmp153, jj
	cmp	r3, #99	@ tmp153,
	ble	.L45		@,
@ main.c:169:     fclose(f);
	ldr	r0, [fp, #-20]	@, f
	bl	fclose		@
@ main.c:171:     gaussJordan(m, augmented);
	sub	r2, fp, #159744	@ tmp154,,
	sub	r2, r2, #4	@ tmp154, tmp154,
	sub	r2, r2, #296	@ tmp154, tmp154,
	sub	r3, fp, #79872	@ tmp155,,
	sub	r3, r3, #4	@ tmp155, tmp155,
	sub	r3, r3, #168	@ tmp155, tmp155,
	mov	r1, r2	@, tmp154
	mov	r0, r3	@, tmp155
	bl	gaussJordan		@
@ main.c:173:     clock_t alg_end = clock();
	bl	clock		@
	str	r0, [fp, #-24]	@, alg_end
@ main.c:175:     printMatrix(augmented);
	sub	r3, fp, #159744	@ tmp156,,
	sub	r3, r3, #4	@ tmp156, tmp156,
	sub	r3, r3, #296	@ tmp156, tmp156,
	mov	r0, r3	@, tmp156
	bl	printMatrix		@
@ main.c:177:     clock_t end = clock();
	bl	clock		@
	str	r0, [fp, #-28]	@, end
@ main.c:178:     double alg_time = ((double)(alg_end - start)) * 1000 / CLOCKS_PER_SEC;
	ldr	r2, [fp, #-24]	@ tmp157, alg_end
	ldr	r3, [fp, #-16]	@ tmp158, start
	sub	r3, r2, r3	@ _5, tmp157, tmp158
@ main.c:178:     double alg_time = ((double)(alg_end - start)) * 1000 / CLOCKS_PER_SEC;
	vmov	s15, r3	@ int	@ _5, _5
	vcvt.f64.s32	d7, s15	@ _6, _5
@ main.c:178:     double alg_time = ((double)(alg_end - start)) * 1000 / CLOCKS_PER_SEC;
	vldr.64	d6, .L47	@ tmp159,
	vmul.f64	d6, d7, d6	@ _7, _6, tmp159
@ main.c:178:     double alg_time = ((double)(alg_end - start)) * 1000 / CLOCKS_PER_SEC;
	vldr.64	d5, .L47+8	@ tmp161,
	vdiv.f64	d7, d6, d5	@ tmp160, _7, tmp161
	vstr.64	d7, [fp, #-36]	@ tmp160, alg_time
@ main.c:179:     double total_time = ((double)(end - start)) * 1000 / CLOCKS_PER_SEC;
	ldr	r2, [fp, #-28]	@ tmp162, end
	ldr	r3, [fp, #-16]	@ tmp163, start
	sub	r3, r2, r3	@ _8, tmp162, tmp163
@ main.c:179:     double total_time = ((double)(end - start)) * 1000 / CLOCKS_PER_SEC;
	vmov	s15, r3	@ int	@ _8, _8
	vcvt.f64.s32	d7, s15	@ _9, _8
@ main.c:179:     double total_time = ((double)(end - start)) * 1000 / CLOCKS_PER_SEC;
	vldr.64	d6, .L47	@ tmp164,
	vmul.f64	d6, d7, d6	@ _10, _9, tmp164
@ main.c:179:     double total_time = ((double)(end - start)) * 1000 / CLOCKS_PER_SEC;
	vldr.64	d5, .L47+8	@ tmp166,
	vdiv.f64	d7, d6, d5	@ tmp165, _10, tmp166
	vstr.64	d7, [fp, #-44]	@ tmp165, total_time
@ main.c:180:     printf("Time to run algorithm: %fms\nTime to run full program: %fms\n", alg_time, total_time);
	ldrd	r2, [fp, #-44]	@ tmp167,,
	strd	r2, [sp]	@ tmp167,
	ldrd	r2, [fp, #-36]	@,,
	movw	r0, #:lower16:.LC8	@,
	movt	r0, #:upper16:.LC8	@,
	bl	printf		@
@ main.c:182:     return (0);
	mov	r3, #0	@ _44,
@ main.c:183: };
	mov	r0, r3	@, <retval>
	sub	sp, fp, #4	@,,
	@ sp needed	@
	pop	{fp, pc}	@
.L48:
	.align	3
.L47:
	.word	0
	.word	1083129856
	.word	0
	.word	1093567616
	.size	main, .-main
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
