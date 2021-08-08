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
@ -march=armv7-a+fp -O0 -fverbose-asm
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
	push	{r4, r5, fp, lr}	@
	add	fp, sp, #12	@,,
	sub	sp, sp, #8	@,,
	str	r0, [fp, #-16]	@ augmented, augmented
@ main.c:13:     printf("\nInverse Matrix is:\n");
	movw	r0, #:lower16:.LC0	@,
	movt	r0, #:upper16:.LC0	@,
	bl	puts		@
@ main.c:15:     for (i = 0; i < ORDER; ++i)
	mov	r4, #0	@ i,
@ main.c:15:     for (i = 0; i < ORDER; ++i)
	b	.L2		@
.L5:
@ main.c:17:         for (j = 0; j < ORDER; ++j)
	mov	r5, #0	@ j,
@ main.c:17:         for (j = 0; j < ORDER; ++j)
	b	.L3		@
.L4:
@ main.c:19:             printf("%i\t", (short int)augmented[i][j]);
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
@ main.c:19:             printf("%i\t", (short int)augmented[i][j]);
	mov	r3, r5	@ _4, j
	lsl	r3, r3, #3	@ tmp127, _4,
	add	r3, r2, r3	@ tmp128, _3, tmp127
	ldrd	r2, [r3]	@ _5, *_3
@ main.c:19:             printf("%i\t", (short int)augmented[i][j]);
	sxth	r3, r2	@ _6, _5
@ main.c:19:             printf("%i\t", (short int)augmented[i][j]);
	mov	r1, r3	@, _7
	movw	r0, #:lower16:.LC1	@,
	movt	r0, #:upper16:.LC1	@,
	bl	printf		@
@ main.c:17:         for (j = 0; j < ORDER; ++j)
	uxth	r3, r5	@ j.0_8, j
	add	r3, r3, #1	@ tmp129, j.0_8,
	uxth	r3, r3	@ _9, tmp129
	sxth	r5, r3	@ j, _9
.L3:
@ main.c:17:         for (j = 0; j < ORDER; ++j)
	cmp	r5, #99	@ j,
	ble	.L4		@,
@ main.c:21:         printf("\n");
	mov	r0, #10	@,
	bl	putchar		@
@ main.c:15:     for (i = 0; i < ORDER; ++i)
	uxth	r3, r4	@ i.1_10, i
	add	r3, r3, #1	@ tmp130, i.1_10,
	uxth	r3, r3	@ _11, tmp130
	sxth	r4, r3	@ i, _11
.L2:
@ main.c:15:     for (i = 0; i < ORDER; ++i)
	cmp	r4, #99	@ i,
	ble	.L5		@,
@ main.c:23: }
	nop	
	sub	sp, fp, #12	@,,
	@ sp needed	@
	pop	{r4, r5, fp, pc}	@
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
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}	@
	add	fp, sp, #32	@,,
	sub	sp, sp, #164	@,,
	str	r0, [fp, #-80]	@ m, m
	str	r1, [fp, #-84]	@ augmented, augmented
@ main.c:29:     for (i = 0; i < ORDER; ++i)
	mov	r10, #0	@ i,
@ main.c:29:     for (i = 0; i < ORDER; ++i)
	b	.L7		@
.L10:
@ main.c:31:         for (j = 0; j < ORDER; ++j)
	mov	r9, #0	@ j,
@ main.c:31:         for (j = 0; j < ORDER; ++j)
	b	.L8		@
.L9:
@ main.c:33:             m[i][j] = m[i][j] << SHIFT_AMOUNT;
	mov	r3, r10	@ _1, i
	mov	r2, r3	@ tmp290, _1
	lsl	r2, r2, #2	@ tmp290, tmp290,
	add	r2, r2, r3	@ tmp290, tmp290, _1
	lsl	r3, r2, #2	@ tmp291, tmp290,
	add	r2, r2, r3	@ tmp290, tmp290, tmp291
	lsl	r3, r2, #5	@ tmp292, tmp290,
	mov	r2, r3	@ tmp290, tmp292
	ldr	r3, [fp, #-80]	@ tmp293, m
	add	r2, r3, r2	@ _3, tmp293, _2
@ main.c:33:             m[i][j] = m[i][j] << SHIFT_AMOUNT;
	mov	r3, r9	@ _4, j
	lsl	r3, r3, #3	@ tmp294, _4,
	add	r3, r2, r3	@ tmp295, _3, tmp294
	ldrd	r4, [r3]	@ _5, *_3
@ main.c:33:             m[i][j] = m[i][j] << SHIFT_AMOUNT;
	mov	r3, r10	@ _6, i
	mov	r2, r3	@ tmp296, _6
	lsl	r2, r2, #2	@ tmp296, tmp296,
	add	r2, r2, r3	@ tmp296, tmp296, _6
	lsl	r3, r2, #2	@ tmp297, tmp296,
	add	r2, r2, r3	@ tmp296, tmp296, tmp297
	lsl	r3, r2, #5	@ tmp298, tmp296,
	mov	r2, r3	@ tmp296, tmp298
	ldr	r3, [fp, #-80]	@ tmp299, m
	add	r2, r3, r2	@ _8, tmp299, _7
@ main.c:33:             m[i][j] = m[i][j] << SHIFT_AMOUNT;
	mov	r3, r9	@ _9, j
@ main.c:33:             m[i][j] = m[i][j] << SHIFT_AMOUNT;
	mov	r0, #0	@ _10,
	mov	r1, #0	@ _10,
	lsl	r1, r5, #16	@ _10, _5,
	orr	r1, r1, r4, lsr #16	@ _10, _10, _5,
	lsl	r0, r4, #16	@ _10, _5,
@ main.c:33:             m[i][j] = m[i][j] << SHIFT_AMOUNT;
	lsl	r3, r3, #3	@ tmp302, _9,
	add	r3, r2, r3	@ tmp303, _8, tmp302
	strd	r0, [r3]	@ _10, *_8
@ main.c:31:         for (j = 0; j < ORDER; ++j)
	uxth	r3, r9	@ j.2_11, j
	add	r3, r3, #1	@ tmp304, j.2_11,
	uxth	r3, r3	@ _12, tmp304
	sxth	r9, r3	@ j, _12
.L8:
@ main.c:31:         for (j = 0; j < ORDER; ++j)
	cmp	r9, #99	@ j,
	ble	.L9		@,
@ main.c:35:         augmented[i][i] = 1 << SHIFT_AMOUNT;
	mov	r3, r10	@ _13, i
	mov	r2, r3	@ tmp305, _13
	lsl	r2, r2, #2	@ tmp305, tmp305,
	add	r2, r2, r3	@ tmp305, tmp305, _13
	lsl	r3, r2, #2	@ tmp306, tmp305,
	add	r2, r2, r3	@ tmp305, tmp305, tmp306
	lsl	r3, r2, #5	@ tmp307, tmp305,
	mov	r2, r3	@ tmp305, tmp307
	ldr	r3, [fp, #-84]	@ tmp308, augmented
	add	r2, r3, r2	@ _15, tmp308, _14
@ main.c:35:         augmented[i][i] = 1 << SHIFT_AMOUNT;
	mov	r3, r10	@ _16, i
@ main.c:35:         augmented[i][i] = 1 << SHIFT_AMOUNT;
	lsl	r3, r3, #3	@ tmp309, _16,
	add	r1, r2, r3	@ tmp310, _15, tmp309
	mov	r2, #65536	@ tmp311,
	mov	r3, #0	@,
	strd	r2, [r1]	@ tmp311, *_15
@ main.c:29:     for (i = 0; i < ORDER; ++i)
	uxth	r3, r10	@ i.3_17, i
	add	r3, r3, #1	@ tmp312, i.3_17,
	uxth	r3, r3	@ _18, tmp312
	sxth	r10, r3	@ i, _18
.L7:
@ main.c:29:     for (i = 0; i < ORDER; ++i)
	cmp	r10, #99	@ i,
	ble	.L10		@,
@ main.c:40:     for (i = 0; i < ORDER; ++i)
	mov	r10, #0	@ i,
@ main.c:40:     for (i = 0; i < ORDER; ++i)
	b	.L11		@
.L26:
@ main.c:44:         long long largest = m[i][i], mag;
	mov	r3, r10	@ _19, i
	mov	r2, r3	@ tmp313, _19
	lsl	r2, r2, #2	@ tmp313, tmp313,
	add	r2, r2, r3	@ tmp313, tmp313, _19
	lsl	r3, r2, #2	@ tmp314, tmp313,
	add	r2, r2, r3	@ tmp313, tmp313, tmp314
	lsl	r3, r2, #5	@ tmp315, tmp313,
	mov	r2, r3	@ tmp313, tmp315
	ldr	r3, [fp, #-80]	@ tmp316, m
	add	r2, r3, r2	@ _21, tmp316, _20
@ main.c:44:         long long largest = m[i][i], mag;
	mov	r3, r10	@ _22, i
@ main.c:44:         long long largest = m[i][i], mag;
	lsl	r3, r3, #3	@ tmp317, _22,
	add	r3, r2, r3	@ tmp318, _21, tmp317
	ldrd	r2, [r3]	@ tmp319, *_21
	strd	r2, [fp, #-44]	@ tmp319,,
@ main.c:45:         j = i;
	mov	r9, r10	@ j, i
@ main.c:47:         for (k = i + 1; k < ORDER; ++k)
	uxth	r3, r10	@ i.4_23, i
	add	r3, r3, #1	@ tmp320, i.4_23,
	uxth	r3, r3	@ _24, tmp320
@ main.c:47:         for (k = i + 1; k < ORDER; ++k)
	sxth	r8, r3	@ k, _24
@ main.c:47:         for (k = i + 1; k < ORDER; ++k)
	b	.L12		@
.L14:
@ main.c:49:             mag = m[k][i];
	mov	r3, r8	@ _25, k
	mov	r2, r3	@ tmp321, _25
	lsl	r2, r2, #2	@ tmp321, tmp321,
	add	r2, r2, r3	@ tmp321, tmp321, _25
	lsl	r3, r2, #2	@ tmp322, tmp321,
	add	r2, r2, r3	@ tmp321, tmp321, tmp322
	lsl	r3, r2, #5	@ tmp323, tmp321,
	mov	r2, r3	@ tmp321, tmp323
	ldr	r3, [fp, #-80]	@ tmp324, m
	add	r2, r3, r2	@ _27, tmp324, _26
@ main.c:49:             mag = m[k][i];
	mov	r3, r10	@ _28, i
@ main.c:49:             mag = m[k][i];
	lsl	r3, r3, #3	@ tmp325, _28,
	add	r3, r2, r3	@ tmp326, _27, tmp325
	ldrd	r2, [r3]	@ tmp327, *_27
	strd	r2, [fp, #-52]	@ tmp327,,
@ main.c:50:             mag = (mag > 0) ? mag : -mag;
	ldrd	r2, [fp, #-52]	@ tmp329,,
	mov	r0, #0	@ tmp328,
	mov	r1, #0	@,
	asr	r0, r3, #31	@ tmp328,,
	asr	r1, r3, #31	@,,
	ldrd	r2, [fp, #-52]	@ tmp333,,
	eor	ip, r2, r0	@ tmp588, tmp333, tmp328
	str	ip, [fp, #-124]	@ tmp588, %sfp
	eor	r3, r3, r1	@ tmp589,,
	str	r3, [fp, #-120]	@ tmp589, %sfp
	ldrd	r2, [fp, #-124]	@ tmp332,,
	mov	ip, r2	@ tmp591, tmp332
	subs	ip, ip, r0	@ tmp590, tmp591, tmp328
	str	ip, [fp, #-132]	@ tmp590, %sfp
	sbc	r3, r3, r1	@ tmp592, tmp593,
	str	r3, [fp, #-128]	@ tmp592, %sfp
	ldrd	r2, [fp, #-132]	@ tmp334,,
	strd	r2, [fp, #-52]	@ tmp334,,
@ main.c:51:             if (mag > largest)
	ldrd	r0, [fp, #-52]	@ tmp335,,
	ldrd	r2, [fp, #-44]	@ tmp336,,
	cmp	r2, r0	@ tmp336, tmp335
	sbcs	r3, r3, r1	@ tmp586,,
	bge	.L13		@,
@ main.c:53:                 largest = mag;
	ldrd	r2, [fp, #-52]	@ tmp337,,
	strd	r2, [fp, #-44]	@ tmp337,,
@ main.c:54:                 j = k;
	mov	r9, r8	@ j, k
.L13:
@ main.c:47:         for (k = i + 1; k < ORDER; ++k)
	uxth	r3, r8	@ k.5_29, k
	add	r3, r3, #1	@ tmp338, k.5_29,
	uxth	r3, r3	@ _30, tmp338
	sxth	r8, r3	@ k, _30
.L12:
@ main.c:47:         for (k = i + 1; k < ORDER; ++k)
	cmp	r8, #99	@ k,
	ble	.L14		@,
@ main.c:57:         if (i ^ j) { // j != i
	cmp	r10, r9	@ i, j
	beq	.L15		@,
@ main.c:58:             for (k = 0; k < ORDER; ++k)
	mov	r8, #0	@ k,
@ main.c:58:             for (k = 0; k < ORDER; ++k)
	b	.L16		@
.L17:
@ main.c:60:                 long long t = m[i][k];
	mov	r3, r10	@ _31, i
	mov	r2, r3	@ tmp339, _31
	lsl	r2, r2, #2	@ tmp339, tmp339,
	add	r2, r2, r3	@ tmp339, tmp339, _31
	lsl	r3, r2, #2	@ tmp340, tmp339,
	add	r2, r2, r3	@ tmp339, tmp339, tmp340
	lsl	r3, r2, #5	@ tmp341, tmp339,
	mov	r2, r3	@ tmp339, tmp341
	ldr	r3, [fp, #-80]	@ tmp342, m
	add	r2, r3, r2	@ _33, tmp342, _32
@ main.c:60:                 long long t = m[i][k];
	mov	r3, r8	@ _34, k
@ main.c:60:                 long long t = m[i][k];
	lsl	r3, r3, #3	@ tmp343, _34,
	add	r3, r2, r3	@ tmp344, _33, tmp343
	ldrd	r2, [r3]	@ tmp345, *_33
	strd	r2, [fp, #-60]	@ tmp345,,
@ main.c:61:                 m[i][k] = m[j][k];
	mov	r3, r9	@ _35, j
	mov	r2, r3	@ tmp346, _35
	lsl	r2, r2, #2	@ tmp346, tmp346,
	add	r2, r2, r3	@ tmp346, tmp346, _35
	lsl	r3, r2, #2	@ tmp347, tmp346,
	add	r2, r2, r3	@ tmp346, tmp346, tmp347
	lsl	r3, r2, #5	@ tmp348, tmp346,
	mov	r2, r3	@ tmp346, tmp348
	ldr	r3, [fp, #-80]	@ tmp349, m
	add	r1, r3, r2	@ _37, tmp349, _36
@ main.c:61:                 m[i][k] = m[j][k];
	mov	r0, r8	@ _38, k
@ main.c:61:                 m[i][k] = m[j][k];
	mov	r3, r10	@ _39, i
	mov	r2, r3	@ tmp350, _39
	lsl	r2, r2, #2	@ tmp350, tmp350,
	add	r2, r2, r3	@ tmp350, tmp350, _39
	lsl	r3, r2, #2	@ tmp351, tmp350,
	add	r2, r2, r3	@ tmp350, tmp350, tmp351
	lsl	r3, r2, #5	@ tmp352, tmp350,
	mov	r2, r3	@ tmp350, tmp352
	ldr	r3, [fp, #-80]	@ tmp353, m
	add	r2, r3, r2	@ _41, tmp353, _40
@ main.c:61:                 m[i][k] = m[j][k];
	mov	ip, r8	@ _42, k
@ main.c:61:                 m[i][k] = m[j][k];
	lsl	r3, r0, #3	@ tmp354, _38,
	add	r3, r1, r3	@ tmp355, _37, tmp354
	ldrd	r0, [r3]	@ _43, *_37
@ main.c:61:                 m[i][k] = m[j][k];
	lsl	r3, ip, #3	@ tmp356, _42,
	add	r3, r2, r3	@ tmp357, _41, tmp356
	strd	r0, [r3]	@ _43, *_41
@ main.c:62:                 m[j][k] = t;
	mov	r3, r9	@ _44, j
	mov	r2, r3	@ tmp358, _44
	lsl	r2, r2, #2	@ tmp358, tmp358,
	add	r2, r2, r3	@ tmp358, tmp358, _44
	lsl	r3, r2, #2	@ tmp359, tmp358,
	add	r2, r2, r3	@ tmp358, tmp358, tmp359
	lsl	r3, r2, #5	@ tmp360, tmp358,
	mov	r2, r3	@ tmp358, tmp360
	ldr	r3, [fp, #-80]	@ tmp361, m
	add	r2, r3, r2	@ _46, tmp361, _45
@ main.c:62:                 m[j][k] = t;
	mov	r3, r8	@ _47, k
@ main.c:62:                 m[j][k] = t;
	lsl	r3, r3, #3	@ tmp362, _47,
	add	r1, r2, r3	@ tmp363, _46, tmp362
	ldrd	r2, [fp, #-60]	@ tmp364,,
	strd	r2, [r1]	@ tmp364, *_46
@ main.c:70:                 t = augmented[i][k];
	mov	r3, r10	@ _48, i
	mov	r2, r3	@ tmp365, _48
	lsl	r2, r2, #2	@ tmp365, tmp365,
	add	r2, r2, r3	@ tmp365, tmp365, _48
	lsl	r3, r2, #2	@ tmp366, tmp365,
	add	r2, r2, r3	@ tmp365, tmp365, tmp366
	lsl	r3, r2, #5	@ tmp367, tmp365,
	mov	r2, r3	@ tmp365, tmp367
	ldr	r3, [fp, #-84]	@ tmp368, augmented
	add	r2, r3, r2	@ _50, tmp368, _49
@ main.c:70:                 t = augmented[i][k];
	mov	r3, r8	@ _51, k
@ main.c:70:                 t = augmented[i][k];
	lsl	r3, r3, #3	@ tmp369, _51,
	add	r3, r2, r3	@ tmp370, _50, tmp369
	ldrd	r2, [r3]	@ tmp371, *_50
	strd	r2, [fp, #-60]	@ tmp371,,
@ main.c:71:                 augmented[i][k] = augmented[j][k];
	mov	r3, r9	@ _52, j
	mov	r2, r3	@ tmp372, _52
	lsl	r2, r2, #2	@ tmp372, tmp372,
	add	r2, r2, r3	@ tmp372, tmp372, _52
	lsl	r3, r2, #2	@ tmp373, tmp372,
	add	r2, r2, r3	@ tmp372, tmp372, tmp373
	lsl	r3, r2, #5	@ tmp374, tmp372,
	mov	r2, r3	@ tmp372, tmp374
	ldr	r3, [fp, #-84]	@ tmp375, augmented
	add	r1, r3, r2	@ _54, tmp375, _53
@ main.c:71:                 augmented[i][k] = augmented[j][k];
	mov	r0, r8	@ _55, k
@ main.c:71:                 augmented[i][k] = augmented[j][k];
	mov	r3, r10	@ _56, i
	mov	r2, r3	@ tmp376, _56
	lsl	r2, r2, #2	@ tmp376, tmp376,
	add	r2, r2, r3	@ tmp376, tmp376, _56
	lsl	r3, r2, #2	@ tmp377, tmp376,
	add	r2, r2, r3	@ tmp376, tmp376, tmp377
	lsl	r3, r2, #5	@ tmp378, tmp376,
	mov	r2, r3	@ tmp376, tmp378
	ldr	r3, [fp, #-84]	@ tmp379, augmented
	add	r2, r3, r2	@ _58, tmp379, _57
@ main.c:71:                 augmented[i][k] = augmented[j][k];
	mov	ip, r8	@ _59, k
@ main.c:71:                 augmented[i][k] = augmented[j][k];
	lsl	r3, r0, #3	@ tmp380, _55,
	add	r3, r1, r3	@ tmp381, _54, tmp380
	ldrd	r0, [r3]	@ _60, *_54
@ main.c:71:                 augmented[i][k] = augmented[j][k];
	lsl	r3, ip, #3	@ tmp382, _59,
	add	r3, r2, r3	@ tmp383, _58, tmp382
	strd	r0, [r3]	@ _60, *_58
@ main.c:72:                 augmented[j][k] = t;
	mov	r3, r9	@ _61, j
	mov	r2, r3	@ tmp384, _61
	lsl	r2, r2, #2	@ tmp384, tmp384,
	add	r2, r2, r3	@ tmp384, tmp384, _61
	lsl	r3, r2, #2	@ tmp385, tmp384,
	add	r2, r2, r3	@ tmp384, tmp384, tmp385
	lsl	r3, r2, #5	@ tmp386, tmp384,
	mov	r2, r3	@ tmp384, tmp386
	ldr	r3, [fp, #-84]	@ tmp387, augmented
	add	r2, r3, r2	@ _63, tmp387, _62
@ main.c:72:                 augmented[j][k] = t;
	mov	r3, r8	@ _64, k
@ main.c:72:                 augmented[j][k] = t;
	lsl	r3, r3, #3	@ tmp388, _64,
	add	r1, r2, r3	@ tmp389, _63, tmp388
	ldrd	r2, [fp, #-60]	@ tmp390,,
	strd	r2, [r1]	@ tmp390, *_63
@ main.c:58:             for (k = 0; k < ORDER; ++k)
	uxth	r3, r8	@ k.6_65, k
	add	r3, r3, #1	@ tmp391, k.6_65,
	uxth	r3, r3	@ _66, tmp391
	sxth	r8, r3	@ k, _66
.L16:
@ main.c:58:             for (k = 0; k < ORDER; ++k)
	cmp	r8, #99	@ k,
	ble	.L17		@,
.L15:
@ main.c:81:         largest = m[i][i];
	mov	r3, r10	@ _67, i
	mov	r2, r3	@ tmp392, _67
	lsl	r2, r2, #2	@ tmp392, tmp392,
	add	r2, r2, r3	@ tmp392, tmp392, _67
	lsl	r3, r2, #2	@ tmp393, tmp392,
	add	r2, r2, r3	@ tmp392, tmp392, tmp393
	lsl	r3, r2, #5	@ tmp394, tmp392,
	mov	r2, r3	@ tmp392, tmp394
	ldr	r3, [fp, #-80]	@ tmp395, m
	add	r2, r3, r2	@ _69, tmp395, _68
@ main.c:81:         largest = m[i][i];
	mov	r3, r10	@ _70, i
@ main.c:81:         largest = m[i][i];
	lsl	r3, r3, #3	@ tmp396, _70,
	add	r3, r2, r3	@ tmp397, _69, tmp396
	ldrd	r2, [r3]	@ tmp398, *_69
	strd	r2, [fp, #-44]	@ tmp398,,
@ main.c:82:         if (!largest)
	ldrd	r2, [fp, #-44]	@ tmp399,,
	orrs	r3, r2, r3	@ tmp587, tmp399
	bne	.L18		@,
@ main.c:84:             printf("The matrix is ill-conditioned.\n");
	movw	r0, #:lower16:.LC2	@,
	movt	r0, #:upper16:.LC2	@,
	bl	puts		@
@ main.c:85:             exit(0);
	mov	r0, #0	@,
	bl	exit		@
.L18:
@ main.c:89:         for (j = 0; j < ORDER; ++j)
	mov	r9, #0	@ j,
@ main.c:89:         for (j = 0; j < ORDER; ++j)
	b	.L19		@
.L25:
@ main.c:91:             if (i ^ j) // i != j
	cmp	r10, r9	@ i, j
	beq	.L20		@,
@ main.c:93:                 long long ratio = m[j][i]* (SHIFT_MASK) /largest;
	mov	r3, r9	@ _71, j
	mov	r2, r3	@ tmp400, _71
	lsl	r2, r2, #2	@ tmp400, tmp400,
	add	r2, r2, r3	@ tmp400, tmp400, _71
	lsl	r3, r2, #2	@ tmp401, tmp400,
	add	r2, r2, r3	@ tmp400, tmp400, tmp401
	lsl	r3, r2, #5	@ tmp402, tmp400,
	mov	r2, r3	@ tmp400, tmp402
	ldr	r3, [fp, #-80]	@ tmp403, m
	add	r2, r3, r2	@ _73, tmp403, _72
@ main.c:93:                 long long ratio = m[j][i]* (SHIFT_MASK) /largest;
	mov	r3, r10	@ _74, i
	lsl	r3, r3, #3	@ tmp404, _74,
	add	r3, r2, r3	@ tmp405, _73, tmp404
	ldrd	r2, [r3]	@ _75, *_73
@ main.c:93:                 long long ratio = m[j][i]* (SHIFT_MASK) /largest;
	mov	r0, #0	@ _76,
	mov	r1, #0	@ _76,
	lsl	r1, r3, #16	@ _76, _75,
	orr	r1, r1, r2, lsr #16	@ _76, _76, _75,
	lsl	r0, r2, #16	@ _76, _75,
@ main.c:93:                 long long ratio = m[j][i]* (SHIFT_MASK) /largest;
	ldrd	r2, [fp, #-44]	@,,
	bl	__aeabi_ldivmod		@
	mov	r2, r0	@ tmp411,
	mov	r3, r1	@,
	strd	r2, [fp, #-68]	@ tmp411,,
@ main.c:94:                 for (k = 0; k < ORDER; k += 2)
	mov	r8, #0	@ k,
@ main.c:94:                 for (k = 0; k < ORDER; k += 2)
	b	.L21		@
.L22:
@ main.c:96:                     m[j][k] -= ratio*m[i][k]/(SHIFT_MASK);
	mov	r3, r9	@ _77, j
	mov	r2, r3	@ tmp412, _77
	lsl	r2, r2, #2	@ tmp412, tmp412,
	add	r2, r2, r3	@ tmp412, tmp412, _77
	lsl	r3, r2, #2	@ tmp413, tmp412,
	add	r2, r2, r3	@ tmp412, tmp412, tmp413
	lsl	r3, r2, #5	@ tmp414, tmp412,
	mov	r2, r3	@ tmp412, tmp414
	ldr	r3, [fp, #-80]	@ tmp415, m
	add	r2, r3, r2	@ _79, tmp415, _78
	mov	r3, r8	@ _80, k
	lsl	r3, r3, #3	@ tmp416, _80,
	add	r3, r2, r3	@ tmp417, _79, tmp416
	ldrd	r6, [r3]	@ _81, *_79
@ main.c:96:                     m[j][k] -= ratio*m[i][k]/(SHIFT_MASK);
	mov	r3, r10	@ _82, i
	mov	r2, r3	@ tmp418, _82
	lsl	r2, r2, #2	@ tmp418, tmp418,
	add	r2, r2, r3	@ tmp418, tmp418, _82
	lsl	r3, r2, #2	@ tmp419, tmp418,
	add	r2, r2, r3	@ tmp418, tmp418, tmp419
	lsl	r3, r2, #5	@ tmp420, tmp418,
	mov	r2, r3	@ tmp418, tmp420
	ldr	r3, [fp, #-80]	@ tmp421, m
	add	r2, r3, r2	@ _84, tmp421, _83
@ main.c:96:                     m[j][k] -= ratio*m[i][k]/(SHIFT_MASK);
	mov	r3, r8	@ _85, k
	lsl	r3, r3, #3	@ tmp422, _85,
	add	r3, r2, r3	@ tmp423, _84, tmp422
	ldrd	r2, [r3]	@ _86, *_84
@ main.c:96:                     m[j][k] -= ratio*m[i][k]/(SHIFT_MASK);
	ldr	r1, [fp, #-68]	@ tmp425, ratio
	mul	r0, r3, r1	@ tmp424, _86, tmp425
	ldr	r1, [fp, #-64]	@ tmp427, ratio
	mul	r1, r2, r1	@ tmp426, _86, tmp427
	add	r0, r0, r1	@ tmp428, tmp424, tmp426
	ldr	r1, [fp, #-68]	@ tmp429, ratio
	umull	r4, r5, r1, r2	@ _87, tmp429, _86
	add	r3, r0, r5	@ tmp430, tmp428, _87
	mov	r5, r3	@ _87, tmp430
@ main.c:96:                     m[j][k] -= ratio*m[i][k]/(SHIFT_MASK);
	asr	r3, r5, #31	@ tmp435, _87,
	mov	r0, r3	@ tmp434, tmp435
	asr	r1, r0, #31	@, tmp434,
	movw	r2, #65535	@ tmp437,
	mov	r3, #0	@,
	and	ip, r0, r2	@ tmp595, tmp434, tmp437
	str	ip, [fp, #-140]	@ tmp595, %sfp
	and	r3, r1, r3	@ tmp596,,
	str	r3, [fp, #-136]	@ tmp596, %sfp
	ldrd	r2, [fp, #-140]	@ tmp436,,
	mov	r1, r2	@ tmp598, tmp436
	adds	r1, r1, r4	@ tmp597, tmp598, _87
	str	r1, [fp, #-148]	@ tmp597, %sfp
	adc	r3, r3, r5	@ tmp599, tmp600, _87
	str	r3, [fp, #-144]	@ tmp599, %sfp
	mov	r2, #0	@ tmp439,
	mov	r3, #0	@,
	ldrd	r0, [fp, #-148]	@ tmp438,,
	mov	ip, r0	@ tmp601, tmp438
	lsr	r2, ip, #16	@ tmp439, tmp601,
	mov	ip, r1	@ tmp602,
	orr	r2, r2, ip, lsl #16	@ tmp439, tmp439, tmp602,
	asr	r3, r1, #16	@, tmp603,
	rsbs	r2, r2, #0	@ tmp439, tmp439,
	rsc	r3, r3, #0	@,,
	mov	r0, r2	@ _88, tmp439
	mov	r1, r3	@ _88,
@ main.c:96:                     m[j][k] -= ratio*m[i][k]/(SHIFT_MASK);
	mov	r3, r9	@ _89, j
	mov	r2, r3	@ tmp442, _89
	lsl	r2, r2, #2	@ tmp442, tmp442,
	add	r2, r2, r3	@ tmp442, tmp442, _89
	lsl	r3, r2, #2	@ tmp443, tmp442,
	add	r2, r2, r3	@ tmp442, tmp442, tmp443
	lsl	r3, r2, #5	@ tmp444, tmp442,
	mov	r2, r3	@ tmp442, tmp444
	ldr	r3, [fp, #-80]	@ tmp445, m
	add	r2, r3, r2	@ _91, tmp445, _90
	mov	r3, r8	@ _92, k
	adds	ip, r6, r0	@ tmp604, _81, _88
	str	ip, [fp, #-92]	@ tmp604, %sfp
	adc	r1, r7, r1	@ tmp605, _81, _88
	str	r1, [fp, #-88]	@ tmp605, %sfp
	lsl	r3, r3, #3	@ tmp446, _92,
	add	r3, r2, r3	@ tmp447, _91, tmp446
	ldrd	r0, [fp, #-92]	@ _93,,
	strd	r0, [r3]	@ _93, *_91
@ main.c:97:                     m[j][k+1] -= ratio*m[i][k+1]/(SHIFT_MASK);
	mov	r3, r9	@ _94, j
	mov	r2, r3	@ tmp448, _94
	lsl	r2, r2, #2	@ tmp448, tmp448,
	add	r2, r2, r3	@ tmp448, tmp448, _94
	lsl	r3, r2, #2	@ tmp449, tmp448,
	add	r2, r2, r3	@ tmp448, tmp448, tmp449
	lsl	r3, r2, #5	@ tmp450, tmp448,
	mov	r2, r3	@ tmp448, tmp450
	ldr	r3, [fp, #-80]	@ tmp451, m
	add	r2, r3, r2	@ _96, tmp451, _95
	mov	r3, r8	@ _97, k
	add	r3, r3, #1	@ _98, _97,
	lsl	r3, r3, #3	@ tmp452, _98,
	add	r3, r2, r3	@ tmp453, _96, tmp452
	ldrd	r6, [r3]	@ _99, *_96
@ main.c:97:                     m[j][k+1] -= ratio*m[i][k+1]/(SHIFT_MASK);
	mov	r3, r10	@ _100, i
	mov	r2, r3	@ tmp454, _100
	lsl	r2, r2, #2	@ tmp454, tmp454,
	add	r2, r2, r3	@ tmp454, tmp454, _100
	lsl	r3, r2, #2	@ tmp455, tmp454,
	add	r2, r2, r3	@ tmp454, tmp454, tmp455
	lsl	r3, r2, #5	@ tmp456, tmp454,
	mov	r2, r3	@ tmp454, tmp456
	ldr	r3, [fp, #-80]	@ tmp457, m
	add	r2, r3, r2	@ _102, tmp457, _101
@ main.c:97:                     m[j][k+1] -= ratio*m[i][k+1]/(SHIFT_MASK);
	mov	r3, r8	@ _103, k
	add	r3, r3, #1	@ _104, _103,
@ main.c:97:                     m[j][k+1] -= ratio*m[i][k+1]/(SHIFT_MASK);
	lsl	r3, r3, #3	@ tmp458, _104,
	add	r3, r2, r3	@ tmp459, _102, tmp458
	ldrd	r2, [r3]	@ _105, *_102
@ main.c:97:                     m[j][k+1] -= ratio*m[i][k+1]/(SHIFT_MASK);
	ldr	r1, [fp, #-68]	@ tmp461, ratio
	mul	r0, r3, r1	@ tmp460, _105, tmp461
	ldr	r1, [fp, #-64]	@ tmp463, ratio
	mul	r1, r2, r1	@ tmp462, _105, tmp463
	add	r0, r0, r1	@ tmp464, tmp460, tmp462
	ldr	r1, [fp, #-68]	@ tmp465, ratio
	umull	r4, r5, r1, r2	@ _106, tmp465, _105
	add	r3, r0, r5	@ tmp466, tmp464, _106
	mov	r5, r3	@ _106, tmp466
@ main.c:97:                     m[j][k+1] -= ratio*m[i][k+1]/(SHIFT_MASK);
	asr	r3, r5, #31	@ tmp471, _106,
	mov	r0, r3	@ tmp470, tmp471
	asr	r1, r0, #31	@, tmp470,
	movw	r2, #65535	@ tmp473,
	mov	r3, #0	@,
	and	ip, r0, r2	@ tmp607, tmp470, tmp473
	str	ip, [fp, #-156]	@ tmp607, %sfp
	and	r3, r1, r3	@ tmp608,,
	str	r3, [fp, #-152]	@ tmp608, %sfp
	ldrd	r2, [fp, #-156]	@ tmp472,,
	mov	r1, r2	@ tmp610, tmp472
	adds	r1, r1, r4	@ tmp609, tmp610, _106
	str	r1, [fp, #-164]	@ tmp609, %sfp
	adc	r3, r3, r5	@ tmp611, tmp612, _106
	str	r3, [fp, #-160]	@ tmp611, %sfp
	mov	r2, #0	@ tmp475,
	mov	r3, #0	@,
	ldrd	r0, [fp, #-164]	@ tmp474,,
	mov	ip, r0	@ tmp613, tmp474
	lsr	r2, ip, #16	@ tmp475, tmp613,
	mov	ip, r1	@ tmp614,
	orr	r2, r2, ip, lsl #16	@ tmp475, tmp475, tmp614,
	asr	r3, r1, #16	@, tmp615,
	rsbs	r2, r2, #0	@ tmp475, tmp475,
	rsc	r3, r3, #0	@,,
	mov	r0, r2	@ _107, tmp475
	mov	r1, r3	@ _107,
@ main.c:97:                     m[j][k+1] -= ratio*m[i][k+1]/(SHIFT_MASK);
	mov	r3, r9	@ _108, j
	mov	r2, r3	@ tmp478, _108
	lsl	r2, r2, #2	@ tmp478, tmp478,
	add	r2, r2, r3	@ tmp478, tmp478, _108
	lsl	r3, r2, #2	@ tmp479, tmp478,
	add	r2, r2, r3	@ tmp478, tmp478, tmp479
	lsl	r3, r2, #5	@ tmp480, tmp478,
	mov	r2, r3	@ tmp478, tmp480
	ldr	r3, [fp, #-80]	@ tmp481, m
	add	r2, r3, r2	@ _110, tmp481, _109
	mov	r3, r8	@ _111, k
	add	r3, r3, #1	@ _112, _111,
	adds	ip, r6, r0	@ tmp616, _99, _107
	str	ip, [fp, #-100]	@ tmp616, %sfp
	adc	r1, r7, r1	@ tmp617, _99, _107
	str	r1, [fp, #-96]	@ tmp617, %sfp
	lsl	r3, r3, #3	@ tmp482, _112,
	add	r3, r2, r3	@ tmp483, _110, tmp482
	ldrd	r0, [fp, #-100]	@ _113,,
	strd	r0, [r3]	@ _113, *_110
@ main.c:94:                 for (k = 0; k < ORDER; k += 2)
	uxth	r3, r8	@ k.7_114, k
	add	r3, r3, #2	@ tmp484, k.7_114,
	uxth	r3, r3	@ _115, tmp484
	sxth	r8, r3	@ k, _115
.L21:
@ main.c:94:                 for (k = 0; k < ORDER; k += 2)
	cmp	r8, #99	@ k,
	ble	.L22		@,
@ main.c:99:                 for (k = 0; k < ORDER; k += 2)
	mov	r8, #0	@ k,
@ main.c:99:                 for (k = 0; k < ORDER; k += 2)
	b	.L23		@
.L24:
@ main.c:101:                     augmented[j][k] -= ratio*augmented[i][k]/(SHIFT_MASK);
	mov	r3, r9	@ _116, j
	mov	r2, r3	@ tmp485, _116
	lsl	r2, r2, #2	@ tmp485, tmp485,
	add	r2, r2, r3	@ tmp485, tmp485, _116
	lsl	r3, r2, #2	@ tmp486, tmp485,
	add	r2, r2, r3	@ tmp485, tmp485, tmp486
	lsl	r3, r2, #5	@ tmp487, tmp485,
	mov	r2, r3	@ tmp485, tmp487
	ldr	r3, [fp, #-84]	@ tmp488, augmented
	add	r2, r3, r2	@ _118, tmp488, _117
	mov	r3, r8	@ _119, k
	lsl	r3, r3, #3	@ tmp489, _119,
	add	r3, r2, r3	@ tmp490, _118, tmp489
	ldrd	r6, [r3]	@ _120, *_118
@ main.c:101:                     augmented[j][k] -= ratio*augmented[i][k]/(SHIFT_MASK);
	mov	r3, r10	@ _121, i
	mov	r2, r3	@ tmp491, _121
	lsl	r2, r2, #2	@ tmp491, tmp491,
	add	r2, r2, r3	@ tmp491, tmp491, _121
	lsl	r3, r2, #2	@ tmp492, tmp491,
	add	r2, r2, r3	@ tmp491, tmp491, tmp492
	lsl	r3, r2, #5	@ tmp493, tmp491,
	mov	r2, r3	@ tmp491, tmp493
	ldr	r3, [fp, #-84]	@ tmp494, augmented
	add	r2, r3, r2	@ _123, tmp494, _122
@ main.c:101:                     augmented[j][k] -= ratio*augmented[i][k]/(SHIFT_MASK);
	mov	r3, r8	@ _124, k
	lsl	r3, r3, #3	@ tmp495, _124,
	add	r3, r2, r3	@ tmp496, _123, tmp495
	ldrd	r2, [r3]	@ _125, *_123
@ main.c:101:                     augmented[j][k] -= ratio*augmented[i][k]/(SHIFT_MASK);
	ldr	r1, [fp, #-68]	@ tmp498, ratio
	mul	r0, r3, r1	@ tmp497, _125, tmp498
	ldr	r1, [fp, #-64]	@ tmp500, ratio
	mul	r1, r2, r1	@ tmp499, _125, tmp500
	add	r0, r0, r1	@ tmp501, tmp497, tmp499
	ldr	r1, [fp, #-68]	@ tmp502, ratio
	umull	r4, r5, r1, r2	@ _126, tmp502, _125
	add	r3, r0, r5	@ tmp503, tmp501, _126
	mov	r5, r3	@ _126, tmp503
@ main.c:101:                     augmented[j][k] -= ratio*augmented[i][k]/(SHIFT_MASK);
	asr	r3, r5, #31	@ tmp508, _126,
	mov	r0, r3	@ tmp507, tmp508
	asr	r1, r0, #31	@, tmp507,
	movw	r2, #65535	@ tmp510,
	mov	r3, #0	@,
	and	ip, r0, r2	@ tmp619, tmp507, tmp510
	str	ip, [fp, #-172]	@ tmp619, %sfp
	and	r3, r1, r3	@ tmp620,,
	str	r3, [fp, #-168]	@ tmp620, %sfp
	ldrd	r2, [fp, #-172]	@ tmp509,,
	mov	r1, r2	@ tmp622, tmp509
	adds	r1, r1, r4	@ tmp621, tmp622, _126
	str	r1, [fp, #-180]	@ tmp621, %sfp
	adc	r3, r3, r5	@ tmp623, tmp624, _126
	str	r3, [fp, #-176]	@ tmp623, %sfp
	mov	r2, #0	@ tmp512,
	mov	r3, #0	@,
	ldrd	r0, [fp, #-180]	@ tmp511,,
	mov	ip, r0	@ tmp625, tmp511
	lsr	r2, ip, #16	@ tmp512, tmp625,
	mov	ip, r1	@ tmp626,
	orr	r2, r2, ip, lsl #16	@ tmp512, tmp512, tmp626,
	asr	r3, r1, #16	@, tmp627,
	rsbs	r2, r2, #0	@ tmp512, tmp512,
	rsc	r3, r3, #0	@,,
	mov	r0, r2	@ _127, tmp512
	mov	r1, r3	@ _127,
@ main.c:101:                     augmented[j][k] -= ratio*augmented[i][k]/(SHIFT_MASK);
	mov	r3, r9	@ _128, j
	mov	r2, r3	@ tmp515, _128
	lsl	r2, r2, #2	@ tmp515, tmp515,
	add	r2, r2, r3	@ tmp515, tmp515, _128
	lsl	r3, r2, #2	@ tmp516, tmp515,
	add	r2, r2, r3	@ tmp515, tmp515, tmp516
	lsl	r3, r2, #5	@ tmp517, tmp515,
	mov	r2, r3	@ tmp515, tmp517
	ldr	r3, [fp, #-84]	@ tmp518, augmented
	add	r2, r3, r2	@ _130, tmp518, _129
	mov	r3, r8	@ _131, k
	adds	ip, r6, r0	@ tmp628, _120, _127
	str	ip, [fp, #-108]	@ tmp628, %sfp
	adc	r1, r7, r1	@ tmp629, _120, _127
	str	r1, [fp, #-104]	@ tmp629, %sfp
	lsl	r3, r3, #3	@ tmp519, _131,
	add	r3, r2, r3	@ tmp520, _130, tmp519
	ldrd	r0, [fp, #-108]	@ _132,,
	strd	r0, [r3]	@ _132, *_130
@ main.c:102:                     augmented[j][k+1] -= ratio*augmented[i][k+1]/(SHIFT_MASK);
	mov	r3, r9	@ _133, j
	mov	r2, r3	@ tmp521, _133
	lsl	r2, r2, #2	@ tmp521, tmp521,
	add	r2, r2, r3	@ tmp521, tmp521, _133
	lsl	r3, r2, #2	@ tmp522, tmp521,
	add	r2, r2, r3	@ tmp521, tmp521, tmp522
	lsl	r3, r2, #5	@ tmp523, tmp521,
	mov	r2, r3	@ tmp521, tmp523
	ldr	r3, [fp, #-84]	@ tmp524, augmented
	add	r2, r3, r2	@ _135, tmp524, _134
	mov	r3, r8	@ _136, k
	add	r3, r3, #1	@ _137, _136,
	lsl	r3, r3, #3	@ tmp525, _137,
	add	r3, r2, r3	@ tmp526, _135, tmp525
	ldrd	r6, [r3]	@ _138, *_135
@ main.c:102:                     augmented[j][k+1] -= ratio*augmented[i][k+1]/(SHIFT_MASK);
	mov	r3, r10	@ _139, i
	mov	r2, r3	@ tmp527, _139
	lsl	r2, r2, #2	@ tmp527, tmp527,
	add	r2, r2, r3	@ tmp527, tmp527, _139
	lsl	r3, r2, #2	@ tmp528, tmp527,
	add	r2, r2, r3	@ tmp527, tmp527, tmp528
	lsl	r3, r2, #5	@ tmp529, tmp527,
	mov	r2, r3	@ tmp527, tmp529
	ldr	r3, [fp, #-84]	@ tmp530, augmented
	add	r2, r3, r2	@ _141, tmp530, _140
@ main.c:102:                     augmented[j][k+1] -= ratio*augmented[i][k+1]/(SHIFT_MASK);
	mov	r3, r8	@ _142, k
	add	r3, r3, #1	@ _143, _142,
@ main.c:102:                     augmented[j][k+1] -= ratio*augmented[i][k+1]/(SHIFT_MASK);
	lsl	r3, r3, #3	@ tmp531, _143,
	add	r3, r2, r3	@ tmp532, _141, tmp531
	ldrd	r2, [r3]	@ _144, *_141
@ main.c:102:                     augmented[j][k+1] -= ratio*augmented[i][k+1]/(SHIFT_MASK);
	ldr	r1, [fp, #-68]	@ tmp534, ratio
	mul	r0, r3, r1	@ tmp533, _144, tmp534
	ldr	r1, [fp, #-64]	@ tmp536, ratio
	mul	r1, r2, r1	@ tmp535, _144, tmp536
	add	r0, r0, r1	@ tmp537, tmp533, tmp535
	ldr	r1, [fp, #-68]	@ tmp538, ratio
	umull	r4, r5, r1, r2	@ _145, tmp538, _144
	add	r3, r0, r5	@ tmp539, tmp537, _145
	mov	r5, r3	@ _145, tmp539
@ main.c:102:                     augmented[j][k+1] -= ratio*augmented[i][k+1]/(SHIFT_MASK);
	asr	r3, r5, #31	@ tmp544, _145,
	mov	r0, r3	@ tmp543, tmp544
	asr	r1, r0, #31	@, tmp543,
	movw	r2, #65535	@ tmp546,
	mov	r3, #0	@,
	and	ip, r0, r2	@ tmp631, tmp543, tmp546
	str	ip, [fp, #-188]	@ tmp631, %sfp
	and	r3, r1, r3	@ tmp632,,
	str	r3, [fp, #-184]	@ tmp632, %sfp
	ldrd	r2, [fp, #-188]	@ tmp545,,
	mov	r1, r2	@ tmp634, tmp545
	adds	r1, r1, r4	@ tmp633, tmp634, _145
	str	r1, [fp, #-196]	@ tmp633, %sfp
	adc	r3, r3, r5	@ tmp635, tmp636, _145
	str	r3, [fp, #-192]	@ tmp635, %sfp
	mov	r2, #0	@ tmp548,
	mov	r3, #0	@,
	ldrd	r0, [fp, #-196]	@ tmp547,,
	mov	ip, r0	@ tmp637, tmp547
	lsr	r2, ip, #16	@ tmp548, tmp637,
	mov	ip, r1	@ tmp638,
	orr	r2, r2, ip, lsl #16	@ tmp548, tmp548, tmp638,
	asr	r3, r1, #16	@, tmp639,
	rsbs	r2, r2, #0	@ tmp548, tmp548,
	rsc	r3, r3, #0	@,,
	mov	r0, r2	@ _146, tmp548
	mov	r1, r3	@ _146,
@ main.c:102:                     augmented[j][k+1] -= ratio*augmented[i][k+1]/(SHIFT_MASK);
	mov	r3, r9	@ _147, j
	mov	r2, r3	@ tmp551, _147
	lsl	r2, r2, #2	@ tmp551, tmp551,
	add	r2, r2, r3	@ tmp551, tmp551, _147
	lsl	r3, r2, #2	@ tmp552, tmp551,
	add	r2, r2, r3	@ tmp551, tmp551, tmp552
	lsl	r3, r2, #5	@ tmp553, tmp551,
	mov	r2, r3	@ tmp551, tmp553
	ldr	r3, [fp, #-84]	@ tmp554, augmented
	add	r2, r3, r2	@ _149, tmp554, _148
	mov	r3, r8	@ _150, k
	add	r3, r3, #1	@ _151, _150,
	adds	ip, r6, r0	@ tmp640, _138, _146
	str	ip, [fp, #-116]	@ tmp640, %sfp
	adc	r1, r7, r1	@ tmp641, _138, _146
	str	r1, [fp, #-112]	@ tmp641, %sfp
	lsl	r3, r3, #3	@ tmp555, _151,
	add	r3, r2, r3	@ tmp556, _149, tmp555
	ldrd	r0, [fp, #-116]	@ _152,,
	strd	r0, [r3]	@ _152, *_149
@ main.c:99:                 for (k = 0; k < ORDER; k += 2)
	uxth	r3, r8	@ k.8_153, k
	add	r3, r3, #2	@ tmp557, k.8_153,
	uxth	r3, r3	@ _154, tmp557
	sxth	r8, r3	@ k, _154
.L23:
@ main.c:99:                 for (k = 0; k < ORDER; k += 2)
	cmp	r8, #99	@ k,
	ble	.L24		@,
.L20:
@ main.c:89:         for (j = 0; j < ORDER; ++j)
	uxth	r3, r9	@ j.9_155, j
	add	r3, r3, #1	@ tmp558, j.9_155,
	uxth	r3, r3	@ _156, tmp558
	sxth	r9, r3	@ j, _156
.L19:
@ main.c:89:         for (j = 0; j < ORDER; ++j)
	cmp	r9, #99	@ j,
	ble	.L25		@,
@ main.c:40:     for (i = 0; i < ORDER; ++i)
	uxth	r3, r10	@ i.10_157, i
	add	r3, r3, #1	@ tmp559, i.10_157,
	uxth	r3, r3	@ _158, tmp559
	sxth	r10, r3	@ i, _158
.L11:
@ main.c:40:     for (i = 0; i < ORDER; ++i)
	cmp	r10, #99	@ i,
	ble	.L26		@,
@ main.c:110:     for (i ^= i; i < ORDER; ++i)
	mov	r10, #0	@ i,
@ main.c:110:     for (i ^= i; i < ORDER; ++i)
	b	.L27		@
.L30:
@ main.c:112:         long long tll = m[i][i];
	mov	r2, r10	@ _159, i
	mov	r3, r2	@ tmp560, _159
	lsl	r3, r3, #2	@ tmp560, tmp560,
	add	r3, r3, r2	@ tmp560, tmp560, _159
	lsl	r2, r3, #2	@ tmp561, tmp560,
	add	r3, r3, r2	@ tmp560, tmp560, tmp561
	lsl	r3, r3, #5	@ tmp562, tmp560,
	mov	r2, r3	@ _160, tmp560
	ldr	r3, [fp, #-80]	@ tmp563, m
	add	r2, r3, r2	@ _161, tmp563, _160
@ main.c:112:         long long tll = m[i][i];
	mov	r3, r10	@ _162, i
@ main.c:112:         long long tll = m[i][i];
	lsl	r3, r3, #3	@ tmp564, _162,
	add	r3, r2, r3	@ tmp565, _161, tmp564
	ldrd	r2, [r3]	@ tmp566, *_161
	strd	r2, [fp, #-76]	@ tmp566,,
@ main.c:114:         for (j ^= j; j < ORDER; ++j)
	mov	r9, #0	@ j,
@ main.c:114:         for (j ^= j; j < ORDER; ++j)
	b	.L28		@
.L29:
@ main.c:116:             augmented[i][j] = augmented[i][j]* (SHIFT_MASK)/ tll;
	mov	r2, r10	@ _163, i
	mov	r3, r2	@ tmp567, _163
	lsl	r3, r3, #2	@ tmp567, tmp567,
	add	r3, r3, r2	@ tmp567, tmp567, _163
	lsl	r2, r3, #2	@ tmp568, tmp567,
	add	r3, r3, r2	@ tmp567, tmp567, tmp568
	lsl	r3, r3, #5	@ tmp569, tmp567,
	mov	r2, r3	@ _164, tmp567
	ldr	r3, [fp, #-84]	@ tmp570, augmented
	add	r2, r3, r2	@ _165, tmp570, _164
@ main.c:116:             augmented[i][j] = augmented[i][j]* (SHIFT_MASK)/ tll;
	mov	r3, r9	@ _166, j
	lsl	r3, r3, #3	@ tmp571, _166,
	add	r3, r2, r3	@ tmp572, _165, tmp571
	ldrd	r2, [r3]	@ _167, *_165
@ main.c:116:             augmented[i][j] = augmented[i][j]* (SHIFT_MASK)/ tll;
	mov	r0, #0	@ _168,
	mov	r1, #0	@ _168,
	lsl	r1, r3, #16	@ _168, _167,
	orr	r1, r1, r2, lsr #16	@ _168, _168, _167,
	lsl	r0, r2, #16	@ _168, _167,
@ main.c:116:             augmented[i][j] = augmented[i][j]* (SHIFT_MASK)/ tll;
	mov	r2, r10	@ _169, i
	mov	r3, r2	@ tmp575, _169
	lsl	r3, r3, #2	@ tmp575, tmp575,
	add	r3, r3, r2	@ tmp575, tmp575, _169
	lsl	r2, r3, #2	@ tmp576, tmp575,
	add	r3, r3, r2	@ tmp575, tmp575, tmp576
	lsl	r3, r3, #5	@ tmp577, tmp575,
	mov	r2, r3	@ _170, tmp575
	ldr	r3, [fp, #-84]	@ tmp578, augmented
	add	r4, r3, r2	@ _171, tmp578, _170
@ main.c:116:             augmented[i][j] = augmented[i][j]* (SHIFT_MASK)/ tll;
	mov	r5, r9	@ _172, j
@ main.c:116:             augmented[i][j] = augmented[i][j]* (SHIFT_MASK)/ tll;
	ldrd	r2, [fp, #-76]	@,,
	bl	__aeabi_ldivmod		@
	mov	r2, r0	@ tmp581,
	mov	r3, r1	@,
@ main.c:116:             augmented[i][j] = augmented[i][j]* (SHIFT_MASK)/ tll;
	lsl	r1, r5, #3	@ tmp582, _172,
	add	r1, r4, r1	@ tmp583, _171, tmp582
	strd	r2, [r1]	@ _173, *_171
@ main.c:114:         for (j ^= j; j < ORDER; ++j)
	uxth	r3, r9	@ j.11_174, j
	add	r3, r3, #1	@ tmp584, j.11_174,
	uxth	r3, r3	@ _175, tmp584
	sxth	r9, r3	@ j, _175
.L28:
@ main.c:114:         for (j ^= j; j < ORDER; ++j)
	cmp	r9, #99	@ j,
	ble	.L29		@,
@ main.c:110:     for (i ^= i; i < ORDER; ++i)
	uxth	r3, r10	@ i.12_176, i
	add	r3, r3, #1	@ tmp585, i.12_176,
	uxth	r3, r3	@ _177, tmp585
	sxth	r10, r3	@ i, _177
.L27:
@ main.c:110:     for (i ^= i; i < ORDER; ++i)
	cmp	r10, #99	@ i,
	ble	.L30		@,
@ main.c:119: }
	nop	
	sub	sp, fp, #32	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
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
	sub	r3, fp, #159744	@ tmp131,,
	sub	r3, r3, #4	@ tmp131, tmp131,
	str	r0, [r3, #-300]	@ argc, argc
	sub	r3, fp, #159744	@ tmp133,,
	sub	r3, r3, #4	@ tmp133, tmp133,
	str	r1, [r3, #-304]	@ argv, argv
@ main.c:123:     if (argc != 2)
	sub	r3, fp, #159744	@ tmp135,,
	sub	r3, r3, #4	@ tmp135, tmp135,
	ldr	r3, [r3, #-300]	@ tmp136, argc
	cmp	r3, #2	@ tmp136,
	beq	.L32		@,
@ main.c:125:         printf("Usage: ./<executable> <matrix input file>\n");
	movw	r0, #:lower16:.LC3	@,
	movt	r0, #:upper16:.LC3	@,
	bl	puts		@
@ main.c:126:         exit(1);
	mov	r0, #1	@,
	bl	exit		@
.L32:
@ main.c:129:     clock_t start = clock();
	bl	clock		@
	str	r0, [fp, #-12]	@, start
@ main.c:133:     long long augmented[ORDER][ORDER] = {0};
	sub	r3, fp, #159744	@ tmp138,,
	sub	r3, r3, #4	@ tmp138, tmp138,
	sub	r0, r3, #296	@ tmp139, tmp137,
	mov	r3, #14464	@ tmp140,
	movt	r3, 1	@ tmp140,
	mov	r2, r3	@, tmp140
	mov	r1, #0	@,
	bl	memset		@
@ main.c:138:     if ((f = fopen(argv[1], "r")) == NULL)
	sub	r3, fp, #159744	@ tmp143,,
	sub	r3, r3, #4	@ tmp143, tmp143,
	ldr	r3, [r3, #-304]	@ tmp144, argv
	add	r3, r3, #4	@ _1, tmp144,
@ main.c:138:     if ((f = fopen(argv[1], "r")) == NULL)
	ldr	r3, [r3]	@ _2, *_1
	movw	r1, #:lower16:.LC4	@,
	movt	r1, #:upper16:.LC4	@,
	mov	r0, r3	@, _2
	bl	fopen		@
	str	r0, [fp, #-16]	@, f
@ main.c:138:     if ((f = fopen(argv[1], "r")) == NULL)
	ldr	r3, [fp, #-16]	@ tmp145, f
	cmp	r3, #0	@ tmp145,
	bne	.L33		@,
@ main.c:140:         printf("Bad file name.\n");
	movw	r0, #:lower16:.LC5	@,
	movt	r0, #:upper16:.LC5	@,
	bl	puts		@
@ main.c:141:         exit(1);
	mov	r0, #1	@,
	bl	exit		@
.L33:
@ main.c:144:     for (jj = 0; jj < ORDER; jj++)
	mov	r3, #0	@ tmp147,
	strh	r3, [fp, #-8]	@ movhi	@ tmp146, jj
@ main.c:144:     for (jj = 0; jj < ORDER; jj++)
	b	.L34		@
.L38:
@ main.c:145:         for (ii = 0; ii < ORDER; ii++)
	mov	r3, #0	@ tmp149,
	strh	r3, [fp, #-6]	@ movhi	@ tmp148, ii
@ main.c:145:         for (ii = 0; ii < ORDER; ii++)
	b	.L35		@
.L37:
@ main.c:146:             if (fscanf(f, "%lli", &m[jj][ii]) != 1)
	ldrsh	r1, [fp, #-8]	@ _3, jj
	ldrsh	r0, [fp, #-6]	@ _4, ii
@ main.c:146:             if (fscanf(f, "%lli", &m[jj][ii]) != 1)
	sub	r2, fp, #79872	@ tmp150,,
	sub	r2, r2, #4	@ tmp150, tmp150,
	sub	r2, r2, #168	@ tmp150, tmp150,
	mov	r3, r1	@ tmp151, _3
	lsl	r3, r3, #2	@ tmp151, tmp151,
	add	r3, r3, r1	@ tmp151, tmp151, _3
	lsl	r1, r3, #2	@ tmp152, tmp151,
	add	r3, r3, r1	@ tmp151, tmp151, tmp152
	lsl	r3, r3, #2	@ tmp153, tmp151,
	add	r3, r3, r0	@ tmp154, tmp151, _4
	lsl	r3, r3, #3	@ tmp155, tmp154,
	add	r3, r2, r3	@ _5, tmp150, tmp155
	mov	r2, r3	@, _5
	movw	r1, #:lower16:.LC6	@,
	movt	r1, #:upper16:.LC6	@,
	ldr	r0, [fp, #-16]	@, f
	bl	__isoc99_fscanf		@
	mov	r3, r0	@ _6,
@ main.c:146:             if (fscanf(f, "%lli", &m[jj][ii]) != 1)
	cmp	r3, #1	@ _6,
	beq	.L36		@,
@ main.c:148:                 printf("Check file or ORDER constant.\n");
	movw	r0, #:lower16:.LC7	@,
	movt	r0, #:upper16:.LC7	@,
	bl	puts		@
@ main.c:149:                 exit(1);
	mov	r0, #1	@,
	bl	exit		@
.L36:
@ main.c:145:         for (ii = 0; ii < ORDER; ii++)
	ldrsh	r3, [fp, #-6]	@ ii.13_7, ii
	uxth	r3, r3	@ ii.14_8, ii.13_7
	add	r3, r3, #1	@ tmp156, ii.14_8,
	uxth	r3, r3	@ _9, tmp156
	strh	r3, [fp, #-6]	@ movhi	@ _9, ii
.L35:
@ main.c:145:         for (ii = 0; ii < ORDER; ii++)
	ldrsh	r3, [fp, #-6]	@ tmp157, ii
	cmp	r3, #99	@ tmp157,
	ble	.L37		@,
@ main.c:144:     for (jj = 0; jj < ORDER; jj++)
	ldrsh	r3, [fp, #-8]	@ jj.15_10, jj
	uxth	r3, r3	@ jj.16_11, jj.15_10
	add	r3, r3, #1	@ tmp158, jj.16_11,
	uxth	r3, r3	@ _12, tmp158
	strh	r3, [fp, #-8]	@ movhi	@ _12, jj
.L34:
@ main.c:144:     for (jj = 0; jj < ORDER; jj++)
	ldrsh	r3, [fp, #-8]	@ tmp159, jj
	cmp	r3, #99	@ tmp159,
	ble	.L38		@,
@ main.c:152:     fclose(f);
	ldr	r0, [fp, #-16]	@, f
	bl	fclose		@
@ main.c:154:     gaussJordan(m, augmented);
	sub	r2, fp, #159744	@ tmp160,,
	sub	r2, r2, #4	@ tmp160, tmp160,
	sub	r2, r2, #296	@ tmp160, tmp160,
	sub	r3, fp, #79872	@ tmp161,,
	sub	r3, r3, #4	@ tmp161, tmp161,
	sub	r3, r3, #168	@ tmp161, tmp161,
	mov	r1, r2	@, tmp160
	mov	r0, r3	@, tmp161
	bl	gaussJordan		@
@ main.c:156:     clock_t alg_end = clock();
	bl	clock		@
	str	r0, [fp, #-20]	@, alg_end
@ main.c:158:     printMatrix(augmented);
	sub	r3, fp, #159744	@ tmp162,,
	sub	r3, r3, #4	@ tmp162, tmp162,
	sub	r3, r3, #296	@ tmp162, tmp162,
	mov	r0, r3	@, tmp162
	bl	printMatrix		@
@ main.c:160:     clock_t end = clock();
	bl	clock		@
	str	r0, [fp, #-24]	@, end
@ main.c:161:     double alg_time = ((double)(alg_end - start)) * 1000 / CLOCKS_PER_SEC;
	ldr	r2, [fp, #-20]	@ tmp163, alg_end
	ldr	r3, [fp, #-12]	@ tmp164, start
	sub	r3, r2, r3	@ _13, tmp163, tmp164
@ main.c:161:     double alg_time = ((double)(alg_end - start)) * 1000 / CLOCKS_PER_SEC;
	vmov	s15, r3	@ int	@ _13, _13
	vcvt.f64.s32	d7, s15	@ _14, _13
@ main.c:161:     double alg_time = ((double)(alg_end - start)) * 1000 / CLOCKS_PER_SEC;
	vldr.64	d6, .L40	@ tmp165,
	vmul.f64	d6, d7, d6	@ _15, _14, tmp165
@ main.c:161:     double alg_time = ((double)(alg_end - start)) * 1000 / CLOCKS_PER_SEC;
	vldr.64	d5, .L40+8	@ tmp167,
	vdiv.f64	d7, d6, d5	@ tmp166, _15, tmp167
	vstr.64	d7, [fp, #-36]	@ tmp166, alg_time
@ main.c:162:     double total_time = ((double)(end - start)) * 1000 / CLOCKS_PER_SEC;
	ldr	r2, [fp, #-24]	@ tmp168, end
	ldr	r3, [fp, #-12]	@ tmp169, start
	sub	r3, r2, r3	@ _16, tmp168, tmp169
@ main.c:162:     double total_time = ((double)(end - start)) * 1000 / CLOCKS_PER_SEC;
	vmov	s15, r3	@ int	@ _16, _16
	vcvt.f64.s32	d7, s15	@ _17, _16
@ main.c:162:     double total_time = ((double)(end - start)) * 1000 / CLOCKS_PER_SEC;
	vldr.64	d6, .L40	@ tmp170,
	vmul.f64	d6, d7, d6	@ _18, _17, tmp170
@ main.c:162:     double total_time = ((double)(end - start)) * 1000 / CLOCKS_PER_SEC;
	vldr.64	d5, .L40+8	@ tmp172,
	vdiv.f64	d7, d6, d5	@ tmp171, _18, tmp172
	vstr.64	d7, [fp, #-44]	@ tmp171, total_time
@ main.c:163:     printf("Time to run algorithm: %fms\nTime to run full program: %fms\n", alg_time, total_time);
	ldrd	r2, [fp, #-44]	@ tmp173,,
	strd	r2, [sp]	@ tmp173,
	ldrd	r2, [fp, #-36]	@,,
	movw	r0, #:lower16:.LC8	@,
	movt	r0, #:upper16:.LC8	@,
	bl	printf		@
@ main.c:165:     return (0);
	mov	r3, #0	@ _52,
@ main.c:166: };
	mov	r0, r3	@, <retval>
	sub	sp, fp, #4	@,,
	@ sp needed	@
	pop	{fp, pc}	@
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
