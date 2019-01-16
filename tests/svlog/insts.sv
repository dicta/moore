///////////////////////
///  Empty modules  ///
///////////////////////

module A;
	B b();
endmodule

module B;
endmodule

//@ elab A
//| entity @B () () {
//| }
//|
//| entity @A () () {
//|     %b = inst @B () ()
//| }


//////////////////////////////////
///  Type parameter overrides  ///
//////////////////////////////////

module C;
	D #(void) d1();
	D #(bit) d2();
endmodule

module D #(type T) (input T t);
endmodule

//@ elab C
//| entity @D.param1 (void$ %t) () {
//| }
//|
//| entity @D.param2 (i1$ %t) () {
//| }
//|
//| entity @C () () {
//|     %d1 = inst @D.param1 () ()
//|     %d2 = inst @D.param2 () ()
//| }


//////////////////////////////////////
///  Default type parameter types  ///
//////////////////////////////////////

module E #(type T = bit) (input T t);
endmodule

//@ elab E
//| entity @E (i1$ %t) () {
//| }


//////////////////////////////////////////////
///  Dependencies between type parameters  ///
//////////////////////////////////////////////

module F;
	G #(bit) g1();
	G #(void) g2();
	G #(void, bit) g3();
endmodule

module G #(type T, type R = T) (input T t, input R r);
endmodule

//@ elab F
//| entity @G.param3 (i1$ %t, i1$ %r) () {
//| }
//|
//| entity @G.param4 (void$ %t, void$ %r) () {
//| }
//|
//| entity @G.param5 (void$ %t, i1$ %r) () {
//| }
//|
//| entity @F () () {
//|     %g1 = inst @G.param3 () ()
//|     %g2 = inst @G.param4 () ()
//|     %g3 = inst @G.param5 () ()
//| }


//////////////////////////
///  Value parameters  ///
//////////////////////////

module H;
    I i1();
    I #(0) i2();
    I #(1) i3();
endmodule

module I #(int K = 0) (output int k = K);
endmodule

//@ elab H
//| entity @I () (i32$ %k) {
//|     drv %k 0
//| }
//|
//| entity @I.param6 () (i32$ %k) {
//|     drv %k 0
//| }
//|
//| entity @I.param7 () (i32$ %k) {
//|     drv %k 1
//| }
//|
//| entity @H () () {
//|     %i1 = inst @I () ()
//|     %i2 = inst @I.param6 () ()
//|     %i3 = inst @I.param7 () ()
//| }
