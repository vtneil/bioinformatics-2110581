
uut7:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100003150 <_impl_nw_generate_1.omp_outlined>:
100003150: ff c3 01 d1 	sub	sp, sp, #112
100003154: f8 5f 03 a9 	stp	x24, x23, [sp, #48]
100003158: f6 57 04 a9 	stp	x22, x21, [sp, #64]
10000315c: f4 4f 05 a9 	stp	x20, x19, [sp, #80]
100003160: fd 7b 06 a9 	stp	x29, x30, [sp, #96]
100003164: fd 83 01 91 	add	x29, sp, #96
100003168: f5 03 05 aa 	mov	x21, x5
10000316c: f3 03 04 aa 	mov	x19, x4
100003170: f4 03 00 aa 	mov	x20, x0
100003174: 48 00 40 f9 	ldr	x8, [x2]
100003178: 18 09 00 f1 	subs	x24, x8, #2
10000317c: 03 0c 00 54 	b.lo	0x1000032fc <_impl_nw_generate_1.omp_outlined+0x1ac>
100003180: f7 03 03 aa 	mov	x23, x3
100003184: f8 7f 02 a9 	stp	x24, xzr, [sp, #32]
100003188: 28 00 80 52 	mov	w8, #1
10000318c: e8 0f 00 f9 	str	x8, [sp, #24]
100003190: ff 17 00 b9 	str	wzr, [sp, #20]
100003194: 96 02 40 b9 	ldr	w22, [x20]
100003198: e8 03 00 f9 	str	x8, [sp]
10000319c: 00 00 00 b0 	adrp	x0, 0x100004000 <_impl_nw_generate_1.omp_outlined+0x50>
1000031a0: 00 80 01 91 	add	x0, x0, #96
1000031a4: e3 53 00 91 	add	x3, sp, #20
1000031a8: e4 a3 00 91 	add	x4, sp, #40
1000031ac: e5 83 00 91 	add	x5, sp, #32
1000031b0: e6 63 00 91 	add	x6, sp, #24
1000031b4: e1 03 16 aa 	mov	x1, x22
1000031b8: 42 04 80 52 	mov	w2, #34
1000031bc: 27 00 80 52 	mov	w7, #1
1000031c0: 3e 03 00 94 	bl	0x100003eb8 <_strtod+0x100003eb8>
1000031c4: e8 27 42 a9 	ldp	x8, x9, [sp, #32]
1000031c8: 1f 01 18 eb 	cmp	x8, x24
1000031cc: 08 31 98 9a 	csel	x8, x8, x24, lo
1000031d0: e8 13 00 f9 	str	x8, [sp, #32]
1000031d4: 3f 01 08 eb 	cmp	x9, x8
1000031d8: a8 08 00 54 	b.hi	0x1000032ec <_impl_nw_generate_1.omp_outlined+0x19c>
1000031dc: 6a 02 40 f9 	ldr	x10, [x19]
1000031e0: 0b 01 09 cb 	sub	x11, x8, x9
1000031e4: 6b 05 00 91 	add	x11, x11, #1
1000031e8: 7f 29 00 f1 	cmp	x11, #10
1000031ec: e0 2a 41 fa 	ccmp	x23, #1, #0, hs
1000031f0: 21 06 00 54 	b.ne	0x1000032b4 <_impl_nw_generate_1.omp_outlined+0x164>
1000031f4: 4c 0d 09 8b 	add	x12, x10, x9, lsl #3
1000031f8: 8c 21 00 91 	add	x12, x12, #8
1000031fc: 2d 00 00 b0 	adrp	x13, 0x100008000 <_impl_nw_generate_1.omp_outlined+0xc0>
100003200: ad 81 00 91 	add	x13, x13, #32
100003204: 9f 01 0d eb 	cmp	x12, x13
100003208: e2 00 00 54 	b.hs	0x100003224 <_impl_nw_generate_1.omp_outlined+0xd4>
10000320c: 4c 0d 08 8b 	add	x12, x10, x8, lsl #3
100003210: 8c 41 00 91 	add	x12, x12, #16
100003214: 2d 00 00 b0 	adrp	x13, 0x100008000 <_impl_nw_generate_1.omp_outlined+0xd8>
100003218: ad 61 00 91 	add	x13, x13, #24
10000321c: 9f 01 0d eb 	cmp	x12, x13
100003220: a8 04 00 54 	b.hi	0x1000032b4 <_impl_nw_generate_1.omp_outlined+0x164>
100003224: 6c f1 7d 92 	and	x12, x11, #0xfffffffffffffff8
100003228: 2d 00 00 b0 	adrp	x13, 0x100008000 <_impl_nw_generate_1.omp_outlined+0xec>
10000322c: a0 0d 40 fd 	ldr	d0, [x13, #24]
100003230: 0d 00 00 90 	adrp	x13, 0x100003000 <_impl_nw_generate_1.omp_outlined+0xe0>
100003234: a1 cd c3 3d 	ldr	q1, [x13, #3888]
100003238: 0d 00 00 90 	adrp	x13, 0x100003000 <_impl_nw_generate_1.omp_outlined+0xe8>
10000323c: a2 d1 c3 3d 	ldr	q2, [x13, #3904]
100003240: 0d 00 00 90 	adrp	x13, 0x100003000 <_impl_nw_generate_1.omp_outlined+0xf0>
100003244: a3 d5 c3 3d 	ldr	q3, [x13, #3920]
100003248: ed 03 09 aa 	mov	x13, x9
10000324c: ee 03 0c aa 	mov	x14, x12
100003250: 0f 00 00 90 	adrp	x15, 0x100003000 <_impl_nw_generate_1.omp_outlined+0x100>
100003254: e4 d9 c3 3d 	ldr	q4, [x15, #3936]
100003258: a5 0d 08 4e 	dup.2d	v5, x13
10000325c: a6 84 e1 4e 	add.2d	v6, v5, v1
100003260: a7 84 e2 4e 	add.2d	v7, v5, v2
100003264: b0 84 e3 4e 	add.2d	v16, v5, v3
100003268: a5 84 e4 4e 	add.2d	v5, v5, v4
10000326c: d1 d8 61 6e 	ucvtf.2d	v17, v6
100003270: e7 d8 61 6e 	ucvtf.2d	v7, v7
100003274: 10 da 61 6e 	ucvtf.2d	v16, v16
100003278: a5 d8 61 6e 	ucvtf.2d	v5, v5
10000327c: 31 92 c0 4f 	fmul.2d	v17, v17, v0[0]
100003280: e7 90 c0 4f 	fmul.2d	v7, v7, v0[0]
100003284: 10 92 c0 4f 	fmul.2d	v16, v16, v0[0]
100003288: cf 00 66 9e 	fmov	x15, d6
10000328c: 4f 0d 0f 8b 	add	x15, x10, x15, lsl #3
100003290: f1 1d 00 ad 	stp	q17, q7, [x15]
100003294: a5 90 c0 4f 	fmul.2d	v5, v5, v0[0]
100003298: f0 15 01 ad 	stp	q16, q5, [x15, #32]
10000329c: ad 21 00 91 	add	x13, x13, #8
1000032a0: ce 21 00 f1 	subs	x14, x14, #8
1000032a4: a1 fd ff 54 	b.ne	0x100003258 <_impl_nw_generate_1.omp_outlined+0x108>
1000032a8: 7f 01 0c eb 	cmp	x11, x12
1000032ac: 00 02 00 54 	b.eq	0x1000032ec <_impl_nw_generate_1.omp_outlined+0x19c>
1000032b0: 29 01 0c 8b 	add	x9, x9, x12
1000032b4: 2b 05 00 d1 	sub	x11, x9, #1
1000032b8: e9 5e 09 9b 	madd	x9, x23, x9, x23
1000032bc: 49 0d 09 8b 	add	x9, x10, x9, lsl #3
1000032c0: ea f2 7d d3 	lsl	x10, x23, #3
1000032c4: 2c 00 00 b0 	adrp	x12, 0x100008000 <_impl_nw_generate_1.omp_outlined+0x188>
1000032c8: 6d 09 00 91 	add	x13, x11, #2
1000032cc: a0 01 63 9e 	ucvtf	d0, x13
1000032d0: 81 0d 40 fd 	ldr	d1, [x12, #24]
1000032d4: 20 08 60 1e 	fmul	d0, d1, d0
1000032d8: 20 01 00 fd 	str	d0, [x9]
1000032dc: 6b 05 00 91 	add	x11, x11, #1
1000032e0: 29 01 0a 8b 	add	x9, x9, x10
1000032e4: 1f 01 0b eb 	cmp	x8, x11
1000032e8: 01 ff ff 54 	b.ne	0x1000032c8 <_impl_nw_generate_1.omp_outlined+0x178>
1000032ec: 00 00 00 b0 	adrp	x0, 0x100004000 <_impl_nw_generate_1.omp_outlined+0x1a0>
1000032f0: 00 80 01 91 	add	x0, x0, #96
1000032f4: e1 03 16 aa 	mov	x1, x22
1000032f8: ea 02 00 94 	bl	0x100003ea0 <_strtod+0x100003ea0>
1000032fc: a8 02 40 f9 	ldr	x8, [x21]
100003300: 15 09 00 f1 	subs	x21, x8, #2
100003304: 63 0b 00 54 	b.lo	0x100003470 <_impl_nw_generate_1.omp_outlined+0x320>
100003308: f5 7f 02 a9 	stp	x21, xzr, [sp, #32]
10000330c: 28 00 80 52 	mov	w8, #1
100003310: e8 0f 00 f9 	str	x8, [sp, #24]
100003314: ff 17 00 b9 	str	wzr, [sp, #20]
100003318: 94 02 40 b9 	ldr	w20, [x20]
10000331c: e8 03 00 f9 	str	x8, [sp]
100003320: 00 00 00 b0 	adrp	x0, 0x100004000 <_impl_nw_generate_1.omp_outlined+0x1d4>
100003324: 00 80 01 91 	add	x0, x0, #96
100003328: e3 53 00 91 	add	x3, sp, #20
10000332c: e4 a3 00 91 	add	x4, sp, #40
100003330: e5 83 00 91 	add	x5, sp, #32
100003334: e6 63 00 91 	add	x6, sp, #24
100003338: e1 03 14 aa 	mov	x1, x20
10000333c: 42 04 80 52 	mov	w2, #34
100003340: 27 00 80 52 	mov	w7, #1
100003344: dd 02 00 94 	bl	0x100003eb8 <_strtod+0x100003eb8>
100003348: e8 13 40 f9 	ldr	x8, [sp, #32]
10000334c: 1f 01 15 eb 	cmp	x8, x21
100003350: 0a 31 95 9a 	csel	x10, x8, x21, lo
100003354: ea 13 00 f9 	str	x10, [sp, #32]
100003358: e8 17 40 f9 	ldr	x8, [sp, #40]
10000335c: 1f 01 0a eb 	cmp	x8, x10
100003360: 08 08 00 54 	b.hi	0x100003460 <_impl_nw_generate_1.omp_outlined+0x310>
100003364: 6b 02 40 f9 	ldr	x11, [x19]
100003368: 49 01 08 cb 	sub	x9, x10, x8
10000336c: 2c 05 00 91 	add	x12, x9, #1
100003370: 29 00 00 b0 	adrp	x9, 0x100008000 <_impl_nw_generate_1.omp_outlined+0x234>
100003374: 9f 21 00 f1 	cmp	x12, #8
100003378: 03 06 00 54 	b.lo	0x100003438 <_impl_nw_generate_1.omp_outlined+0x2e8>
10000337c: 6d 0d 08 8b 	add	x13, x11, x8, lsl #3
100003380: ad 21 00 91 	add	x13, x13, #8
100003384: 2e 00 00 b0 	adrp	x14, 0x100008000 <_impl_nw_generate_1.omp_outlined+0x248>
100003388: ce 81 00 91 	add	x14, x14, #32
10000338c: bf 01 0e eb 	cmp	x13, x14
100003390: e2 00 00 54 	b.hs	0x1000033ac <_impl_nw_generate_1.omp_outlined+0x25c>
100003394: 6d 0d 0a 8b 	add	x13, x11, x10, lsl #3
100003398: ad 41 00 91 	add	x13, x13, #16
10000339c: 2e 00 00 b0 	adrp	x14, 0x100008000 <_impl_nw_generate_1.omp_outlined+0x260>
1000033a0: ce 61 00 91 	add	x14, x14, #24
1000033a4: bf 01 0e eb 	cmp	x13, x14
1000033a8: 88 04 00 54 	b.hi	0x100003438 <_impl_nw_generate_1.omp_outlined+0x2e8>
1000033ac: 8d f1 7d 92 	and	x13, x12, #0xfffffffffffffff8
1000033b0: 20 0d 40 fd 	ldr	d0, [x9, #24]
1000033b4: 0e 00 00 90 	adrp	x14, 0x100003000 <_impl_nw_generate_1.omp_outlined+0x264>
1000033b8: c1 cd c3 3d 	ldr	q1, [x14, #3888]
1000033bc: 0e 00 00 90 	adrp	x14, 0x100003000 <_impl_nw_generate_1.omp_outlined+0x26c>
1000033c0: c2 d1 c3 3d 	ldr	q2, [x14, #3904]
1000033c4: 0e 00 00 90 	adrp	x14, 0x100003000 <_impl_nw_generate_1.omp_outlined+0x274>
1000033c8: c3 d5 c3 3d 	ldr	q3, [x14, #3920]
1000033cc: ee 03 08 aa 	mov	x14, x8
1000033d0: ef 03 0d aa 	mov	x15, x13
1000033d4: 10 00 00 90 	adrp	x16, 0x100003000 <_impl_nw_generate_1.omp_outlined+0x284>
1000033d8: 04 da c3 3d 	ldr	q4, [x16, #3936]
1000033dc: c5 0d 08 4e 	dup.2d	v5, x14
1000033e0: a6 84 e1 4e 	add.2d	v6, v5, v1
1000033e4: a7 84 e2 4e 	add.2d	v7, v5, v2
1000033e8: b0 84 e3 4e 	add.2d	v16, v5, v3
1000033ec: a5 84 e4 4e 	add.2d	v5, v5, v4
1000033f0: d1 d8 61 6e 	ucvtf.2d	v17, v6
1000033f4: e7 d8 61 6e 	ucvtf.2d	v7, v7
1000033f8: 10 da 61 6e 	ucvtf.2d	v16, v16
1000033fc: a5 d8 61 6e 	ucvtf.2d	v5, v5
100003400: 31 92 c0 4f 	fmul.2d	v17, v17, v0[0]
100003404: e7 90 c0 4f 	fmul.2d	v7, v7, v0[0]
100003408: 10 92 c0 4f 	fmul.2d	v16, v16, v0[0]
10000340c: d0 00 66 9e 	fmov	x16, d6
100003410: 70 0d 10 8b 	add	x16, x11, x16, lsl #3
100003414: 11 1e 00 ad 	stp	q17, q7, [x16]
100003418: a5 90 c0 4f 	fmul.2d	v5, v5, v0[0]
10000341c: 10 16 01 ad 	stp	q16, q5, [x16, #32]
100003420: ce 21 00 91 	add	x14, x14, #8
100003424: ef 21 00 f1 	subs	x15, x15, #8
100003428: a1 fd ff 54 	b.ne	0x1000033dc <_impl_nw_generate_1.omp_outlined+0x28c>
10000342c: 9f 01 0d eb 	cmp	x12, x13
100003430: 80 01 00 54 	b.eq	0x100003460 <_impl_nw_generate_1.omp_outlined+0x310>
100003434: 08 01 0d 8b 	add	x8, x8, x13
100003438: 4a 05 00 91 	add	x10, x10, #1
10000343c: 6b 21 00 91 	add	x11, x11, #8
100003440: 0c 05 00 91 	add	x12, x8, #1
100003444: 80 01 63 9e 	ucvtf	d0, x12
100003448: 21 0d 40 fd 	ldr	d1, [x9, #24]
10000344c: 20 08 60 1e 	fmul	d0, d1, d0
100003450: 60 79 28 fc 	str	d0, [x11, x8, lsl #3]
100003454: e8 03 0c aa 	mov	x8, x12
100003458: 5f 01 0c eb 	cmp	x10, x12
10000345c: 21 ff ff 54 	b.ne	0x100003440 <_impl_nw_generate_1.omp_outlined+0x2f0>
100003460: 00 00 00 b0 	adrp	x0, 0x100004000 <_impl_nw_generate_1.omp_outlined+0x314>
100003464: 00 80 01 91 	add	x0, x0, #96
100003468: e1 03 14 aa 	mov	x1, x20
10000346c: 8d 02 00 94 	bl	0x100003ea0 <_strtod+0x100003ea0>
100003470: fd 7b 46 a9 	ldp	x29, x30, [sp, #96]
100003474: f4 4f 45 a9 	ldp	x20, x19, [sp, #80]
100003478: f6 57 44 a9 	ldp	x22, x21, [sp, #64]
10000347c: f8 5f 43 a9 	ldp	x24, x23, [sp, #48]
100003480: ff c3 01 91 	add	sp, sp, #112
100003484: c0 03 5f d6 	ret

0000000100003488 <_impl_nw_generate_1_block_recur>:
100003488: ff 03 02 d1 	sub	sp, sp, #128
10000348c: fd 7b 07 a9 	stp	x29, x30, [sp, #112]
100003490: fd c3 01 91 	add	x29, sp, #112
100003494: a0 83 1f f8 	stur	x0, [x29, #-8]
100003498: 0a b4 42 a9 	ldp	x10, x13, [x0, #40]
10000349c: 09 a0 41 a9 	ldp	x9, x8, [x0, #24]
1000034a0: 4c 01 09 cb 	sub	x12, x10, x9
1000034a4: ab 01 08 cb 	sub	x11, x13, x8
1000034a8: 6e 7d 0c 9b 	mul	x14, x11, x12
1000034ac: df 11 40 f1 	cmp	x14, #4, lsl #12        ; =16384
1000034b0: 83 04 00 54 	b.lo	0x100003540 <_impl_nw_generate_1_block_recur+0xb8>
1000034b4: 8a fd 41 d3 	lsr	x10, x12, #1
1000034b8: 6b fd 41 d3 	lsr	x11, x11, #1
1000034bc: ab ab 3e a9 	stp	x11, x10, [x29, #-24]
1000034c0: 0c 00 40 f9 	ldr	x12, [x0]
1000034c4: ec 13 00 f9 	str	x12, [sp, #32]
1000034c8: 00 80 c0 3c 	ldur	q0, [x0, #8]
1000034cc: e0 83 82 3c 	stur	q0, [sp, #40]
1000034d0: e9 a3 03 a9 	stp	x9, x8, [sp, #56]
1000034d4: 49 01 09 8b 	add	x9, x10, x9
1000034d8: 68 01 08 8b 	add	x8, x11, x8
1000034dc: e9 a3 04 a9 	stp	x9, x8, [sp, #72]
1000034e0: e0 83 00 91 	add	x0, sp, #32
1000034e4: e9 ff ff 97 	bl	0x100003488 <_impl_nw_generate_1_block_recur>
1000034e8: a8 43 00 d1 	sub	x8, x29, #16
1000034ec: e8 0b 00 f9 	str	x8, [sp, #16]
1000034f0: a8 63 00 d1 	sub	x8, x29, #24
1000034f4: a9 23 00 d1 	sub	x9, x29, #8
1000034f8: 00 00 00 b0 	adrp	x0, 0x100004000 <_impl_nw_generate_1_block_recur+0x74>
1000034fc: 00 e0 01 91 	add	x0, x0, #120
100003500: e9 23 00 a9 	stp	x9, x8, [sp]
100003504: 02 00 00 90 	adrp	x2, 0x100003000 <_impl_nw_generate_1_block_recur+0x7c>
100003508: 42 30 19 91 	add	x2, x2, #1612
10000350c: 61 00 80 52 	mov	w1, #3
100003510: 6d 02 00 94 	bl	0x100003ec4 <_strtod+0x100003ec4>
100003514: a9 23 7f a9 	ldp	x9, x8, [x29, #-16]
100003518: 0a ad 41 a9 	ldp	x10, x11, [x8, #24]
10000351c: 29 01 0a 8b 	add	x9, x9, x10
100003520: aa 83 5e f8 	ldur	x10, [x29, #-24]
100003524: 4a 01 0b 8b 	add	x10, x10, x11
100003528: e9 ab 03 a9 	stp	x9, x10, [sp, #56]
10000352c: 00 81 c2 3c 	ldur	q0, [x8, #40]
100003530: e0 83 84 3c 	stur	q0, [sp, #72]
100003534: e0 83 00 91 	add	x0, sp, #32
100003538: d4 ff ff 97 	bl	0x100003488 <_impl_nw_generate_1_block_recur>
10000353c: 04 00 00 14 	b	0x10000354c <_impl_nw_generate_1_block_recur+0xc4>
100003540: 5f 01 09 eb 	cmp	x10, x9
100003544: a0 81 48 fa 	ccmp	x13, x8, #0, hi
100003548: 88 00 00 54 	b.hi	0x100003558 <_impl_nw_generate_1_block_recur+0xd0>
10000354c: fd 7b 47 a9 	ldp	x29, x30, [sp, #112]
100003550: ff 03 02 91 	add	sp, sp, #128
100003554: c0 03 5f d6 	ret
100003558: 10 08 40 f9 	ldr	x16, [x0, #16]
10000355c: 0b 00 40 f9 	ldr	x11, [x0]
100003560: 71 01 40 f9 	ldr	x17, [x11]
100003564: 2b 00 00 b0 	adrp	x11, 0x100008000 <_impl_nw_generate_1_block_recur+0xf0>
100003568: 6b 11 40 f9 	ldr	x11, [x11, #32]
10000356c: 2c 00 00 b0 	adrp	x12, 0x100008000 <_impl_nw_generate_1_block_recur+0xf8>
100003570: 8c 19 40 f9 	ldr	x12, [x12, #48]
100003574: 2e 00 00 b0 	adrp	x14, 0x100008000 <_impl_nw_generate_1_block_recur+0x100>
100003578: c0 05 40 fd 	ldr	d0, [x14, #8]
10000357c: 2e 00 00 b0 	adrp	x14, 0x100008000 <_impl_nw_generate_1_block_recur+0x108>
100003580: c1 09 40 fd 	ldr	d1, [x14, #16]
100003584: 8c 05 00 d1 	sub	x12, x12, #1
100003588: 0d 01 0d cb 	sub	x13, x8, x13
10000358c: 2e 05 00 d1 	sub	x14, x9, #1
100003590: 0e 7e 0e 9b 	mul	x14, x16, x14
100003594: 00 f1 7d d3 	lsl	x0, x8, #3
100003598: 0e 0c 0e 8b 	add	x14, x0, x14, lsl #3
10000359c: 2e 02 0e 8b 	add	x14, x17, x14
1000035a0: 0f f2 7d d3 	lsl	x15, x16, #3
1000035a4: 30 7d 10 9b 	mul	x16, x9, x16
1000035a8: 10 0c 10 8b 	add	x16, x0, x16, lsl #3
1000035ac: 30 02 10 8b 	add	x16, x17, x16
1000035b0: 31 00 00 b0 	adrp	x17, 0x100008000 <_impl_nw_generate_1_block_recur+0x13c>
1000035b4: 06 00 00 14 	b	0x1000035cc <_impl_nw_generate_1_block_recur+0x144>
1000035b8: 29 05 00 91 	add	x9, x9, #1
1000035bc: ce 01 0f 8b 	add	x14, x14, x15
1000035c0: 10 02 0f 8b 	add	x16, x16, x15
1000035c4: 3f 01 0a eb 	cmp	x9, x10
1000035c8: 20 fc ff 54 	b.eq	0x10000354c <_impl_nw_generate_1_block_recur+0xc4>
1000035cc: 69 ff ff b4 	cbz	x9, 0x1000035b8 <_impl_nw_generate_1_block_recur+0x130>
1000035d0: 00 00 80 d2 	mov	x0, #0
1000035d4: 21 05 00 d1 	sub	x1, x9, #1
1000035d8: e2 03 10 aa 	mov	x2, x16
1000035dc: e3 03 0e aa 	mov	x3, x14
1000035e0: e4 03 0c aa 	mov	x4, x12
1000035e4: 07 00 00 14 	b	0x100003600 <_impl_nw_generate_1_block_recur+0x178>
1000035e8: 00 04 00 91 	add	x0, x0, #1
1000035ec: 84 04 00 91 	add	x4, x4, #1
1000035f0: 63 20 00 91 	add	x3, x3, #8
1000035f4: 42 20 00 91 	add	x2, x2, #8
1000035f8: bf 01 00 ab 	cmn	x13, x0
1000035fc: e0 fd ff 54 	b.eq	0x1000035b8 <_impl_nw_generate_1_block_recur+0x130>
100003600: 1f 01 00 ab 	cmn	x8, x0
100003604: 20 ff ff 54 	b.eq	0x1000035e8 <_impl_nw_generate_1_block_recur+0x160>
100003608: 62 80 5f fc 	ldur	d2, [x3, #-8]
10000360c: 65 69 61 38 	ldrb	w5, [x11, x1]
100003610: 86 68 68 38 	ldrb	w6, [x4, x8]
100003614: bf 00 06 6b 	cmp	w5, w6
100003618: 03 0c 61 1e 	fcsel	d3, d0, d1, eq
10000361c: 42 28 63 1e 	fadd	d2, d2, d3
100003620: 63 00 40 fd 	ldr	d3, [x3]
100003624: 24 0e 40 fd 	ldr	d4, [x17, #24]
100003628: 63 28 64 1e 	fadd	d3, d3, d4
10000362c: 45 80 5f fc 	ldur	d5, [x2, #-8]
100003630: 84 28 65 1e 	fadd	d4, d4, d5
100003634: 60 20 64 1e 	fcmp	d3, d4
100003638: 63 cc 64 1e 	fcsel	d3, d3, d4, gt
10000363c: 40 20 63 1e 	fcmp	d2, d3
100003640: 42 cc 63 1e 	fcsel	d2, d2, d3, gt
100003644: 42 00 00 fd 	str	d2, [x2]
100003648: e8 ff ff 17 	b	0x1000035e8 <_impl_nw_generate_1_block_recur+0x160>

000000010000364c <_impl_nw_generate_1_block_recur.omp_outlined>:
10000364c: ff 43 02 d1 	sub	sp, sp, #144
100003650: f8 5f 05 a9 	stp	x24, x23, [sp, #80]
100003654: f6 57 06 a9 	stp	x22, x21, [sp, #96]
100003658: f4 4f 07 a9 	stp	x20, x19, [sp, #112]
10000365c: fd 7b 08 a9 	stp	x29, x30, [sp, #128]
100003660: fd 03 02 91 	add	x29, sp, #128
100003664: f3 03 04 aa 	mov	x19, x4
100003668: f4 03 03 aa 	mov	x20, x3
10000366c: f5 03 02 aa 	mov	x21, x2
100003670: 28 00 80 52 	mov	w8, #1
100003674: a8 7f 39 29 	stp	w8, wzr, [x29, #-56]
100003678: a8 43 1c b8 	stur	w8, [x29, #-60]
10000367c: ff 43 00 b9 	str	wzr, [sp, #64]
100003680: 16 00 40 b9 	ldr	w22, [x0]
100003684: e8 03 00 b9 	str	w8, [sp]
100003688: 00 00 00 b0 	adrp	x0, 0x100004000 <_impl_nw_generate_1_block_recur.omp_outlined+0x40>
10000368c: 00 40 02 91 	add	x0, x0, #144
100003690: e3 03 01 91 	add	x3, sp, #64
100003694: a4 d3 00 d1 	sub	x4, x29, #52
100003698: a5 e3 00 d1 	sub	x5, x29, #56
10000369c: a6 f3 00 d1 	sub	x6, x29, #60
1000036a0: e1 03 16 aa 	mov	x1, x22
1000036a4: 42 04 80 52 	mov	w2, #34
1000036a8: 27 00 80 52 	mov	w7, #1
1000036ac: 00 02 00 94 	bl	0x100003eac <_strtod+0x100003eac>
1000036b0: a8 5f 79 29 	ldp	w8, w23, [x29, #-56]
1000036b4: 1f 05 00 71 	cmp	w8, #1
1000036b8: 08 b5 9f 1a 	csinc	w8, w8, wzr, lt
1000036bc: a8 83 1c b8 	stur	w8, [x29, #-56]
1000036c0: ff 02 08 6b 	cmp	w23, w8
1000036c4: 2d 04 00 54 	b.le	0x100003748 <_impl_nw_generate_1_block_recur.omp_outlined+0xfc>
1000036c8: 00 00 00 b0 	adrp	x0, 0x100004000 <_impl_nw_generate_1_block_recur.omp_outlined+0x80>
1000036cc: 00 40 02 91 	add	x0, x0, #144
1000036d0: e1 03 16 aa 	mov	x1, x22
1000036d4: f3 01 00 94 	bl	0x100003ea0 <_strtod+0x100003ea0>
1000036d8: fd 7b 48 a9 	ldp	x29, x30, [sp, #128]
1000036dc: f4 4f 47 a9 	ldp	x20, x19, [sp, #112]
1000036e0: f6 57 46 a9 	ldp	x22, x21, [sp, #96]
1000036e4: f8 5f 45 a9 	ldp	x24, x23, [sp, #80]
1000036e8: ff 43 02 91 	add	sp, sp, #144
1000036ec: c0 03 5f d6 	ret
1000036f0: a8 02 40 f9 	ldr	x8, [x21]
1000036f4: 09 01 40 f9 	ldr	x9, [x8]
1000036f8: e9 07 00 f9 	str	x9, [sp, #8]
1000036fc: 00 81 c0 3c 	ldur	q0, [x8, #8]
100003700: e0 03 81 3c 	stur	q0, [sp, #16]
100003704: 09 0d 40 f9 	ldr	x9, [x8, #24]
100003708: 6a 02 40 f9 	ldr	x10, [x19]
10000370c: 49 01 09 8b 	add	x9, x10, x9
100003710: e9 13 00 f9 	str	x9, [sp, #32]
100003714: 00 09 c0 3d 	ldr	q0, [x8, #32]
100003718: e0 83 82 3c 	stur	q0, [sp, #40]
10000371c: 08 11 40 f9 	ldr	x8, [x8, #32]
100003720: 89 02 40 f9 	ldr	x9, [x20]
100003724: 28 01 08 8b 	add	x8, x9, x8
100003728: e8 1f 00 f9 	str	x8, [sp, #56]
10000372c: e0 23 00 91 	add	x0, sp, #8
100003730: 56 ff ff 97 	bl	0x100003488 <_impl_nw_generate_1_block_recur>
100003734: e8 06 00 11 	add	w8, w23, #1
100003738: a9 83 5c b8 	ldur	w9, [x29, #-56]
10000373c: ff 02 09 6b 	cmp	w23, w9
100003740: f7 03 08 aa 	mov	x23, x8
100003744: 2a fc ff 54 	b.ge	0x1000036c8 <_impl_nw_generate_1_block_recur.omp_outlined+0x7c>
100003748: ff 06 00 71 	cmp	w23, #1
10000374c: 20 fd ff 54 	b.eq	0x1000036f0 <_impl_nw_generate_1_block_recur.omp_outlined+0xa4>
100003750: 37 ff ff 35 	cbnz	w23, 0x100003734 <_impl_nw_generate_1_block_recur.omp_outlined+0xe8>
100003754: a8 02 40 f9 	ldr	x8, [x21]
100003758: 09 01 40 f9 	ldr	x9, [x8]
10000375c: e9 07 00 f9 	str	x9, [sp, #8]
100003760: 09 a9 41 a9 	ldp	x9, x10, [x8, #24]
100003764: 8b 02 40 f9 	ldr	x11, [x20]
100003768: 6a 01 0a 8b 	add	x10, x11, x10
10000376c: 00 81 c0 3c 	ldur	q0, [x8, #8]
100003770: e0 03 81 3c 	stur	q0, [sp, #16]
100003774: e9 2b 02 a9 	stp	x9, x10, [sp, #32]
100003778: 09 0d 40 f9 	ldr	x9, [x8, #24]
10000377c: 6a 02 40 f9 	ldr	x10, [x19]
100003780: 49 01 09 8b 	add	x9, x10, x9
100003784: 08 19 40 f9 	ldr	x8, [x8, #48]
100003788: e9 1b 00 f9 	str	x9, [sp, #48]
10000378c: e7 ff ff 17 	b	0x100003728 <_impl_nw_generate_1_block_recur.omp_outlined+0xdc>

0000000100003790 <_nw_backtrack.omp_outlined>:
100003790: ff 83 01 d1 	sub	sp, sp, #96
100003794: f8 5f 02 a9 	stp	x24, x23, [sp, #32]
100003798: f6 57 03 a9 	stp	x22, x21, [sp, #48]
10000379c: f4 4f 04 a9 	stp	x20, x19, [sp, #64]
1000037a0: fd 7b 05 a9 	stp	x29, x30, [sp, #80]
1000037a4: fd 43 01 91 	add	x29, sp, #80
1000037a8: f3 03 06 aa 	mov	x19, x6
1000037ac: f4 03 05 aa 	mov	x20, x5
1000037b0: f5 03 04 aa 	mov	x21, x4
1000037b4: f6 03 03 aa 	mov	x22, x3
1000037b8: f7 03 02 aa 	mov	x23, x2
1000037bc: 28 00 80 52 	mov	w8, #1
1000037c0: e8 7f 03 29 	stp	w8, wzr, [sp, #24]
1000037c4: ff 23 02 29 	stp	wzr, w8, [sp, #16]
1000037c8: 18 00 40 b9 	ldr	w24, [x0]
1000037cc: e8 03 00 b9 	str	w8, [sp]
1000037d0: 00 00 00 b0 	adrp	x0, 0x100004000 <_nw_backtrack.omp_outlined+0x44>
1000037d4: 00 40 02 91 	add	x0, x0, #144
1000037d8: e3 43 00 91 	add	x3, sp, #16
1000037dc: e4 73 00 91 	add	x4, sp, #28
1000037e0: e5 63 00 91 	add	x5, sp, #24
1000037e4: e6 53 00 91 	add	x6, sp, #20
1000037e8: e1 03 18 aa 	mov	x1, x24
1000037ec: 42 04 80 52 	mov	w2, #34
1000037f0: 27 00 80 52 	mov	w7, #1
1000037f4: ae 01 00 94 	bl	0x100003eac <_strtod+0x100003eac>
1000037f8: e8 1b 40 b9 	ldr	w8, [sp, #24]
1000037fc: 1f 05 00 71 	cmp	w8, #1
100003800: 09 b5 9f 1a 	csinc	w9, w8, wzr, lt
100003804: e9 1b 00 b9 	str	w9, [sp, #24]
100003808: e8 1f 40 b9 	ldr	w8, [sp, #28]
10000380c: 1f 01 09 6b 	cmp	w8, w9
100003810: 0d 02 00 54 	b.le	0x100003850 <_nw_backtrack.omp_outlined+0xc0>
100003814: 00 00 00 b0 	adrp	x0, 0x100004000 <_nw_backtrack.omp_outlined+0x88>
100003818: 00 40 02 91 	add	x0, x0, #144
10000381c: e1 03 18 aa 	mov	x1, x24
100003820: a0 01 00 94 	bl	0x100003ea0 <_strtod+0x100003ea0>
100003824: fd 7b 45 a9 	ldp	x29, x30, [sp, #80]
100003828: f4 4f 44 a9 	ldp	x20, x19, [sp, #64]
10000382c: f6 57 43 a9 	ldp	x22, x21, [sp, #48]
100003830: f8 5f 42 a9 	ldp	x24, x23, [sp, #32]
100003834: ff 83 01 91 	add	sp, sp, #96
100003838: c0 03 5f d6 	ret
10000383c: 09 05 00 11 	add	w9, w8, #1
100003840: ea 1b 40 b9 	ldr	w10, [sp, #24]
100003844: 1f 01 0a 6b 	cmp	w8, w10
100003848: e8 03 09 aa 	mov	x8, x9
10000384c: 4a fe ff 54 	b.ge	0x100003814 <_nw_backtrack.omp_outlined+0x84>
100003850: 68 02 00 34 	cbz	w8, 0x10000389c <_nw_backtrack.omp_outlined+0x10c>
100003854: 1f 05 00 71 	cmp	w8, #1
100003858: 21 ff ff 54 	b.ne	0x10000383c <_nw_backtrack.omp_outlined+0xac>
10000385c: eb 02 40 f9 	ldr	x11, [x23]
100003860: eb fe ff b4 	cbz	x11, 0x10000383c <_nw_backtrack.omp_outlined+0xac>
100003864: 09 00 80 d2 	mov	x9, #0
100003868: 0a 00 80 92 	mov	x10, #-1
10000386c: 6c 02 40 f9 	ldr	x12, [x19]
100003870: 8b 01 0b 8b 	add	x11, x12, x11
100003874: 6b 69 6a 38 	ldrb	w11, [x11, x10]
100003878: 8c 02 40 f9 	ldr	x12, [x20]
10000387c: 8c 01 40 f9 	ldr	x12, [x12]
100003880: 8b 69 29 38 	strb	w11, [x12, x9]
100003884: 29 05 00 91 	add	x9, x9, #1
100003888: eb 02 40 f9 	ldr	x11, [x23]
10000388c: 4a 05 00 d1 	sub	x10, x10, #1
100003890: 3f 01 0b eb 	cmp	x9, x11
100003894: c3 fe ff 54 	b.lo	0x10000386c <_nw_backtrack.omp_outlined+0xdc>
100003898: e9 ff ff 17 	b	0x10000383c <_nw_backtrack.omp_outlined+0xac>
10000389c: eb 02 40 f9 	ldr	x11, [x23]
1000038a0: eb fc ff b4 	cbz	x11, 0x10000383c <_nw_backtrack.omp_outlined+0xac>
1000038a4: 09 00 80 d2 	mov	x9, #0
1000038a8: 0a 00 80 92 	mov	x10, #-1
1000038ac: ac 02 40 f9 	ldr	x12, [x21]
1000038b0: 8b 01 0b 8b 	add	x11, x12, x11
1000038b4: 6b 69 6a 38 	ldrb	w11, [x11, x10]
1000038b8: cc 02 40 f9 	ldr	x12, [x22]
1000038bc: 8c 01 40 f9 	ldr	x12, [x12]
1000038c0: 8b 69 29 38 	strb	w11, [x12, x9]
1000038c4: 29 05 00 91 	add	x9, x9, #1
1000038c8: eb 02 40 f9 	ldr	x11, [x23]
1000038cc: 4a 05 00 d1 	sub	x10, x10, #1
1000038d0: 3f 01 0b eb 	cmp	x9, x11
1000038d4: c3 fe ff 54 	b.lo	0x1000038ac <_nw_backtrack.omp_outlined+0x11c>
1000038d8: d9 ff ff 17 	b	0x10000383c <_nw_backtrack.omp_outlined+0xac>

00000001000038dc <_main>:
1000038dc: ff 43 04 d1 	sub	sp, sp, #272
1000038e0: e9 23 0a 6d 	stp	d9, d8, [sp, #160]
1000038e4: fc 6f 0b a9 	stp	x28, x27, [sp, #176]
1000038e8: fa 67 0c a9 	stp	x26, x25, [sp, #192]
1000038ec: f8 5f 0d a9 	stp	x24, x23, [sp, #208]
1000038f0: f6 57 0e a9 	stp	x22, x21, [sp, #224]
1000038f4: f4 4f 0f a9 	stp	x20, x19, [sp, #240]
1000038f8: fd 7b 10 a9 	stp	x29, x30, [sp, #256]
1000038fc: fd 03 04 91 	add	x29, sp, #256
100003900: 08 20 00 51 	sub	w8, w0, #8
100003904: 1f 09 00 31 	cmn	w8, #2
100003908: 62 00 00 54 	b.hs	0x100003914 <_main+0x38>
10000390c: 20 00 80 52 	mov	w0, #1
100003910: 59 01 00 14 	b	0x100003e74 <_main+0x598>
100003914: f4 03 01 aa 	mov	x20, x1
100003918: f3 03 00 aa 	mov	x19, x0
10000391c: 20 54 42 a9 	ldp	x0, x21, [x1, #32]
100003920: 37 00 00 b0 	adrp	x23, 0x100008000 <_main+0x58>
100003924: e0 12 00 f9 	str	x0, [x23, #32]
100003928: 38 00 00 b0 	adrp	x24, 0x100008000 <_main+0x60>
10000392c: 15 1b 00 f9 	str	x21, [x24, #48]
100003930: 01 00 85 52 	mov	w1, #10240
100003934: 61 cd bd 72 	movk	w1, #61035, lsl #16
100003938: 78 01 00 94 	bl	0x100003f18 <_strtod+0x100003f18>
10000393c: f6 03 00 aa 	mov	x22, x0
100003940: 3a 00 00 b0 	adrp	x26, 0x100008000 <_main+0x78>
100003944: 40 17 00 f9 	str	x0, [x26, #40]
100003948: e0 03 15 aa 	mov	x0, x21
10000394c: 01 00 85 52 	mov	w1, #10240
100003950: 61 cd bd 72 	movk	w1, #61035, lsl #16
100003954: 71 01 00 94 	bl	0x100003f18 <_strtod+0x100003f18>
100003958: 3b 00 00 b0 	adrp	x27, 0x100008000 <_main+0x90>
10000395c: 60 1f 00 f9 	str	x0, [x27, #56]
100003960: df 0a 00 f1 	cmp	x22, #2
100003964: 00 28 42 fa 	ccmp	x0, #2, #0, hs
100003968: 62 00 00 54 	b.hs	0x100003974 <_main+0x98>
10000396c: 40 00 80 52 	mov	w0, #2
100003970: 41 01 00 14 	b	0x100003e74 <_main+0x598>
100003974: 20 00 80 52 	mov	w0, #1
100003978: 5f 01 00 94 	bl	0x100003ef4 <_strtod+0x100003ef4>
10000397c: 80 06 40 f9 	ldr	x0, [x20, #8]
100003980: 01 00 80 d2 	mov	x1, #0
100003984: 68 01 00 94 	bl	0x100003f24 <_strtod+0x100003f24>
100003988: 28 00 00 b0 	adrp	x8, 0x100008000 <_main+0xc0>
10000398c: 00 05 00 fd 	str	d0, [x8, #8]
100003990: 80 0a 40 f9 	ldr	x0, [x20, #16]
100003994: 01 00 80 d2 	mov	x1, #0
100003998: 63 01 00 94 	bl	0x100003f24 <_strtod+0x100003f24>
10000399c: 28 00 00 b0 	adrp	x8, 0x100008000 <_main+0xd4>
1000039a0: 00 09 00 fd 	str	d0, [x8, #16]
1000039a4: 80 0e 40 f9 	ldr	x0, [x20, #24]
1000039a8: 01 00 80 d2 	mov	x1, #0
1000039ac: 5e 01 00 94 	bl	0x100003f24 <_strtod+0x100003f24>
1000039b0: 39 00 00 b0 	adrp	x25, 0x100008000 <_main+0xe8>
1000039b4: 20 0f 00 fd 	str	d0, [x25, #24]
1000039b8: 29 00 00 b0 	adrp	x9, 0x100008000 <_main+0xf0>
1000039bc: 7f 1e 00 71 	cmp	w19, #7
1000039c0: 81 00 00 54 	b.ne	0x1000039d0 <_main+0xf4>
1000039c4: 88 1a 40 f9 	ldr	x8, [x20, #48]
1000039c8: 08 01 40 39 	ldrb	w8, [x8]
1000039cc: 28 01 00 39 	strb	w8, [x9]
1000039d0: 49 17 40 f9 	ldr	x9, [x26, #40]
1000039d4: 68 1f 40 f9 	ldr	x8, [x27, #56]
1000039d8: 3f 01 08 eb 	cmp	x9, x8
1000039dc: 02 01 00 54 	b.hs	0x1000039fc <_main+0x120>
1000039e0: 48 17 00 f9 	str	x8, [x26, #40]
1000039e4: 69 1f 00 f9 	str	x9, [x27, #56]
1000039e8: 8b 2a 42 a9 	ldp	x11, x10, [x20, #32]
1000039ec: ea 12 00 f9 	str	x10, [x23, #32]
1000039f0: 0b 1b 00 f9 	str	x11, [x24, #48]
1000039f4: ea 03 09 aa 	mov	x10, x9
1000039f8: 03 00 00 14 	b	0x100003a04 <_main+0x128>
1000039fc: ea 03 08 aa 	mov	x10, x8
100003a00: e8 03 09 aa 	mov	x8, x9
100003a04: ff 7f 03 a9 	stp	xzr, xzr, [sp, #48]
100003a08: 08 05 00 91 	add	x8, x8, #1
100003a0c: 54 05 00 91 	add	x20, x10, #1
100003a10: b4 a3 38 a9 	stp	x20, x8, [x29, #-120]
100003a14: 08 7d 14 9b 	mul	x8, x8, x20
100003a18: 01 f1 7d d3 	lsl	x1, x8, #3
100003a1c: 20 00 80 52 	mov	w0, #1
100003a20: 2c 01 00 94 	bl	0x100003ed0 <_strtod+0x100003ed0>
100003a24: a0 23 00 b4 	cbz	x0, 0x100003e98 <_main+0x5bc>
100003a28: 36 00 00 b0 	adrp	x22, 0x100008000 <_main+0x160>
100003a2c: d6 02 01 91 	add	x22, x22, #64
100003a30: c0 02 00 f9 	str	x0, [x22]
100003a34: 35 00 00 b0 	adrp	x21, 0x100008000 <_main+0x16c>
100003a38: e0 43 00 f9 	str	x0, [sp, #128]
100003a3c: a8 e3 01 d1 	sub	x8, x29, #120
100003a40: e9 03 02 91 	add	x9, sp, #128
100003a44: e9 23 01 a9 	stp	x9, x8, [sp, #16]
100003a48: a8 c3 01 d1 	sub	x8, x29, #112
100003a4c: 00 00 00 b0 	adrp	x0, 0x100004000 <_main+0x174>
100003a50: 00 e0 01 91 	add	x0, x0, #120
100003a54: e8 53 00 a9 	stp	x8, x20, [sp]
100003a58: 02 00 00 90 	adrp	x2, 0x100003000 <_main+0x17c>
100003a5c: 42 40 05 91 	add	x2, x2, #336
100003a60: 81 00 80 52 	mov	w1, #4
100003a64: 18 01 00 94 	bl	0x100003ec4 <_strtod+0x100003ec4>
100003a68: a9 a3 78 a9 	ldp	x9, x8, [x29, #-120]
100003a6c: f6 23 04 a9 	stp	x22, x8, [sp, #64]
100003a70: e9 7f 05 a9 	stp	x9, xzr, [sp, #80]
100003a74: ff 23 06 a9 	stp	xzr, x8, [sp, #96]
100003a78: e9 3b 00 f9 	str	x9, [sp, #112]
100003a7c: e0 03 01 91 	add	x0, sp, #64
100003a80: 82 fe ff 97 	bl	0x100003488 <_impl_nw_generate_1_block_recur>
100003a84: e8 e3 00 91 	add	x8, sp, #56
100003a88: e8 23 00 f9 	str	x8, [sp, #64]
100003a8c: e8 c3 00 91 	add	x8, sp, #48
100003a90: a8 03 19 f8 	stur	x8, [x29, #-112]
100003a94: 76 1f 40 f9 	ldr	x22, [x27, #56]
100003a98: db 06 00 91 	add	x27, x22, #1
100003a9c: bc 22 40 f9 	ldr	x28, [x21, #64]
100003aa0: 5a 17 40 f9 	ldr	x26, [x26, #40]
100003aa4: 74 03 1a 8b 	add	x20, x27, x26
100003aa8: e0 03 14 aa 	mov	x0, x20
100003aac: 21 00 80 52 	mov	w1, #1
100003ab0: 08 01 00 94 	bl	0x100003ed0 <_strtod+0x100003ed0>
100003ab4: 20 1f 00 b4 	cbz	x0, 0x100003e98 <_main+0x5bc>
100003ab8: a0 83 18 f8 	stur	x0, [x29, #-120]
100003abc: e0 03 14 aa 	mov	x0, x20
100003ac0: 21 00 80 52 	mov	w1, #1
100003ac4: 03 01 00 94 	bl	0x100003ed0 <_strtod+0x100003ed0>
100003ac8: 80 1e 00 b4 	cbz	x0, 0x100003e98 <_main+0x5bc>
100003acc: 08 00 80 d2 	mov	x8, #0
100003ad0: ff 83 07 a9 	stp	xzr, x0, [sp, #120]
100003ad4: 08 e4 00 2f 	movi	d8, #0000000000000000
100003ad8: 7a 08 00 b4 	cbz	x26, 0x100003be4 <_main+0x308>
100003adc: 56 08 00 b4 	cbz	x22, 0x100003be4 <_main+0x308>
100003ae0: 08 00 80 d2 	mov	x8, #0
100003ae4: 20 0f 40 fd 	ldr	d0, [x25, #24]
100003ae8: 29 00 00 b0 	adrp	x9, 0x100008000 <_main+0x220>
100003aec: 29 21 00 91 	add	x9, x9, #8
100003af0: aa 05 80 52 	mov	w10, #45
100003af4: 2b 00 00 b0 	adrp	x11, 0x100008000 <_main+0x22c>
100003af8: 6b 41 00 91 	add	x11, x11, #16
100003afc: ec 12 40 f9 	ldr	x12, [x23, #32]
100003b00: 4d 07 00 d1 	sub	x13, x26, #1
100003b04: 8e 69 6d 38 	ldrb	w14, [x12, x13]
100003b08: 0f 1b 40 f9 	ldr	x15, [x24, #48]
100003b0c: cc 06 00 d1 	sub	x12, x22, #1
100003b10: ef 69 6c 38 	ldrb	w15, [x15, x12]
100003b14: df 01 0f 6b 	cmp	w14, w15
100003b18: 2f 01 8b 9a 	csel	x15, x9, x11, eq
100003b1c: 50 7f 1b 9b 	mul	x16, x26, x27
100003b20: 90 0f 10 8b 	add	x16, x28, x16, lsl #3
100003b24: 02 7a 76 fc 	ldr	d2, [x16, x22, lsl #3]
100003b28: 01 7a 6c fc 	ldr	d1, [x16, x12, lsl #3]
100003b2c: 21 28 60 1e 	fadd	d1, d1, d0
100003b30: 40 20 61 1e 	fcmp	d2, d1
100003b34: 41 01 00 54 	b.ne	0x100003b5c <_main+0x280>
100003b38: ad 83 58 f8 	ldur	x13, [x29, #-120]
100003b3c: aa 69 28 38 	strb	w10, [x13, x8]
100003b40: 08 1b 40 f9 	ldr	x8, [x24, #48]
100003b44: 08 69 6c 38 	ldrb	w8, [x8, x12]
100003b48: ee b7 47 a9 	ldp	x14, x13, [sp, #120]
100003b4c: a8 69 2e 38 	strb	w8, [x13, x14]
100003b50: 20 0f 40 fd 	ldr	d0, [x25, #24]
100003b54: 01 40 60 1e 	fmov	d1, d0
100003b58: 1c 00 00 14 	b	0x100003bc8 <_main+0x2ec>
100003b5c: b0 7d 1b 9b 	mul	x16, x13, x27
100003b60: 90 0f 10 8b 	add	x16, x28, x16, lsl #3
100003b64: 01 7a 76 fc 	ldr	d1, [x16, x22, lsl #3]
100003b68: 01 28 61 1e 	fadd	d1, d0, d1
100003b6c: 40 20 61 1e 	fcmp	d2, d1
100003b70: 21 01 00 54 	b.ne	0x100003b94 <_main+0x2b8>
100003b74: ac 83 58 f8 	ldur	x12, [x29, #-120]
100003b78: 8e 69 28 38 	strb	w14, [x12, x8]
100003b7c: ec a3 47 a9 	ldp	x12, x8, [sp, #120]
100003b80: 0a 69 2c 38 	strb	w10, [x8, x12]
100003b84: 20 0f 40 fd 	ldr	d0, [x25, #24]
100003b88: 01 40 60 1e 	fmov	d1, d0
100003b8c: ec 03 16 aa 	mov	x12, x22
100003b90: 0d 00 00 14 	b	0x100003bc4 <_main+0x2e8>
100003b94: e1 01 40 fd 	ldr	d1, [x15]
100003b98: 03 7a 6c fc 	ldr	d3, [x16, x12, lsl #3]
100003b9c: 23 28 63 1e 	fadd	d3, d1, d3
100003ba0: 40 20 63 1e 	fcmp	d2, d3
100003ba4: 81 01 00 54 	b.ne	0x100003bd4 <_main+0x2f8>
100003ba8: af 83 58 f8 	ldur	x15, [x29, #-120]
100003bac: ee 69 28 38 	strb	w14, [x15, x8]
100003bb0: 08 1b 40 f9 	ldr	x8, [x24, #48]
100003bb4: 08 69 6c 38 	ldrb	w8, [x8, x12]
100003bb8: ef bb 47 a9 	ldp	x15, x14, [sp, #120]
100003bbc: c8 69 2f 38 	strb	w8, [x14, x15]
100003bc0: 20 0f 40 fd 	ldr	d0, [x25, #24]
100003bc4: fa 03 0d aa 	mov	x26, x13
100003bc8: 28 28 68 1e 	fadd	d8, d1, d8
100003bcc: e8 3f 40 f9 	ldr	x8, [sp, #120]
100003bd0: f6 03 0c aa 	mov	x22, x12
100003bd4: 08 05 00 91 	add	x8, x8, #1
100003bd8: e8 3f 00 f9 	str	x8, [sp, #120]
100003bdc: 5a 00 00 b4 	cbz	x26, 0x100003be4 <_main+0x308>
100003be0: f6 f8 ff b5 	cbnz	x22, 0x100003afc <_main+0x220>
100003be4: 36 02 00 b4 	cbz	x22, 0x100003c28 <_main+0x34c>
100003be8: c9 06 00 d1 	sub	x9, x22, #1
100003bec: aa 05 80 52 	mov	w10, #45
100003bf0: ab 83 58 f8 	ldur	x11, [x29, #-120]
100003bf4: 6a 69 28 38 	strb	w10, [x11, x8]
100003bf8: 08 1b 40 f9 	ldr	x8, [x24, #48]
100003bfc: 08 69 69 38 	ldrb	w8, [x8, x9]
100003c00: ec af 47 a9 	ldp	x12, x11, [sp, #120]
100003c04: 68 69 2c 38 	strb	w8, [x11, x12]
100003c08: 20 0f 40 fd 	ldr	d0, [x25, #24]
100003c0c: 08 28 68 1e 	fadd	d8, d0, d8
100003c10: e8 3f 40 f9 	ldr	x8, [sp, #120]
100003c14: 08 05 00 91 	add	x8, x8, #1
100003c18: e8 3f 00 f9 	str	x8, [sp, #120]
100003c1c: 29 05 00 d1 	sub	x9, x9, #1
100003c20: 3f 05 00 b1 	cmn	x9, #1
100003c24: 61 fe ff 54 	b.ne	0x100003bf0 <_main+0x314>
100003c28: 3a 02 00 b4 	cbz	x26, 0x100003c6c <_main+0x390>
100003c2c: 49 07 00 d1 	sub	x9, x26, #1
100003c30: aa 05 80 52 	mov	w10, #45
100003c34: eb 12 40 f9 	ldr	x11, [x23, #32]
100003c38: 6b 69 69 38 	ldrb	w11, [x11, x9]
100003c3c: ac 83 58 f8 	ldur	x12, [x29, #-120]
100003c40: 8b 69 28 38 	strb	w11, [x12, x8]
100003c44: eb a3 47 a9 	ldp	x11, x8, [sp, #120]
100003c48: 0a 69 2b 38 	strb	w10, [x8, x11]
100003c4c: 20 0f 40 fd 	ldr	d0, [x25, #24]
100003c50: 08 28 68 1e 	fadd	d8, d0, d8
100003c54: e8 3f 40 f9 	ldr	x8, [sp, #120]
100003c58: 08 05 00 91 	add	x8, x8, #1
100003c5c: e8 3f 00 f9 	str	x8, [sp, #120]
100003c60: 29 05 00 d1 	sub	x9, x9, #1
100003c64: 3f 05 00 b1 	cmn	x9, #1
100003c68: 61 fe ff 54 	b.ne	0x100003c34 <_main+0x358>
100003c6c: 14 05 00 91 	add	x20, x8, #1
100003c70: e0 03 14 aa 	mov	x0, x20
100003c74: 21 00 80 52 	mov	w1, #1
100003c78: 96 00 00 94 	bl	0x100003ed0 <_strtod+0x100003ed0>
100003c7c: e0 10 00 b4 	cbz	x0, 0x100003e98 <_main+0x5bc>
100003c80: e8 23 40 f9 	ldr	x8, [sp, #64]
100003c84: 00 01 00 f9 	str	x0, [x8]
100003c88: e0 03 14 aa 	mov	x0, x20
100003c8c: 21 00 80 52 	mov	w1, #1
100003c90: 90 00 00 94 	bl	0x100003ed0 <_strtod+0x100003ed0>
100003c94: 20 10 00 b4 	cbz	x0, 0x100003e98 <_main+0x5bc>
100003c98: a8 03 59 f8 	ldur	x8, [x29, #-112]
100003c9c: 00 01 00 f9 	str	x0, [x8]
100003ca0: e0 03 14 aa 	mov	x0, x20
100003ca4: 21 00 80 52 	mov	w1, #1
100003ca8: 8a 00 00 94 	bl	0x100003ed0 <_strtod+0x100003ed0>
100003cac: 60 0f 00 b4 	cbz	x0, 0x100003e98 <_main+0x5bc>
100003cb0: f4 03 00 aa 	mov	x20, x0
100003cb4: e8 03 02 91 	add	x8, sp, #128
100003cb8: e8 13 00 f9 	str	x8, [sp, #32]
100003cbc: a8 c3 01 d1 	sub	x8, x29, #112
100003cc0: a9 e3 01 d1 	sub	x9, x29, #120
100003cc4: e9 23 01 a9 	stp	x9, x8, [sp, #16]
100003cc8: e8 03 01 91 	add	x8, sp, #64
100003ccc: e9 e3 01 91 	add	x9, sp, #120
100003cd0: 00 00 00 b0 	adrp	x0, 0x100004000 <_main+0x3f8>
100003cd4: 00 e0 01 91 	add	x0, x0, #120
100003cd8: e9 23 00 a9 	stp	x9, x8, [sp]
100003cdc: 02 00 00 90 	adrp	x2, 0x100003000 <_main+0x400>
100003ce0: 42 40 1e 91 	add	x2, x2, #1936
100003ce4: a1 00 80 52 	mov	w1, #5
100003ce8: 77 00 00 94 	bl	0x100003ec4 <_strtod+0x100003ec4>
100003cec: f7 3f 40 f9 	ldr	x23, [sp, #120]
100003cf0: 97 08 00 b4 	cbz	x23, 0x100003e00 <_main+0x524>
100003cf4: e8 23 40 f9 	ldr	x8, [sp, #64]
100003cf8: 08 01 40 f9 	ldr	x8, [x8]
100003cfc: a9 03 59 f8 	ldur	x9, [x29, #-112]
100003d00: 29 01 40 f9 	ldr	x9, [x9]
100003d04: 2a 00 00 b0 	adrp	x10, 0x100008000 <_main+0x43c>
100003d08: 4a 01 40 39 	ldrb	w10, [x10]
100003d0c: ff 22 00 f1 	cmp	x23, #8
100003d10: 62 00 00 54 	b.hs	0x100003d1c <_main+0x440>
100003d14: 0b 00 80 d2 	mov	x11, #0
100003d18: 31 00 00 14 	b	0x100003ddc <_main+0x500>
100003d1c: ff 02 01 f1 	cmp	x23, #64
100003d20: 62 00 00 54 	b.hs	0x100003d2c <_main+0x450>
100003d24: 0b 00 80 d2 	mov	x11, #0
100003d28: 1c 00 00 14 	b	0x100003d98 <_main+0x4bc>
100003d2c: 40 0d 01 4e 	dup.16b	v0, w10
100003d30: eb e6 7a 92 	and	x11, x23, #0xffffffffffffffc0
100003d34: 0c 81 00 91 	add	x12, x8, #32
100003d38: 8d 82 00 91 	add	x13, x20, #32
100003d3c: 2e 81 00 91 	add	x14, x9, #32
100003d40: 01 e4 01 4f 	movi.16b	v1, #32
100003d44: ef 03 0b aa 	mov	x15, x11
100003d48: 82 0d 7f ad 	ldp	q2, q3, [x12, #-32]
100003d4c: 84 15 c2 ac 	ldp	q4, q5, [x12], #64
100003d50: c6 1d 7f ad 	ldp	q6, q7, [x14, #-32]
100003d54: d0 45 c2 ac 	ldp	q16, q17, [x14], #64
100003d58: 42 8c 26 6e 	cmeq.16b	v2, v2, v6
100003d5c: 63 8c 27 6e 	cmeq.16b	v3, v3, v7
100003d60: 84 8c 30 6e 	cmeq.16b	v4, v4, v16
100003d64: a5 8c 31 6e 	cmeq.16b	v5, v5, v17
100003d68: 02 1c 61 6e 	bsl.16b	v2, v0, v1
100003d6c: 03 1c 61 6e 	bsl.16b	v3, v0, v1
100003d70: 04 1c 61 6e 	bsl.16b	v4, v0, v1
100003d74: 05 1c 61 6e 	bsl.16b	v5, v0, v1
100003d78: a2 0d 3f ad 	stp	q2, q3, [x13, #-32]
100003d7c: a4 15 82 ac 	stp	q4, q5, [x13], #64
100003d80: ef 01 01 f1 	subs	x15, x15, #64
100003d84: 21 fe ff 54 	b.ne	0x100003d48 <_main+0x46c>
100003d88: ff 02 0b eb 	cmp	x23, x11
100003d8c: a0 03 00 54 	b.eq	0x100003e00 <_main+0x524>
100003d90: ff 0a 7d f2 	tst	x23, #0x38
100003d94: 40 02 00 54 	b.eq	0x100003ddc <_main+0x500>
100003d98: ef 03 0b aa 	mov	x15, x11
100003d9c: 40 0d 01 0e 	dup.8b	v0, w10
100003da0: eb f2 7d 92 	and	x11, x23, #0xfffffffffffffff8
100003da4: 0c 01 0f 8b 	add	x12, x8, x15
100003da8: 2d 01 0f 8b 	add	x13, x9, x15
100003dac: 8e 02 0f 8b 	add	x14, x20, x15
100003db0: ef 01 0b cb 	sub	x15, x15, x11
100003db4: 01 e4 01 0f 	movi.8b	v1, #32
100003db8: 82 85 40 fc 	ldr	d2, [x12], #8
100003dbc: a3 85 40 fc 	ldr	d3, [x13], #8
100003dc0: 42 8c 23 2e 	cmeq.8b	v2, v2, v3
100003dc4: 02 1c 61 2e 	bsl.8b	v2, v0, v1
100003dc8: c2 85 00 fc 	str	d2, [x14], #8
100003dcc: ef 21 00 b1 	adds	x15, x15, #8
100003dd0: 41 ff ff 54 	b.ne	0x100003db8 <_main+0x4dc>
100003dd4: ff 02 0b eb 	cmp	x23, x11
100003dd8: 40 01 00 54 	b.eq	0x100003e00 <_main+0x524>
100003ddc: 0c 04 80 52 	mov	w12, #32
100003de0: 0d 69 6b 38 	ldrb	w13, [x8, x11]
100003de4: 2e 69 6b 38 	ldrb	w14, [x9, x11]
100003de8: bf 01 0e 6b 	cmp	w13, w14
100003dec: 4d 01 8c 1a 	csel	w13, w10, w12, eq
100003df0: 8d 6a 2b 38 	strb	w13, [x20, x11]
100003df4: 6b 05 00 91 	add	x11, x11, #1
100003df8: ff 02 0b eb 	cmp	x23, x11
100003dfc: 21 ff ff 54 	b.ne	0x100003de0 <_main+0x504>
100003e00: a0 83 58 f8 	ldur	x0, [x29, #-120]
100003e04: 39 00 00 94 	bl	0x100003ee8 <_strtod+0x100003ee8>
100003e08: e0 43 40 f9 	ldr	x0, [sp, #128]
100003e0c: 37 00 00 94 	bl	0x100003ee8 <_strtod+0x100003ee8>
100003e10: f7 03 00 f9 	str	x23, [sp]
100003e14: 00 00 00 90 	adrp	x0, 0x100003000 <_main+0x538>
100003e18: 00 1c 3e 91 	add	x0, x0, #3975
100003e1c: 39 00 00 94 	bl	0x100003f00 <_strtod+0x100003f00>
100003e20: e8 03 00 fd 	str	d8, [sp]
100003e24: 00 00 00 90 	adrp	x0, 0x100003000 <_main+0x548>
100003e28: 00 30 3e 91 	add	x0, x0, #3980
100003e2c: 35 00 00 94 	bl	0x100003f00 <_strtod+0x100003f00>
100003e30: e0 1f 40 f9 	ldr	x0, [sp, #56]
100003e34: 36 00 00 94 	bl	0x100003f0c <_strtod+0x100003f0c>
100003e38: 7f 1e 00 71 	cmp	w19, #7
100003e3c: 61 00 00 54 	b.ne	0x100003e48 <_main+0x56c>
100003e40: e0 03 14 aa 	mov	x0, x20
100003e44: 32 00 00 94 	bl	0x100003f0c <_strtod+0x100003f0c>
100003e48: e0 1b 40 f9 	ldr	x0, [sp, #48]
100003e4c: 30 00 00 94 	bl	0x100003f0c <_strtod+0x100003f0c>
100003e50: a0 22 40 f9 	ldr	x0, [x21, #64]
100003e54: 25 00 00 94 	bl	0x100003ee8 <_strtod+0x100003ee8>
100003e58: e0 1f 40 f9 	ldr	x0, [sp, #56]
100003e5c: 23 00 00 94 	bl	0x100003ee8 <_strtod+0x100003ee8>
100003e60: e0 1b 40 f9 	ldr	x0, [sp, #48]
100003e64: 21 00 00 94 	bl	0x100003ee8 <_strtod+0x100003ee8>
100003e68: e0 03 14 aa 	mov	x0, x20
100003e6c: 1f 00 00 94 	bl	0x100003ee8 <_strtod+0x100003ee8>
100003e70: 00 00 80 52 	mov	w0, #0
100003e74: fd 7b 50 a9 	ldp	x29, x30, [sp, #256]
100003e78: f4 4f 4f a9 	ldp	x20, x19, [sp, #240]
100003e7c: f6 57 4e a9 	ldp	x22, x21, [sp, #224]
100003e80: f8 5f 4d a9 	ldp	x24, x23, [sp, #208]
100003e84: fa 67 4c a9 	ldp	x26, x25, [sp, #192]
100003e88: fc 6f 4b a9 	ldp	x28, x27, [sp, #176]
100003e8c: e9 23 4a 6d 	ldp	d9, d8, [sp, #160]
100003e90: ff 43 04 91 	add	sp, sp, #272
100003e94: c0 03 5f d6 	ret
100003e98: 20 00 80 52 	mov	w0, #1
100003e9c: 10 00 00 94 	bl	0x100003edc <_strtod+0x100003edc>

Disassembly of section __TEXT,__stubs:

0000000100003ea0 <__stubs>:
100003ea0: 10 00 00 b0 	adrp	x16, 0x100004000 <__stubs+0x4>
100003ea4: 10 02 40 f9 	ldr	x16, [x16]
100003ea8: 00 02 1f d6 	br	x16
100003eac: 10 00 00 b0 	adrp	x16, 0x100004000 <__stubs+0x10>
100003eb0: 10 06 40 f9 	ldr	x16, [x16, #8]
100003eb4: 00 02 1f d6 	br	x16
100003eb8: 10 00 00 b0 	adrp	x16, 0x100004000 <__stubs+0x1c>
100003ebc: 10 0a 40 f9 	ldr	x16, [x16, #16]
100003ec0: 00 02 1f d6 	br	x16
100003ec4: 10 00 00 b0 	adrp	x16, 0x100004000 <__stubs+0x28>
100003ec8: 10 0e 40 f9 	ldr	x16, [x16, #24]
100003ecc: 00 02 1f d6 	br	x16
100003ed0: 10 00 00 b0 	adrp	x16, 0x100004000 <__stubs+0x34>
100003ed4: 10 12 40 f9 	ldr	x16, [x16, #32]
100003ed8: 00 02 1f d6 	br	x16
100003edc: 10 00 00 b0 	adrp	x16, 0x100004000 <__stubs+0x40>
100003ee0: 10 16 40 f9 	ldr	x16, [x16, #40]
100003ee4: 00 02 1f d6 	br	x16
100003ee8: 10 00 00 b0 	adrp	x16, 0x100004000 <__stubs+0x4c>
100003eec: 10 1a 40 f9 	ldr	x16, [x16, #48]
100003ef0: 00 02 1f d6 	br	x16
100003ef4: 10 00 00 b0 	adrp	x16, 0x100004000 <__stubs+0x58>
100003ef8: 10 1e 40 f9 	ldr	x16, [x16, #56]
100003efc: 00 02 1f d6 	br	x16
100003f00: 10 00 00 b0 	adrp	x16, 0x100004000 <__stubs+0x64>
100003f04: 10 22 40 f9 	ldr	x16, [x16, #64]
100003f08: 00 02 1f d6 	br	x16
100003f0c: 10 00 00 b0 	adrp	x16, 0x100004000 <__stubs+0x70>
100003f10: 10 26 40 f9 	ldr	x16, [x16, #72]
100003f14: 00 02 1f d6 	br	x16
100003f18: 10 00 00 b0 	adrp	x16, 0x100004000 <__stubs+0x7c>
100003f1c: 10 2a 40 f9 	ldr	x16, [x16, #80]
100003f20: 00 02 1f d6 	br	x16
100003f24: 10 00 00 b0 	adrp	x16, 0x100004000 <__stubs+0x88>
100003f28: 10 2e 40 f9 	ldr	x16, [x16, #88]
100003f2c: 00 02 1f d6 	br	x16
