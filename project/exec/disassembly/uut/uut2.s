
uut2:	file format mach-o arm64

Disassembly of section __TEXT,__text:

000000010000312c <_impl_nw_generate_1.omp_outlined>:
10000312c: ff c3 01 d1 	sub	sp, sp, #112
100003130: f8 5f 03 a9 	stp	x24, x23, [sp, #48]
100003134: f6 57 04 a9 	stp	x22, x21, [sp, #64]
100003138: f4 4f 05 a9 	stp	x20, x19, [sp, #80]
10000313c: fd 7b 06 a9 	stp	x29, x30, [sp, #96]
100003140: fd 83 01 91 	add	x29, sp, #96
100003144: f5 03 05 aa 	mov	x21, x5
100003148: f3 03 04 aa 	mov	x19, x4
10000314c: f4 03 00 aa 	mov	x20, x0
100003150: 48 00 40 f9 	ldr	x8, [x2]
100003154: 18 09 00 f1 	subs	x24, x8, #2
100003158: 03 0c 00 54 	b.lo	0x1000032d8 <_impl_nw_generate_1.omp_outlined+0x1ac>
10000315c: f7 03 03 aa 	mov	x23, x3
100003160: f8 7f 02 a9 	stp	x24, xzr, [sp, #32]
100003164: 28 00 80 52 	mov	w8, #1
100003168: e8 0f 00 f9 	str	x8, [sp, #24]
10000316c: ff 17 00 b9 	str	wzr, [sp, #20]
100003170: 96 02 40 b9 	ldr	w22, [x20]
100003174: e8 03 00 f9 	str	x8, [sp]
100003178: 00 00 00 b0 	adrp	x0, 0x100004000 <_impl_nw_generate_1.omp_outlined+0x50>
10000317c: 00 a0 01 91 	add	x0, x0, #104
100003180: e3 53 00 91 	add	x3, sp, #20
100003184: e4 a3 00 91 	add	x4, sp, #40
100003188: e5 83 00 91 	add	x5, sp, #32
10000318c: e6 63 00 91 	add	x6, sp, #24
100003190: e1 03 16 aa 	mov	x1, x22
100003194: 42 04 80 52 	mov	w2, #34
100003198: 27 00 80 52 	mov	w7, #1
10000319c: 47 03 00 94 	bl	0x100003eb8 <_strtod+0x100003eb8>
1000031a0: e8 27 42 a9 	ldp	x8, x9, [sp, #32]
1000031a4: 1f 01 18 eb 	cmp	x8, x24
1000031a8: 08 31 98 9a 	csel	x8, x8, x24, lo
1000031ac: e8 13 00 f9 	str	x8, [sp, #32]
1000031b0: 3f 01 08 eb 	cmp	x9, x8
1000031b4: a8 08 00 54 	b.hi	0x1000032c8 <_impl_nw_generate_1.omp_outlined+0x19c>
1000031b8: 6a 02 40 f9 	ldr	x10, [x19]
1000031bc: 0b 01 09 cb 	sub	x11, x8, x9
1000031c0: 6b 05 00 91 	add	x11, x11, #1
1000031c4: 7f 29 00 f1 	cmp	x11, #10
1000031c8: e0 2a 41 fa 	ccmp	x23, #1, #0, hs
1000031cc: 21 06 00 54 	b.ne	0x100003290 <_impl_nw_generate_1.omp_outlined+0x164>
1000031d0: 4c 0d 09 8b 	add	x12, x10, x9, lsl #3
1000031d4: 8c 21 00 91 	add	x12, x12, #8
1000031d8: 2d 00 00 b0 	adrp	x13, 0x100008000 <_impl_nw_generate_1.omp_outlined+0xc0>
1000031dc: ad 81 00 91 	add	x13, x13, #32
1000031e0: 9f 01 0d eb 	cmp	x12, x13
1000031e4: e2 00 00 54 	b.hs	0x100003200 <_impl_nw_generate_1.omp_outlined+0xd4>
1000031e8: 4c 0d 08 8b 	add	x12, x10, x8, lsl #3
1000031ec: 8c 41 00 91 	add	x12, x12, #16
1000031f0: 2d 00 00 b0 	adrp	x13, 0x100008000 <_impl_nw_generate_1.omp_outlined+0xd8>
1000031f4: ad 61 00 91 	add	x13, x13, #24
1000031f8: 9f 01 0d eb 	cmp	x12, x13
1000031fc: a8 04 00 54 	b.hi	0x100003290 <_impl_nw_generate_1.omp_outlined+0x164>
100003200: 6c f1 7d 92 	and	x12, x11, #0xfffffffffffffff8
100003204: 2d 00 00 b0 	adrp	x13, 0x100008000 <_impl_nw_generate_1.omp_outlined+0xec>
100003208: a0 0d 40 fd 	ldr	d0, [x13, #24]
10000320c: 0d 00 00 90 	adrp	x13, 0x100003000 <_impl_nw_generate_1.omp_outlined+0xe0>
100003210: a1 cd c3 3d 	ldr	q1, [x13, #3888]
100003214: 0d 00 00 90 	adrp	x13, 0x100003000 <_impl_nw_generate_1.omp_outlined+0xe8>
100003218: a2 d1 c3 3d 	ldr	q2, [x13, #3904]
10000321c: 0d 00 00 90 	adrp	x13, 0x100003000 <_impl_nw_generate_1.omp_outlined+0xf0>
100003220: a3 d5 c3 3d 	ldr	q3, [x13, #3920]
100003224: ed 03 09 aa 	mov	x13, x9
100003228: ee 03 0c aa 	mov	x14, x12
10000322c: 0f 00 00 90 	adrp	x15, 0x100003000 <_impl_nw_generate_1.omp_outlined+0x100>
100003230: e4 d9 c3 3d 	ldr	q4, [x15, #3936]
100003234: a5 0d 08 4e 	dup.2d	v5, x13
100003238: a6 84 e1 4e 	add.2d	v6, v5, v1
10000323c: a7 84 e2 4e 	add.2d	v7, v5, v2
100003240: b0 84 e3 4e 	add.2d	v16, v5, v3
100003244: a5 84 e4 4e 	add.2d	v5, v5, v4
100003248: d1 d8 61 6e 	ucvtf.2d	v17, v6
10000324c: e7 d8 61 6e 	ucvtf.2d	v7, v7
100003250: 10 da 61 6e 	ucvtf.2d	v16, v16
100003254: a5 d8 61 6e 	ucvtf.2d	v5, v5
100003258: 31 92 c0 4f 	fmul.2d	v17, v17, v0[0]
10000325c: e7 90 c0 4f 	fmul.2d	v7, v7, v0[0]
100003260: 10 92 c0 4f 	fmul.2d	v16, v16, v0[0]
100003264: cf 00 66 9e 	fmov	x15, d6
100003268: 4f 0d 0f 8b 	add	x15, x10, x15, lsl #3
10000326c: f1 1d 00 ad 	stp	q17, q7, [x15]
100003270: a5 90 c0 4f 	fmul.2d	v5, v5, v0[0]
100003274: f0 15 01 ad 	stp	q16, q5, [x15, #32]
100003278: ad 21 00 91 	add	x13, x13, #8
10000327c: ce 21 00 f1 	subs	x14, x14, #8
100003280: a1 fd ff 54 	b.ne	0x100003234 <_impl_nw_generate_1.omp_outlined+0x108>
100003284: 7f 01 0c eb 	cmp	x11, x12
100003288: 00 02 00 54 	b.eq	0x1000032c8 <_impl_nw_generate_1.omp_outlined+0x19c>
10000328c: 29 01 0c 8b 	add	x9, x9, x12
100003290: 2b 05 00 d1 	sub	x11, x9, #1
100003294: e9 5e 09 9b 	madd	x9, x23, x9, x23
100003298: 49 0d 09 8b 	add	x9, x10, x9, lsl #3
10000329c: ea f2 7d d3 	lsl	x10, x23, #3
1000032a0: 2c 00 00 b0 	adrp	x12, 0x100008000 <_impl_nw_generate_1.omp_outlined+0x188>
1000032a4: 6d 09 00 91 	add	x13, x11, #2
1000032a8: a0 01 63 9e 	ucvtf	d0, x13
1000032ac: 81 0d 40 fd 	ldr	d1, [x12, #24]
1000032b0: 20 08 60 1e 	fmul	d0, d1, d0
1000032b4: 20 01 00 fd 	str	d0, [x9]
1000032b8: 6b 05 00 91 	add	x11, x11, #1
1000032bc: 29 01 0a 8b 	add	x9, x9, x10
1000032c0: 1f 01 0b eb 	cmp	x8, x11
1000032c4: 01 ff ff 54 	b.ne	0x1000032a4 <_impl_nw_generate_1.omp_outlined+0x178>
1000032c8: 00 00 00 b0 	adrp	x0, 0x100004000 <_impl_nw_generate_1.omp_outlined+0x1a0>
1000032cc: 00 a0 01 91 	add	x0, x0, #104
1000032d0: e1 03 16 aa 	mov	x1, x22
1000032d4: f3 02 00 94 	bl	0x100003ea0 <_strtod+0x100003ea0>
1000032d8: a8 02 40 f9 	ldr	x8, [x21]
1000032dc: 15 09 00 f1 	subs	x21, x8, #2
1000032e0: 63 0b 00 54 	b.lo	0x10000344c <_impl_nw_generate_1.omp_outlined+0x320>
1000032e4: f5 7f 02 a9 	stp	x21, xzr, [sp, #32]
1000032e8: 28 00 80 52 	mov	w8, #1
1000032ec: e8 0f 00 f9 	str	x8, [sp, #24]
1000032f0: ff 17 00 b9 	str	wzr, [sp, #20]
1000032f4: 94 02 40 b9 	ldr	w20, [x20]
1000032f8: e8 03 00 f9 	str	x8, [sp]
1000032fc: 00 00 00 b0 	adrp	x0, 0x100004000 <_impl_nw_generate_1.omp_outlined+0x1d4>
100003300: 00 a0 01 91 	add	x0, x0, #104
100003304: e3 53 00 91 	add	x3, sp, #20
100003308: e4 a3 00 91 	add	x4, sp, #40
10000330c: e5 83 00 91 	add	x5, sp, #32
100003310: e6 63 00 91 	add	x6, sp, #24
100003314: e1 03 14 aa 	mov	x1, x20
100003318: 42 04 80 52 	mov	w2, #34
10000331c: 27 00 80 52 	mov	w7, #1
100003320: e6 02 00 94 	bl	0x100003eb8 <_strtod+0x100003eb8>
100003324: e8 13 40 f9 	ldr	x8, [sp, #32]
100003328: 1f 01 15 eb 	cmp	x8, x21
10000332c: 0a 31 95 9a 	csel	x10, x8, x21, lo
100003330: ea 13 00 f9 	str	x10, [sp, #32]
100003334: e8 17 40 f9 	ldr	x8, [sp, #40]
100003338: 1f 01 0a eb 	cmp	x8, x10
10000333c: 08 08 00 54 	b.hi	0x10000343c <_impl_nw_generate_1.omp_outlined+0x310>
100003340: 6b 02 40 f9 	ldr	x11, [x19]
100003344: 49 01 08 cb 	sub	x9, x10, x8
100003348: 2c 05 00 91 	add	x12, x9, #1
10000334c: 29 00 00 b0 	adrp	x9, 0x100008000 <_impl_nw_generate_1.omp_outlined+0x234>
100003350: 9f 21 00 f1 	cmp	x12, #8
100003354: 03 06 00 54 	b.lo	0x100003414 <_impl_nw_generate_1.omp_outlined+0x2e8>
100003358: 6d 0d 08 8b 	add	x13, x11, x8, lsl #3
10000335c: ad 21 00 91 	add	x13, x13, #8
100003360: 2e 00 00 b0 	adrp	x14, 0x100008000 <_impl_nw_generate_1.omp_outlined+0x248>
100003364: ce 81 00 91 	add	x14, x14, #32
100003368: bf 01 0e eb 	cmp	x13, x14
10000336c: e2 00 00 54 	b.hs	0x100003388 <_impl_nw_generate_1.omp_outlined+0x25c>
100003370: 6d 0d 0a 8b 	add	x13, x11, x10, lsl #3
100003374: ad 41 00 91 	add	x13, x13, #16
100003378: 2e 00 00 b0 	adrp	x14, 0x100008000 <_impl_nw_generate_1.omp_outlined+0x260>
10000337c: ce 61 00 91 	add	x14, x14, #24
100003380: bf 01 0e eb 	cmp	x13, x14
100003384: 88 04 00 54 	b.hi	0x100003414 <_impl_nw_generate_1.omp_outlined+0x2e8>
100003388: 8d f1 7d 92 	and	x13, x12, #0xfffffffffffffff8
10000338c: 20 0d 40 fd 	ldr	d0, [x9, #24]
100003390: 0e 00 00 90 	adrp	x14, 0x100003000 <_impl_nw_generate_1.omp_outlined+0x264>
100003394: c1 cd c3 3d 	ldr	q1, [x14, #3888]
100003398: 0e 00 00 90 	adrp	x14, 0x100003000 <_impl_nw_generate_1.omp_outlined+0x26c>
10000339c: c2 d1 c3 3d 	ldr	q2, [x14, #3904]
1000033a0: 0e 00 00 90 	adrp	x14, 0x100003000 <_impl_nw_generate_1.omp_outlined+0x274>
1000033a4: c3 d5 c3 3d 	ldr	q3, [x14, #3920]
1000033a8: ee 03 08 aa 	mov	x14, x8
1000033ac: ef 03 0d aa 	mov	x15, x13
1000033b0: 10 00 00 90 	adrp	x16, 0x100003000 <_impl_nw_generate_1.omp_outlined+0x284>
1000033b4: 04 da c3 3d 	ldr	q4, [x16, #3936]
1000033b8: c5 0d 08 4e 	dup.2d	v5, x14
1000033bc: a6 84 e1 4e 	add.2d	v6, v5, v1
1000033c0: a7 84 e2 4e 	add.2d	v7, v5, v2
1000033c4: b0 84 e3 4e 	add.2d	v16, v5, v3
1000033c8: a5 84 e4 4e 	add.2d	v5, v5, v4
1000033cc: d1 d8 61 6e 	ucvtf.2d	v17, v6
1000033d0: e7 d8 61 6e 	ucvtf.2d	v7, v7
1000033d4: 10 da 61 6e 	ucvtf.2d	v16, v16
1000033d8: a5 d8 61 6e 	ucvtf.2d	v5, v5
1000033dc: 31 92 c0 4f 	fmul.2d	v17, v17, v0[0]
1000033e0: e7 90 c0 4f 	fmul.2d	v7, v7, v0[0]
1000033e4: 10 92 c0 4f 	fmul.2d	v16, v16, v0[0]
1000033e8: d0 00 66 9e 	fmov	x16, d6
1000033ec: 70 0d 10 8b 	add	x16, x11, x16, lsl #3
1000033f0: 11 1e 00 ad 	stp	q17, q7, [x16]
1000033f4: a5 90 c0 4f 	fmul.2d	v5, v5, v0[0]
1000033f8: 10 16 01 ad 	stp	q16, q5, [x16, #32]
1000033fc: ce 21 00 91 	add	x14, x14, #8
100003400: ef 21 00 f1 	subs	x15, x15, #8
100003404: a1 fd ff 54 	b.ne	0x1000033b8 <_impl_nw_generate_1.omp_outlined+0x28c>
100003408: 9f 01 0d eb 	cmp	x12, x13
10000340c: 80 01 00 54 	b.eq	0x10000343c <_impl_nw_generate_1.omp_outlined+0x310>
100003410: 08 01 0d 8b 	add	x8, x8, x13
100003414: 4a 05 00 91 	add	x10, x10, #1
100003418: 6b 21 00 91 	add	x11, x11, #8
10000341c: 0c 05 00 91 	add	x12, x8, #1
100003420: 80 01 63 9e 	ucvtf	d0, x12
100003424: 21 0d 40 fd 	ldr	d1, [x9, #24]
100003428: 20 08 60 1e 	fmul	d0, d1, d0
10000342c: 60 79 28 fc 	str	d0, [x11, x8, lsl #3]
100003430: e8 03 0c aa 	mov	x8, x12
100003434: 5f 01 0c eb 	cmp	x10, x12
100003438: 21 ff ff 54 	b.ne	0x10000341c <_impl_nw_generate_1.omp_outlined+0x2f0>
10000343c: 00 00 00 b0 	adrp	x0, 0x100004000 <_impl_nw_generate_1.omp_outlined+0x314>
100003440: 00 a0 01 91 	add	x0, x0, #104
100003444: e1 03 14 aa 	mov	x1, x20
100003448: 96 02 00 94 	bl	0x100003ea0 <_strtod+0x100003ea0>
10000344c: fd 7b 46 a9 	ldp	x29, x30, [sp, #96]
100003450: f4 4f 45 a9 	ldp	x20, x19, [sp, #80]
100003454: f6 57 44 a9 	ldp	x22, x21, [sp, #64]
100003458: f8 5f 43 a9 	ldp	x24, x23, [sp, #48]
10000345c: ff c3 01 91 	add	sp, sp, #112
100003460: c0 03 5f d6 	ret

0000000100003464 <_impl_nw_generate_1_block_iter.omp_outlined>:
100003464: ff 43 03 d1 	sub	sp, sp, #208
100003468: fc 6f 07 a9 	stp	x28, x27, [sp, #112]
10000346c: fa 67 08 a9 	stp	x26, x25, [sp, #128]
100003470: f8 5f 09 a9 	stp	x24, x23, [sp, #144]
100003474: f6 57 0a a9 	stp	x22, x21, [sp, #160]
100003478: f4 4f 0b a9 	stp	x20, x19, [sp, #176]
10000347c: fd 7b 0c a9 	stp	x29, x30, [sp, #192]
100003480: fd 03 03 91 	add	x29, sp, #192
100003484: e6 1f 02 a9 	stp	x6, x7, [sp, #32]
100003488: e4 17 01 a9 	stp	x4, x5, [sp, #16]
10000348c: e2 0f 04 a9 	stp	x2, x3, [sp, #64]
100003490: 48 00 40 f9 	ldr	x8, [x2]
100003494: 69 00 40 f9 	ldr	x9, [x3]
100003498: 0a 05 00 d1 	sub	x10, x8, #1
10000349c: 5f 01 09 ab 	cmn	x10, x9
1000034a0: 21 01 00 54 	b.ne	0x1000034c4 <_impl_nw_generate_1_block_iter.omp_outlined+0x60>
1000034a4: fd 7b 4c a9 	ldp	x29, x30, [sp, #192]
1000034a8: f4 4f 4b a9 	ldp	x20, x19, [sp, #176]
1000034ac: f6 57 4a a9 	ldp	x22, x21, [sp, #160]
1000034b0: f8 5f 49 a9 	ldp	x24, x23, [sp, #144]
1000034b4: fa 67 48 a9 	ldp	x26, x25, [sp, #128]
1000034b8: fc 6f 47 a9 	ldp	x28, x27, [sp, #112]
1000034bc: ff 43 03 91 	add	sp, sp, #208
1000034c0: c0 03 5f d6 	ret
1000034c4: 15 00 80 d2 	mov	x21, #0
1000034c8: aa 73 41 a9 	ldp	x10, x28, [x29, #16]
1000034cc: 53 f1 7d d3 	lsl	x19, x10, #3
1000034d0: 14 00 40 b9 	ldr	w20, [x0]
1000034d4: 18 00 00 b0 	adrp	x24, 0x100004000 <_impl_nw_generate_1_block_iter.omp_outlined+0x74>
1000034d8: 18 a3 01 91 	add	x24, x24, #104
1000034dc: 36 00 00 b0 	adrp	x22, 0x100008000 <_impl_nw_generate_1_block_iter.omp_outlined+0x8c>
1000034e0: 17 00 00 b0 	adrp	x23, 0x100004000 <_impl_nw_generate_1_block_iter.omp_outlined+0x80>
1000034e4: f7 62 02 91 	add	x23, x23, #152
1000034e8: f4 37 00 b9 	str	w20, [sp, #52]
1000034ec: 15 00 00 14 	b	0x100003540 <_impl_nw_generate_1_block_iter.omp_outlined+0xdc>
1000034f0: 18 00 00 b0 	adrp	x24, 0x100004000 <_impl_nw_generate_1_block_iter.omp_outlined+0x90>
1000034f4: 18 a3 01 91 	add	x24, x24, #104
1000034f8: e0 03 18 aa 	mov	x0, x24
1000034fc: f4 37 40 b9 	ldr	w20, [sp, #52]
100003500: e1 03 14 aa 	mov	x1, x20
100003504: 67 02 00 94 	bl	0x100003ea0 <_strtod+0x100003ea0>
100003508: 17 00 00 b0 	adrp	x23, 0x100004000 <_impl_nw_generate_1_block_iter.omp_outlined+0xa8>
10000350c: f7 62 02 91 	add	x23, x23, #152
100003510: f9 1f 40 f9 	ldr	x25, [sp, #56]
100003514: e0 03 17 aa 	mov	x0, x23
100003518: e1 03 14 aa 	mov	x1, x20
10000351c: 5e 02 00 94 	bl	0x100003e94 <_strtod+0x100003e94>
100003520: e8 27 44 a9 	ldp	x8, x9, [sp, #64]
100003524: 08 01 40 f9 	ldr	x8, [x8]
100003528: 29 01 40 f9 	ldr	x9, [x9]
10000352c: 0a 01 09 8b 	add	x10, x8, x9
100003530: 4a 05 00 d1 	sub	x10, x10, #1
100003534: f5 03 19 aa 	mov	x21, x25
100003538: 3f 03 0a eb 	cmp	x25, x10
10000353c: 42 fb ff 54 	b.hs	0x1000034a4 <_impl_nw_generate_1_block_iter.omp_outlined+0x40>
100003540: b9 06 00 91 	add	x25, x21, #1
100003544: 2a 03 09 cb 	sub	x10, x25, x9
100003548: bf 02 09 eb 	cmp	x21, x9
10000354c: fa 33 8a 9a 	csel	x26, xzr, x10, lo
100003550: bf 02 08 eb 	cmp	x21, x8
100003554: 08 25 95 9a 	csinc	x8, x8, x21, hs
100003558: 5f 03 08 eb 	cmp	x26, x8
10000355c: c2 fd ff 54 	b.hs	0x100003514 <_impl_nw_generate_1_block_iter.omp_outlined+0xb0>
100003560: f9 1f 00 f9 	str	x25, [sp, #56]
100003564: e9 03 3a aa 	mvn	x9, x26
100003568: bf 83 1a f8 	stur	xzr, [x29, #-88]
10000356c: 17 01 09 8b 	add	x23, x8, x9
100003570: 28 00 80 52 	mov	w8, #1
100003574: e8 df 05 a9 	stp	x8, x23, [sp, #88]
100003578: ff 57 00 b9 	str	wzr, [sp, #84]
10000357c: e8 03 00 f9 	str	x8, [sp]
100003580: e3 53 01 91 	add	x3, sp, #84
100003584: a4 63 01 d1 	sub	x4, x29, #88
100003588: e5 83 01 91 	add	x5, sp, #96
10000358c: e6 63 01 91 	add	x6, sp, #88
100003590: e0 03 18 aa 	mov	x0, x24
100003594: e1 03 14 aa 	mov	x1, x20
100003598: 42 04 80 52 	mov	w2, #34
10000359c: 27 00 80 52 	mov	w7, #1
1000035a0: 46 02 00 94 	bl	0x100003eb8 <_strtod+0x100003eb8>
1000035a4: e8 33 40 f9 	ldr	x8, [sp, #96]
1000035a8: 1f 01 17 eb 	cmp	x8, x23
1000035ac: 08 31 97 9a 	csel	x8, x8, x23, lo
1000035b0: e8 33 00 f9 	str	x8, [sp, #96]
1000035b4: a9 83 5a f8 	ldur	x9, [x29, #-88]
1000035b8: 0a 05 00 91 	add	x10, x8, #1
1000035bc: 3f 01 0a eb 	cmp	x9, x10
1000035c0: 82 f9 ff 54 	b.hs	0x1000034f0 <_impl_nw_generate_1_block_iter.omp_outlined+0x8c>
1000035c4: ea 2f 41 a9 	ldp	x10, x11, [sp, #16]
1000035c8: 4a 01 40 f9 	ldr	x10, [x10]
1000035cc: 6b 01 40 f9 	ldr	x11, [x11]
1000035d0: ec 3b 42 a9 	ldp	x12, x14, [sp, #32]
1000035d4: 8c 01 40 f9 	ldr	x12, [x12]
1000035d8: ed 3f 44 a9 	ldp	x13, x15, [sp, #64]
1000035dc: ad 01 40 f9 	ldr	x13, [x13]
1000035e0: ad 05 00 d1 	sub	x13, x13, #1
1000035e4: ce 01 40 f9 	ldr	x14, [x14]
1000035e8: ef 01 40 f9 	ldr	x15, [x15]
1000035ec: ef 05 00 d1 	sub	x15, x15, #1
1000035f0: 30 00 00 b0 	adrp	x16, 0x100008000 <_impl_nw_generate_1_block_iter.omp_outlined+0x1a0>
1000035f4: 10 12 40 f9 	ldr	x16, [x16, #32]
1000035f8: 31 00 00 b0 	adrp	x17, 0x100008000 <_impl_nw_generate_1_block_iter.omp_outlined+0x1a8>
1000035fc: 31 1a 40 f9 	ldr	x17, [x17, #48]
100003600: 20 00 00 b0 	adrp	x0, 0x100008000 <_impl_nw_generate_1_block_iter.omp_outlined+0x1b0>
100003604: 00 04 40 fd 	ldr	d0, [x0, #8]
100003608: 20 00 00 b0 	adrp	x0, 0x100008000 <_impl_nw_generate_1_block_iter.omp_outlined+0x1b8>
10000360c: 01 08 40 fd 	ldr	d1, [x0, #16]
100003610: 31 06 00 d1 	sub	x17, x17, #1
100003614: 60 f1 7d d3 	lsl	x0, x11, #3
100003618: a1 02 1a cb 	sub	x1, x21, x26
10000361c: 21 00 09 cb 	sub	x1, x1, x9
100003620: 01 7c 01 9b 	mul	x1, x0, x1
100003624: 06 00 00 14 	b	0x10000363c <_impl_nw_generate_1_block_iter.omp_outlined+0x1d8>
100003628: 22 05 00 91 	add	x2, x9, #1
10000362c: 21 00 00 cb 	sub	x1, x1, x0
100003630: 3f 01 08 eb 	cmp	x9, x8
100003634: e9 03 02 aa 	mov	x9, x2
100003638: c0 f5 ff 54 	b.eq	0x1000034f0 <_impl_nw_generate_1_block_iter.omp_outlined+0x8c>
10000363c: 22 01 1a 8b 	add	x2, x9, x26
100003640: a4 02 02 cb 	sub	x4, x21, x2
100003644: 5f 00 0d eb 	cmp	x2, x13
100003648: 84 09 40 fa 	ccmp	x12, #0, #4, eq
10000364c: 42 7d 02 9b 	mul	x2, x10, x2
100003650: 83 01 02 8b 	add	x3, x12, x2
100003654: 45 01 02 8b 	add	x5, x10, x2
100003658: 63 10 85 9a 	csel	x3, x3, x5, ne
10000365c: 9f 00 0f eb 	cmp	x4, x15
100003660: c4 09 40 fa 	ccmp	x14, #0, #4, eq
100003664: 78 7d 04 9b 	mul	x24, x11, x4
100003668: c4 01 18 8b 	add	x4, x14, x24
10000366c: 65 01 18 8b 	add	x5, x11, x24
100003670: 85 10 85 9a 	csel	x5, x4, x5, ne
100003674: 5f 00 03 eb 	cmp	x2, x3
100003678: 02 33 45 fa 	ccmp	x24, x5, #2, lo
10000367c: 62 fd ff 54 	b.hs	0x100003628 <_impl_nw_generate_1_block_iter.omp_outlined+0x1c4>
100003680: 44 04 00 d1 	sub	x4, x2, #1
100003684: 66 06 04 9b 	madd	x6, x19, x4, x1
100003688: 67 06 02 9b 	madd	x7, x19, x2, x1
10000368c: 06 00 00 14 	b	0x1000036a4 <_impl_nw_generate_1_block_iter.omp_outlined+0x240>
100003690: 42 04 00 91 	add	x2, x2, #1
100003694: c6 00 13 8b 	add	x6, x6, x19
100003698: e7 00 13 8b 	add	x7, x7, x19
10000369c: 5f 00 03 eb 	cmp	x2, x3
1000036a0: 40 fc ff 54 	b.eq	0x100003628 <_impl_nw_generate_1_block_iter.omp_outlined+0x1c4>
1000036a4: 62 ff ff b4 	cbz	x2, 0x100003690 <_impl_nw_generate_1_block_iter.omp_outlined+0x22c>
1000036a8: 84 03 40 f9 	ldr	x4, [x28]
1000036ac: 5e 04 00 d1 	sub	x30, x2, #1
1000036b0: 9b 00 06 8b 	add	x27, x4, x6
1000036b4: 97 00 07 8b 	add	x23, x4, x7
1000036b8: e4 03 18 aa 	mov	x4, x24
1000036bc: 06 00 00 14 	b	0x1000036d4 <_impl_nw_generate_1_block_iter.omp_outlined+0x270>
1000036c0: 84 04 00 91 	add	x4, x4, #1
1000036c4: 7b 23 00 91 	add	x27, x27, #8
1000036c8: f7 22 00 91 	add	x23, x23, #8
1000036cc: 9f 00 05 eb 	cmp	x4, x5
1000036d0: 02 fe ff 54 	b.hs	0x100003690 <_impl_nw_generate_1_block_iter.omp_outlined+0x22c>
1000036d4: 64 ff ff b4 	cbz	x4, 0x1000036c0 <_impl_nw_generate_1_block_iter.omp_outlined+0x25c>
1000036d8: 62 83 5f fc 	ldur	d2, [x27, #-8]
1000036dc: 19 6a 7e 38 	ldrb	w25, [x16, x30]
1000036e0: 34 6a 64 38 	ldrb	w20, [x17, x4]
1000036e4: 3f 03 14 6b 	cmp	w25, w20
1000036e8: 03 0c 61 1e 	fcsel	d3, d0, d1, eq
1000036ec: 42 28 63 1e 	fadd	d2, d2, d3
1000036f0: 63 03 40 fd 	ldr	d3, [x27]
1000036f4: c4 0e 40 fd 	ldr	d4, [x22, #24]
1000036f8: 63 28 64 1e 	fadd	d3, d3, d4
1000036fc: e5 82 5f fc 	ldur	d5, [x23, #-8]
100003700: 84 28 65 1e 	fadd	d4, d4, d5
100003704: 60 20 64 1e 	fcmp	d3, d4
100003708: 63 cc 64 1e 	fcsel	d3, d3, d4, gt
10000370c: 40 20 63 1e 	fcmp	d2, d3
100003710: 42 cc 63 1e 	fcsel	d2, d2, d3, gt
100003714: e2 02 00 fd 	str	d2, [x23]
100003718: ea ff ff 17 	b	0x1000036c0 <_impl_nw_generate_1_block_iter.omp_outlined+0x25c>

000000010000371c <_nw_backtrack.omp_outlined>:
10000371c: ff 83 01 d1 	sub	sp, sp, #96
100003720: f8 5f 02 a9 	stp	x24, x23, [sp, #32]
100003724: f6 57 03 a9 	stp	x22, x21, [sp, #48]
100003728: f4 4f 04 a9 	stp	x20, x19, [sp, #64]
10000372c: fd 7b 05 a9 	stp	x29, x30, [sp, #80]
100003730: fd 43 01 91 	add	x29, sp, #80
100003734: f3 03 06 aa 	mov	x19, x6
100003738: f4 03 05 aa 	mov	x20, x5
10000373c: f5 03 04 aa 	mov	x21, x4
100003740: f6 03 03 aa 	mov	x22, x3
100003744: f7 03 02 aa 	mov	x23, x2
100003748: 28 00 80 52 	mov	w8, #1
10000374c: e8 7f 03 29 	stp	w8, wzr, [sp, #24]
100003750: ff 23 02 29 	stp	wzr, w8, [sp, #16]
100003754: 18 00 40 b9 	ldr	w24, [x0]
100003758: e8 03 00 b9 	str	w8, [sp]
10000375c: 00 00 00 b0 	adrp	x0, 0x100004000 <_nw_backtrack.omp_outlined+0x44>
100003760: 00 c0 02 91 	add	x0, x0, #176
100003764: e3 43 00 91 	add	x3, sp, #16
100003768: e4 73 00 91 	add	x4, sp, #28
10000376c: e5 63 00 91 	add	x5, sp, #24
100003770: e6 53 00 91 	add	x6, sp, #20
100003774: e1 03 18 aa 	mov	x1, x24
100003778: 42 04 80 52 	mov	w2, #34
10000377c: 27 00 80 52 	mov	w7, #1
100003780: cb 01 00 94 	bl	0x100003eac <_strtod+0x100003eac>
100003784: e8 1b 40 b9 	ldr	w8, [sp, #24]
100003788: 1f 05 00 71 	cmp	w8, #1
10000378c: 09 b5 9f 1a 	csinc	w9, w8, wzr, lt
100003790: e9 1b 00 b9 	str	w9, [sp, #24]
100003794: e8 1f 40 b9 	ldr	w8, [sp, #28]
100003798: 1f 01 09 6b 	cmp	w8, w9
10000379c: 0d 02 00 54 	b.le	0x1000037dc <_nw_backtrack.omp_outlined+0xc0>
1000037a0: 00 00 00 b0 	adrp	x0, 0x100004000 <_nw_backtrack.omp_outlined+0x88>
1000037a4: 00 c0 02 91 	add	x0, x0, #176
1000037a8: e1 03 18 aa 	mov	x1, x24
1000037ac: bd 01 00 94 	bl	0x100003ea0 <_strtod+0x100003ea0>
1000037b0: fd 7b 45 a9 	ldp	x29, x30, [sp, #80]
1000037b4: f4 4f 44 a9 	ldp	x20, x19, [sp, #64]
1000037b8: f6 57 43 a9 	ldp	x22, x21, [sp, #48]
1000037bc: f8 5f 42 a9 	ldp	x24, x23, [sp, #32]
1000037c0: ff 83 01 91 	add	sp, sp, #96
1000037c4: c0 03 5f d6 	ret
1000037c8: 09 05 00 11 	add	w9, w8, #1
1000037cc: ea 1b 40 b9 	ldr	w10, [sp, #24]
1000037d0: 1f 01 0a 6b 	cmp	w8, w10
1000037d4: e8 03 09 aa 	mov	x8, x9
1000037d8: 4a fe ff 54 	b.ge	0x1000037a0 <_nw_backtrack.omp_outlined+0x84>
1000037dc: 68 02 00 34 	cbz	w8, 0x100003828 <_nw_backtrack.omp_outlined+0x10c>
1000037e0: 1f 05 00 71 	cmp	w8, #1
1000037e4: 21 ff ff 54 	b.ne	0x1000037c8 <_nw_backtrack.omp_outlined+0xac>
1000037e8: eb 02 40 f9 	ldr	x11, [x23]
1000037ec: eb fe ff b4 	cbz	x11, 0x1000037c8 <_nw_backtrack.omp_outlined+0xac>
1000037f0: 09 00 80 d2 	mov	x9, #0
1000037f4: 0a 00 80 92 	mov	x10, #-1
1000037f8: 6c 02 40 f9 	ldr	x12, [x19]
1000037fc: 8b 01 0b 8b 	add	x11, x12, x11
100003800: 6b 69 6a 38 	ldrb	w11, [x11, x10]
100003804: 8c 02 40 f9 	ldr	x12, [x20]
100003808: 8c 01 40 f9 	ldr	x12, [x12]
10000380c: 8b 69 29 38 	strb	w11, [x12, x9]
100003810: 29 05 00 91 	add	x9, x9, #1
100003814: eb 02 40 f9 	ldr	x11, [x23]
100003818: 4a 05 00 d1 	sub	x10, x10, #1
10000381c: 3f 01 0b eb 	cmp	x9, x11
100003820: c3 fe ff 54 	b.lo	0x1000037f8 <_nw_backtrack.omp_outlined+0xdc>
100003824: e9 ff ff 17 	b	0x1000037c8 <_nw_backtrack.omp_outlined+0xac>
100003828: eb 02 40 f9 	ldr	x11, [x23]
10000382c: eb fc ff b4 	cbz	x11, 0x1000037c8 <_nw_backtrack.omp_outlined+0xac>
100003830: 09 00 80 d2 	mov	x9, #0
100003834: 0a 00 80 92 	mov	x10, #-1
100003838: ac 02 40 f9 	ldr	x12, [x21]
10000383c: 8b 01 0b 8b 	add	x11, x12, x11
100003840: 6b 69 6a 38 	ldrb	w11, [x11, x10]
100003844: cc 02 40 f9 	ldr	x12, [x22]
100003848: 8c 01 40 f9 	ldr	x12, [x12]
10000384c: 8b 69 29 38 	strb	w11, [x12, x9]
100003850: 29 05 00 91 	add	x9, x9, #1
100003854: eb 02 40 f9 	ldr	x11, [x23]
100003858: 4a 05 00 d1 	sub	x10, x10, #1
10000385c: 3f 01 0b eb 	cmp	x9, x11
100003860: c3 fe ff 54 	b.lo	0x100003838 <_nw_backtrack.omp_outlined+0x11c>
100003864: d9 ff ff 17 	b	0x1000037c8 <_nw_backtrack.omp_outlined+0xac>

0000000100003868 <_main>:
100003868: ff 83 04 d1 	sub	sp, sp, #288
10000386c: e9 23 0b 6d 	stp	d9, d8, [sp, #176]
100003870: fc 6f 0c a9 	stp	x28, x27, [sp, #192]
100003874: fa 67 0d a9 	stp	x26, x25, [sp, #208]
100003878: f8 5f 0e a9 	stp	x24, x23, [sp, #224]
10000387c: f6 57 0f a9 	stp	x22, x21, [sp, #240]
100003880: f4 4f 10 a9 	stp	x20, x19, [sp, #256]
100003884: fd 7b 11 a9 	stp	x29, x30, [sp, #272]
100003888: fd 43 04 91 	add	x29, sp, #272
10000388c: 08 20 00 51 	sub	w8, w0, #8
100003890: 1f 09 00 31 	cmn	w8, #2
100003894: 62 00 00 54 	b.hs	0x1000038a0 <_main+0x38>
100003898: 20 00 80 52 	mov	w0, #1
10000389c: 73 01 00 14 	b	0x100003e68 <_main+0x600>
1000038a0: f4 03 01 aa 	mov	x20, x1
1000038a4: f3 03 00 aa 	mov	x19, x0
1000038a8: 20 54 42 a9 	ldp	x0, x21, [x1, #32]
1000038ac: 37 00 00 b0 	adrp	x23, 0x100008000 <_main+0x58>
1000038b0: e0 12 00 f9 	str	x0, [x23, #32]
1000038b4: 38 00 00 b0 	adrp	x24, 0x100008000 <_main+0x60>
1000038b8: 15 1b 00 f9 	str	x21, [x24, #48]
1000038bc: 01 00 85 52 	mov	w1, #10240
1000038c0: 61 cd bd 72 	movk	w1, #61035, lsl #16
1000038c4: 95 01 00 94 	bl	0x100003f18 <_strtod+0x100003f18>
1000038c8: f6 03 00 aa 	mov	x22, x0
1000038cc: 3a 00 00 b0 	adrp	x26, 0x100008000 <_main+0x78>
1000038d0: 40 17 00 f9 	str	x0, [x26, #40]
1000038d4: e0 03 15 aa 	mov	x0, x21
1000038d8: 01 00 85 52 	mov	w1, #10240
1000038dc: 61 cd bd 72 	movk	w1, #61035, lsl #16
1000038e0: 8e 01 00 94 	bl	0x100003f18 <_strtod+0x100003f18>
1000038e4: 3b 00 00 b0 	adrp	x27, 0x100008000 <_main+0x90>
1000038e8: 60 1f 00 f9 	str	x0, [x27, #56]
1000038ec: df 0a 00 f1 	cmp	x22, #2
1000038f0: 00 28 42 fa 	ccmp	x0, #2, #0, hs
1000038f4: 62 00 00 54 	b.hs	0x100003900 <_main+0x98>
1000038f8: 40 00 80 52 	mov	w0, #2
1000038fc: 5b 01 00 14 	b	0x100003e68 <_main+0x600>
100003900: 20 00 80 52 	mov	w0, #1
100003904: 7c 01 00 94 	bl	0x100003ef4 <_strtod+0x100003ef4>
100003908: 80 06 40 f9 	ldr	x0, [x20, #8]
10000390c: 01 00 80 d2 	mov	x1, #0
100003910: 85 01 00 94 	bl	0x100003f24 <_strtod+0x100003f24>
100003914: 28 00 00 b0 	adrp	x8, 0x100008000 <_main+0xc0>
100003918: 00 05 00 fd 	str	d0, [x8, #8]
10000391c: 80 0a 40 f9 	ldr	x0, [x20, #16]
100003920: 01 00 80 d2 	mov	x1, #0
100003924: 80 01 00 94 	bl	0x100003f24 <_strtod+0x100003f24>
100003928: 28 00 00 b0 	adrp	x8, 0x100008000 <_main+0xd4>
10000392c: 00 09 00 fd 	str	d0, [x8, #16]
100003930: 80 0e 40 f9 	ldr	x0, [x20, #24]
100003934: 01 00 80 d2 	mov	x1, #0
100003938: 7b 01 00 94 	bl	0x100003f24 <_strtod+0x100003f24>
10000393c: 39 00 00 b0 	adrp	x25, 0x100008000 <_main+0xe8>
100003940: 20 0f 00 fd 	str	d0, [x25, #24]
100003944: 29 00 00 b0 	adrp	x9, 0x100008000 <_main+0xf0>
100003948: 7f 1e 00 71 	cmp	w19, #7
10000394c: 81 00 00 54 	b.ne	0x10000395c <_main+0xf4>
100003950: 88 1a 40 f9 	ldr	x8, [x20, #48]
100003954: 08 01 40 39 	ldrb	w8, [x8]
100003958: 28 01 00 39 	strb	w8, [x9]
10000395c: 49 17 40 f9 	ldr	x9, [x26, #40]
100003960: 68 1f 40 f9 	ldr	x8, [x27, #56]
100003964: 3f 01 08 eb 	cmp	x9, x8
100003968: 02 01 00 54 	b.hs	0x100003988 <_main+0x120>
10000396c: 48 17 00 f9 	str	x8, [x26, #40]
100003970: 69 1f 00 f9 	str	x9, [x27, #56]
100003974: 8b 2a 42 a9 	ldp	x11, x10, [x20, #32]
100003978: ea 12 00 f9 	str	x10, [x23, #32]
10000397c: 0b 1b 00 f9 	str	x11, [x24, #48]
100003980: ea 03 09 aa 	mov	x10, x9
100003984: 03 00 00 14 	b	0x100003990 <_main+0x128>
100003988: ea 03 08 aa 	mov	x10, x8
10000398c: e8 03 09 aa 	mov	x8, x9
100003990: ff ff 04 a9 	stp	xzr, xzr, [sp, #72]
100003994: 08 05 00 91 	add	x8, x8, #1
100003998: 56 05 00 91 	add	x22, x10, #1
10000399c: f6 23 06 a9 	stp	x22, x8, [sp, #96]
1000039a0: 08 7d 16 9b 	mul	x8, x8, x22
1000039a4: 01 f1 7d d3 	lsl	x1, x8, #3
1000039a8: 20 00 80 52 	mov	w0, #1
1000039ac: 49 01 00 94 	bl	0x100003ed0 <_strtod+0x100003ed0>
1000039b0: e0 26 00 b4 	cbz	x0, 0x100003e8c <_main+0x624>
1000039b4: 35 00 00 b0 	adrp	x21, 0x100008000 <_main+0x160>
1000039b8: a0 22 00 f9 	str	x0, [x21, #64]
1000039bc: e0 2f 00 f9 	str	x0, [sp, #88]
1000039c0: e8 83 01 91 	add	x8, sp, #96
1000039c4: e9 63 01 91 	add	x9, sp, #88
1000039c8: e9 23 01 a9 	stp	x9, x8, [sp, #16]
1000039cc: e8 a3 01 91 	add	x8, sp, #104
1000039d0: 14 00 00 b0 	adrp	x20, 0x100004000 <_main+0x16c>
1000039d4: 94 02 02 91 	add	x20, x20, #128
1000039d8: e8 5b 00 a9 	stp	x8, x22, [sp]
1000039dc: 02 00 00 90 	adrp	x2, 0x100003000 <_main+0x174>
1000039e0: 42 b0 04 91 	add	x2, x2, #300
1000039e4: e0 03 14 aa 	mov	x0, x20
1000039e8: 81 00 80 52 	mov	w1, #4
1000039ec: 36 01 00 94 	bl	0x100003ec4 <_strtod+0x100003ec4>
1000039f0: e8 27 46 a9 	ldp	x8, x9, [sp, #96]
1000039f4: 2a fd 4e d3 	lsr	x10, x9, #14
1000039f8: 2b 35 40 f2 	ands	x11, x9, #0x3fff
1000039fc: ab 03 19 f8 	stur	x11, [x29, #-112]
100003a00: 0b fd 4e d3 	lsr	x11, x8, #14
100003a04: 4a 05 8a 9a 	cinc	x10, x10, ne
100003a08: 0c 35 40 f2 	ands	x12, x8, #0x3fff
100003a0c: aa 33 38 a9 	stp	x10, x12, [x29, #-128]
100003a10: 6a 05 8b 9a 	cinc	x10, x11, ne
100003a14: ea 47 00 f9 	str	x10, [sp, #136]
100003a18: 0a 00 88 52 	mov	w10, #16384
100003a1c: 3f 11 40 f1 	cmp	x9, #4, lsl #12         ; =16384
100003a20: 29 31 8a 9a 	csel	x9, x9, x10, lo
100003a24: e9 43 00 f9 	str	x9, [sp, #128]
100003a28: 1f 11 40 f1 	cmp	x8, #4, lsl #12         ; =16384
100003a2c: 09 31 8a 9a 	csel	x9, x8, x10, lo
100003a30: e9 3f 00 f9 	str	x9, [sp, #120]
100003a34: a9 22 40 f9 	ldr	x9, [x21, #64]
100003a38: e9 3b 00 f9 	str	x9, [sp, #112]
100003a3c: e9 c3 01 91 	add	x9, sp, #112
100003a40: e8 27 03 a9 	stp	x8, x9, [sp, #48]
100003a44: a8 e3 01 d1 	sub	x8, x29, #120
100003a48: a9 c3 01 d1 	sub	x9, x29, #112
100003a4c: e9 23 02 a9 	stp	x9, x8, [sp, #32]
100003a50: e8 e3 01 91 	add	x8, sp, #120
100003a54: e9 03 02 91 	add	x9, sp, #128
100003a58: e9 23 01 a9 	stp	x9, x8, [sp, #16]
100003a5c: e8 23 02 91 	add	x8, sp, #136
100003a60: 02 00 00 90 	adrp	x2, 0x100003000 <_main+0x1f8>
100003a64: 42 90 11 91 	add	x2, x2, #1124
100003a68: a9 03 02 d1 	sub	x9, x29, #128
100003a6c: e9 23 00 a9 	stp	x9, x8, [sp]
100003a70: e0 03 14 aa 	mov	x0, x20
100003a74: 01 01 80 52 	mov	w1, #8
100003a78: 13 01 00 94 	bl	0x100003ec4 <_strtod+0x100003ec4>
100003a7c: e8 43 01 91 	add	x8, sp, #80
100003a80: a8 03 19 f8 	stur	x8, [x29, #-112]
100003a84: e8 23 01 91 	add	x8, sp, #72
100003a88: a8 83 18 f8 	stur	x8, [x29, #-120]
100003a8c: 76 1f 40 f9 	ldr	x22, [x27, #56]
100003a90: db 06 00 91 	add	x27, x22, #1
100003a94: bc 22 40 f9 	ldr	x28, [x21, #64]
100003a98: 5a 17 40 f9 	ldr	x26, [x26, #40]
100003a9c: 74 03 1a 8b 	add	x20, x27, x26
100003aa0: e0 03 14 aa 	mov	x0, x20
100003aa4: 21 00 80 52 	mov	w1, #1
100003aa8: 0a 01 00 94 	bl	0x100003ed0 <_strtod+0x100003ed0>
100003aac: 00 1f 00 b4 	cbz	x0, 0x100003e8c <_main+0x624>
100003ab0: a0 03 18 f8 	stur	x0, [x29, #-128]
100003ab4: e0 03 14 aa 	mov	x0, x20
100003ab8: 21 00 80 52 	mov	w1, #1
100003abc: 05 01 00 94 	bl	0x100003ed0 <_strtod+0x100003ed0>
100003ac0: 60 1e 00 b4 	cbz	x0, 0x100003e8c <_main+0x624>
100003ac4: 08 00 80 d2 	mov	x8, #0
100003ac8: ff 03 08 a9 	stp	xzr, x0, [sp, #128]
100003acc: 08 e4 00 2f 	movi	d8, #0000000000000000
100003ad0: 7a 08 00 b4 	cbz	x26, 0x100003bdc <_main+0x374>
100003ad4: 56 08 00 b4 	cbz	x22, 0x100003bdc <_main+0x374>
100003ad8: 08 00 80 d2 	mov	x8, #0
100003adc: 20 0f 40 fd 	ldr	d0, [x25, #24]
100003ae0: 29 00 00 b0 	adrp	x9, 0x100008000 <_main+0x28c>
100003ae4: 29 21 00 91 	add	x9, x9, #8
100003ae8: aa 05 80 52 	mov	w10, #45
100003aec: 2b 00 00 b0 	adrp	x11, 0x100008000 <_main+0x298>
100003af0: 6b 41 00 91 	add	x11, x11, #16
100003af4: ec 12 40 f9 	ldr	x12, [x23, #32]
100003af8: 4d 07 00 d1 	sub	x13, x26, #1
100003afc: 8e 69 6d 38 	ldrb	w14, [x12, x13]
100003b00: 0f 1b 40 f9 	ldr	x15, [x24, #48]
100003b04: cc 06 00 d1 	sub	x12, x22, #1
100003b08: ef 69 6c 38 	ldrb	w15, [x15, x12]
100003b0c: df 01 0f 6b 	cmp	w14, w15
100003b10: 2f 01 8b 9a 	csel	x15, x9, x11, eq
100003b14: 50 7f 1b 9b 	mul	x16, x26, x27
100003b18: 90 0f 10 8b 	add	x16, x28, x16, lsl #3
100003b1c: 02 7a 76 fc 	ldr	d2, [x16, x22, lsl #3]
100003b20: 01 7a 6c fc 	ldr	d1, [x16, x12, lsl #3]
100003b24: 21 28 60 1e 	fadd	d1, d1, d0
100003b28: 40 20 61 1e 	fcmp	d2, d1
100003b2c: 41 01 00 54 	b.ne	0x100003b54 <_main+0x2ec>
100003b30: ad 03 58 f8 	ldur	x13, [x29, #-128]
100003b34: aa 69 28 38 	strb	w10, [x13, x8]
100003b38: 08 1b 40 f9 	ldr	x8, [x24, #48]
100003b3c: 08 69 6c 38 	ldrb	w8, [x8, x12]
100003b40: ee 37 48 a9 	ldp	x14, x13, [sp, #128]
100003b44: a8 69 2e 38 	strb	w8, [x13, x14]
100003b48: 20 0f 40 fd 	ldr	d0, [x25, #24]
100003b4c: 01 40 60 1e 	fmov	d1, d0
100003b50: 1c 00 00 14 	b	0x100003bc0 <_main+0x358>
100003b54: b0 7d 1b 9b 	mul	x16, x13, x27
100003b58: 90 0f 10 8b 	add	x16, x28, x16, lsl #3
100003b5c: 01 7a 76 fc 	ldr	d1, [x16, x22, lsl #3]
100003b60: 01 28 61 1e 	fadd	d1, d0, d1
100003b64: 40 20 61 1e 	fcmp	d2, d1
100003b68: 21 01 00 54 	b.ne	0x100003b8c <_main+0x324>
100003b6c: ac 03 58 f8 	ldur	x12, [x29, #-128]
100003b70: 8e 69 28 38 	strb	w14, [x12, x8]
100003b74: ec 23 48 a9 	ldp	x12, x8, [sp, #128]
100003b78: 0a 69 2c 38 	strb	w10, [x8, x12]
100003b7c: 20 0f 40 fd 	ldr	d0, [x25, #24]
100003b80: 01 40 60 1e 	fmov	d1, d0
100003b84: ec 03 16 aa 	mov	x12, x22
100003b88: 0d 00 00 14 	b	0x100003bbc <_main+0x354>
100003b8c: e1 01 40 fd 	ldr	d1, [x15]
100003b90: 03 7a 6c fc 	ldr	d3, [x16, x12, lsl #3]
100003b94: 23 28 63 1e 	fadd	d3, d1, d3
100003b98: 40 20 63 1e 	fcmp	d2, d3
100003b9c: 81 01 00 54 	b.ne	0x100003bcc <_main+0x364>
100003ba0: af 03 58 f8 	ldur	x15, [x29, #-128]
100003ba4: ee 69 28 38 	strb	w14, [x15, x8]
100003ba8: 08 1b 40 f9 	ldr	x8, [x24, #48]
100003bac: 08 69 6c 38 	ldrb	w8, [x8, x12]
100003bb0: ef 3b 48 a9 	ldp	x15, x14, [sp, #128]
100003bb4: c8 69 2f 38 	strb	w8, [x14, x15]
100003bb8: 20 0f 40 fd 	ldr	d0, [x25, #24]
100003bbc: fa 03 0d aa 	mov	x26, x13
100003bc0: 28 28 68 1e 	fadd	d8, d1, d8
100003bc4: e8 43 40 f9 	ldr	x8, [sp, #128]
100003bc8: f6 03 0c aa 	mov	x22, x12
100003bcc: 08 05 00 91 	add	x8, x8, #1
100003bd0: e8 43 00 f9 	str	x8, [sp, #128]
100003bd4: 5a 00 00 b4 	cbz	x26, 0x100003bdc <_main+0x374>
100003bd8: f6 f8 ff b5 	cbnz	x22, 0x100003af4 <_main+0x28c>
100003bdc: 36 02 00 b4 	cbz	x22, 0x100003c20 <_main+0x3b8>
100003be0: c9 06 00 d1 	sub	x9, x22, #1
100003be4: aa 05 80 52 	mov	w10, #45
100003be8: ab 03 58 f8 	ldur	x11, [x29, #-128]
100003bec: 6a 69 28 38 	strb	w10, [x11, x8]
100003bf0: 08 1b 40 f9 	ldr	x8, [x24, #48]
100003bf4: 08 69 69 38 	ldrb	w8, [x8, x9]
100003bf8: ec 2f 48 a9 	ldp	x12, x11, [sp, #128]
100003bfc: 68 69 2c 38 	strb	w8, [x11, x12]
100003c00: 20 0f 40 fd 	ldr	d0, [x25, #24]
100003c04: 08 28 68 1e 	fadd	d8, d0, d8
100003c08: e8 43 40 f9 	ldr	x8, [sp, #128]
100003c0c: 08 05 00 91 	add	x8, x8, #1
100003c10: e8 43 00 f9 	str	x8, [sp, #128]
100003c14: 29 05 00 d1 	sub	x9, x9, #1
100003c18: 3f 05 00 b1 	cmn	x9, #1
100003c1c: 61 fe ff 54 	b.ne	0x100003be8 <_main+0x380>
100003c20: 3a 02 00 b4 	cbz	x26, 0x100003c64 <_main+0x3fc>
100003c24: 49 07 00 d1 	sub	x9, x26, #1
100003c28: aa 05 80 52 	mov	w10, #45
100003c2c: eb 12 40 f9 	ldr	x11, [x23, #32]
100003c30: 6b 69 69 38 	ldrb	w11, [x11, x9]
100003c34: ac 03 58 f8 	ldur	x12, [x29, #-128]
100003c38: 8b 69 28 38 	strb	w11, [x12, x8]
100003c3c: eb 23 48 a9 	ldp	x11, x8, [sp, #128]
100003c40: 0a 69 2b 38 	strb	w10, [x8, x11]
100003c44: 20 0f 40 fd 	ldr	d0, [x25, #24]
100003c48: 08 28 68 1e 	fadd	d8, d0, d8
100003c4c: e8 43 40 f9 	ldr	x8, [sp, #128]
100003c50: 08 05 00 91 	add	x8, x8, #1
100003c54: e8 43 00 f9 	str	x8, [sp, #128]
100003c58: 29 05 00 d1 	sub	x9, x9, #1
100003c5c: 3f 05 00 b1 	cmn	x9, #1
100003c60: 61 fe ff 54 	b.ne	0x100003c2c <_main+0x3c4>
100003c64: 14 05 00 91 	add	x20, x8, #1
100003c68: e0 03 14 aa 	mov	x0, x20
100003c6c: 21 00 80 52 	mov	w1, #1
100003c70: 98 00 00 94 	bl	0x100003ed0 <_strtod+0x100003ed0>
100003c74: c0 10 00 b4 	cbz	x0, 0x100003e8c <_main+0x624>
100003c78: a8 03 59 f8 	ldur	x8, [x29, #-112]
100003c7c: 00 01 00 f9 	str	x0, [x8]
100003c80: e0 03 14 aa 	mov	x0, x20
100003c84: 21 00 80 52 	mov	w1, #1
100003c88: 92 00 00 94 	bl	0x100003ed0 <_strtod+0x100003ed0>
100003c8c: 00 10 00 b4 	cbz	x0, 0x100003e8c <_main+0x624>
100003c90: a8 83 58 f8 	ldur	x8, [x29, #-120]
100003c94: 00 01 00 f9 	str	x0, [x8]
100003c98: e0 03 14 aa 	mov	x0, x20
100003c9c: 21 00 80 52 	mov	w1, #1
100003ca0: 8c 00 00 94 	bl	0x100003ed0 <_strtod+0x100003ed0>
100003ca4: 40 0f 00 b4 	cbz	x0, 0x100003e8c <_main+0x624>
100003ca8: f4 03 00 aa 	mov	x20, x0
100003cac: e8 23 02 91 	add	x8, sp, #136
100003cb0: e8 13 00 f9 	str	x8, [sp, #32]
100003cb4: a8 e3 01 d1 	sub	x8, x29, #120
100003cb8: a9 03 02 d1 	sub	x9, x29, #128
100003cbc: e9 23 01 a9 	stp	x9, x8, [sp, #16]
100003cc0: a8 c3 01 d1 	sub	x8, x29, #112
100003cc4: e9 03 02 91 	add	x9, sp, #128
100003cc8: 00 00 00 b0 	adrp	x0, 0x100004000 <_main+0x464>
100003ccc: 00 00 02 91 	add	x0, x0, #128
100003cd0: e9 23 00 a9 	stp	x9, x8, [sp]
100003cd4: 02 00 00 90 	adrp	x2, 0x100003000 <_main+0x46c>
100003cd8: 42 70 1c 91 	add	x2, x2, #1820
100003cdc: a1 00 80 52 	mov	w1, #5
100003ce0: 79 00 00 94 	bl	0x100003ec4 <_strtod+0x100003ec4>
100003ce4: f7 43 40 f9 	ldr	x23, [sp, #128]
100003ce8: 77 08 00 b4 	cbz	x23, 0x100003df4 <_main+0x58c>
100003cec: a9 a3 78 a9 	ldp	x9, x8, [x29, #-120]
100003cf0: 08 01 40 f9 	ldr	x8, [x8]
100003cf4: 29 01 40 f9 	ldr	x9, [x9]
100003cf8: 2a 00 00 b0 	adrp	x10, 0x100008000 <_main+0x4a4>
100003cfc: 4a 01 40 39 	ldrb	w10, [x10]
100003d00: ff 22 00 f1 	cmp	x23, #8
100003d04: 62 00 00 54 	b.hs	0x100003d10 <_main+0x4a8>
100003d08: 0b 00 80 d2 	mov	x11, #0
100003d0c: 31 00 00 14 	b	0x100003dd0 <_main+0x568>
100003d10: ff 02 01 f1 	cmp	x23, #64
100003d14: 62 00 00 54 	b.hs	0x100003d20 <_main+0x4b8>
100003d18: 0b 00 80 d2 	mov	x11, #0
100003d1c: 1c 00 00 14 	b	0x100003d8c <_main+0x524>
100003d20: 40 0d 01 4e 	dup.16b	v0, w10
100003d24: eb e6 7a 92 	and	x11, x23, #0xffffffffffffffc0
100003d28: 0c 81 00 91 	add	x12, x8, #32
100003d2c: 8d 82 00 91 	add	x13, x20, #32
100003d30: 2e 81 00 91 	add	x14, x9, #32
100003d34: 01 e4 01 4f 	movi.16b	v1, #32
100003d38: ef 03 0b aa 	mov	x15, x11
100003d3c: 82 0d 7f ad 	ldp	q2, q3, [x12, #-32]
100003d40: 84 15 c2 ac 	ldp	q4, q5, [x12], #64
100003d44: c6 1d 7f ad 	ldp	q6, q7, [x14, #-32]
100003d48: d0 45 c2 ac 	ldp	q16, q17, [x14], #64
100003d4c: 42 8c 26 6e 	cmeq.16b	v2, v2, v6
100003d50: 63 8c 27 6e 	cmeq.16b	v3, v3, v7
100003d54: 84 8c 30 6e 	cmeq.16b	v4, v4, v16
100003d58: a5 8c 31 6e 	cmeq.16b	v5, v5, v17
100003d5c: 02 1c 61 6e 	bsl.16b	v2, v0, v1
100003d60: 03 1c 61 6e 	bsl.16b	v3, v0, v1
100003d64: 04 1c 61 6e 	bsl.16b	v4, v0, v1
100003d68: 05 1c 61 6e 	bsl.16b	v5, v0, v1
100003d6c: a2 0d 3f ad 	stp	q2, q3, [x13, #-32]
100003d70: a4 15 82 ac 	stp	q4, q5, [x13], #64
100003d74: ef 01 01 f1 	subs	x15, x15, #64
100003d78: 21 fe ff 54 	b.ne	0x100003d3c <_main+0x4d4>
100003d7c: ff 02 0b eb 	cmp	x23, x11
100003d80: a0 03 00 54 	b.eq	0x100003df4 <_main+0x58c>
100003d84: ff 0a 7d f2 	tst	x23, #0x38
100003d88: 40 02 00 54 	b.eq	0x100003dd0 <_main+0x568>
100003d8c: ef 03 0b aa 	mov	x15, x11
100003d90: 40 0d 01 0e 	dup.8b	v0, w10
100003d94: eb f2 7d 92 	and	x11, x23, #0xfffffffffffffff8
100003d98: 0c 01 0f 8b 	add	x12, x8, x15
100003d9c: 2d 01 0f 8b 	add	x13, x9, x15
100003da0: 8e 02 0f 8b 	add	x14, x20, x15
100003da4: ef 01 0b cb 	sub	x15, x15, x11
100003da8: 01 e4 01 0f 	movi.8b	v1, #32
100003dac: 82 85 40 fc 	ldr	d2, [x12], #8
100003db0: a3 85 40 fc 	ldr	d3, [x13], #8
100003db4: 42 8c 23 2e 	cmeq.8b	v2, v2, v3
100003db8: 02 1c 61 2e 	bsl.8b	v2, v0, v1
100003dbc: c2 85 00 fc 	str	d2, [x14], #8
100003dc0: ef 21 00 b1 	adds	x15, x15, #8
100003dc4: 41 ff ff 54 	b.ne	0x100003dac <_main+0x544>
100003dc8: ff 02 0b eb 	cmp	x23, x11
100003dcc: 40 01 00 54 	b.eq	0x100003df4 <_main+0x58c>
100003dd0: 0c 04 80 52 	mov	w12, #32
100003dd4: 0d 69 6b 38 	ldrb	w13, [x8, x11]
100003dd8: 2e 69 6b 38 	ldrb	w14, [x9, x11]
100003ddc: bf 01 0e 6b 	cmp	w13, w14
100003de0: 4d 01 8c 1a 	csel	w13, w10, w12, eq
100003de4: 8d 6a 2b 38 	strb	w13, [x20, x11]
100003de8: 6b 05 00 91 	add	x11, x11, #1
100003dec: ff 02 0b eb 	cmp	x23, x11
100003df0: 21 ff ff 54 	b.ne	0x100003dd4 <_main+0x56c>
100003df4: a0 03 58 f8 	ldur	x0, [x29, #-128]
100003df8: 3c 00 00 94 	bl	0x100003ee8 <_strtod+0x100003ee8>
100003dfc: e0 47 40 f9 	ldr	x0, [sp, #136]
100003e00: 3a 00 00 94 	bl	0x100003ee8 <_strtod+0x100003ee8>
100003e04: f7 03 00 f9 	str	x23, [sp]
100003e08: 00 00 00 90 	adrp	x0, 0x100003000 <_main+0x5a0>
100003e0c: 00 1c 3e 91 	add	x0, x0, #3975
100003e10: 3c 00 00 94 	bl	0x100003f00 <_strtod+0x100003f00>
100003e14: e8 03 00 fd 	str	d8, [sp]
100003e18: 00 00 00 90 	adrp	x0, 0x100003000 <_main+0x5b0>
100003e1c: 00 30 3e 91 	add	x0, x0, #3980
100003e20: 38 00 00 94 	bl	0x100003f00 <_strtod+0x100003f00>
100003e24: e0 2b 40 f9 	ldr	x0, [sp, #80]
100003e28: 39 00 00 94 	bl	0x100003f0c <_strtod+0x100003f0c>
100003e2c: 7f 1e 00 71 	cmp	w19, #7
100003e30: 61 00 00 54 	b.ne	0x100003e3c <_main+0x5d4>
100003e34: e0 03 14 aa 	mov	x0, x20
100003e38: 35 00 00 94 	bl	0x100003f0c <_strtod+0x100003f0c>
100003e3c: e0 27 40 f9 	ldr	x0, [sp, #72]
100003e40: 33 00 00 94 	bl	0x100003f0c <_strtod+0x100003f0c>
100003e44: a0 22 40 f9 	ldr	x0, [x21, #64]
100003e48: 28 00 00 94 	bl	0x100003ee8 <_strtod+0x100003ee8>
100003e4c: e0 2b 40 f9 	ldr	x0, [sp, #80]
100003e50: 26 00 00 94 	bl	0x100003ee8 <_strtod+0x100003ee8>
100003e54: e0 27 40 f9 	ldr	x0, [sp, #72]
100003e58: 24 00 00 94 	bl	0x100003ee8 <_strtod+0x100003ee8>
100003e5c: e0 03 14 aa 	mov	x0, x20
100003e60: 22 00 00 94 	bl	0x100003ee8 <_strtod+0x100003ee8>
100003e64: 00 00 80 52 	mov	w0, #0
100003e68: fd 7b 51 a9 	ldp	x29, x30, [sp, #272]
100003e6c: f4 4f 50 a9 	ldp	x20, x19, [sp, #256]
100003e70: f6 57 4f a9 	ldp	x22, x21, [sp, #240]
100003e74: f8 5f 4e a9 	ldp	x24, x23, [sp, #224]
100003e78: fa 67 4d a9 	ldp	x26, x25, [sp, #208]
100003e7c: fc 6f 4c a9 	ldp	x28, x27, [sp, #192]
100003e80: e9 23 4b 6d 	ldp	d9, d8, [sp, #176]
100003e84: ff 83 04 91 	add	sp, sp, #288
100003e88: c0 03 5f d6 	ret
100003e8c: 20 00 80 52 	mov	w0, #1
100003e90: 13 00 00 94 	bl	0x100003edc <_strtod+0x100003edc>

Disassembly of section __TEXT,__stubs:

0000000100003e94 <__stubs>:
100003e94: 10 00 00 b0 	adrp	x16, 0x100004000 <__stubs+0x4>
100003e98: 10 02 40 f9 	ldr	x16, [x16]
100003e9c: 00 02 1f d6 	br	x16
100003ea0: 10 00 00 b0 	adrp	x16, 0x100004000 <__stubs+0x10>
100003ea4: 10 06 40 f9 	ldr	x16, [x16, #8]
100003ea8: 00 02 1f d6 	br	x16
100003eac: 10 00 00 b0 	adrp	x16, 0x100004000 <__stubs+0x1c>
100003eb0: 10 0a 40 f9 	ldr	x16, [x16, #16]
100003eb4: 00 02 1f d6 	br	x16
100003eb8: 10 00 00 b0 	adrp	x16, 0x100004000 <__stubs+0x28>
100003ebc: 10 0e 40 f9 	ldr	x16, [x16, #24]
100003ec0: 00 02 1f d6 	br	x16
100003ec4: 10 00 00 b0 	adrp	x16, 0x100004000 <__stubs+0x34>
100003ec8: 10 12 40 f9 	ldr	x16, [x16, #32]
100003ecc: 00 02 1f d6 	br	x16
100003ed0: 10 00 00 b0 	adrp	x16, 0x100004000 <__stubs+0x40>
100003ed4: 10 16 40 f9 	ldr	x16, [x16, #40]
100003ed8: 00 02 1f d6 	br	x16
100003edc: 10 00 00 b0 	adrp	x16, 0x100004000 <__stubs+0x4c>
100003ee0: 10 1a 40 f9 	ldr	x16, [x16, #48]
100003ee4: 00 02 1f d6 	br	x16
100003ee8: 10 00 00 b0 	adrp	x16, 0x100004000 <__stubs+0x58>
100003eec: 10 1e 40 f9 	ldr	x16, [x16, #56]
100003ef0: 00 02 1f d6 	br	x16
100003ef4: 10 00 00 b0 	adrp	x16, 0x100004000 <__stubs+0x64>
100003ef8: 10 22 40 f9 	ldr	x16, [x16, #64]
100003efc: 00 02 1f d6 	br	x16
100003f00: 10 00 00 b0 	adrp	x16, 0x100004000 <__stubs+0x70>
100003f04: 10 26 40 f9 	ldr	x16, [x16, #72]
100003f08: 00 02 1f d6 	br	x16
100003f0c: 10 00 00 b0 	adrp	x16, 0x100004000 <__stubs+0x7c>
100003f10: 10 2a 40 f9 	ldr	x16, [x16, #80]
100003f14: 00 02 1f d6 	br	x16
100003f18: 10 00 00 b0 	adrp	x16, 0x100004000 <__stubs+0x88>
100003f1c: 10 2e 40 f9 	ldr	x16, [x16, #88]
100003f20: 00 02 1f d6 	br	x16
100003f24: 10 00 00 b0 	adrp	x16, 0x100004000 <__stubs+0x94>
100003f28: 10 32 40 f9 	ldr	x16, [x16, #96]
100003f2c: 00 02 1f d6 	br	x16
