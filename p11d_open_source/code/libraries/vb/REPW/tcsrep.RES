        ��  ��                  �2      �� ��       	                  �        < S T Y L E >   
 B O D Y   
 {   
 F O N T - F A M I L Y :   A r i a l ;   
 }   
 T D . U P   
 {   
 B O R D E R - B O T T O M :   # f f 6 6 0 0   2 p x   s o l i d ;   
 B O R D E R - L E F T :   # f f 6 6 0 0   2 p x   s o l i d ;   
 B O R D E R - R I G H T :   # f f 6 6 0 0   2 p x   s o l i d ;   
 B O R D E R - T O P :   # f f 6 6 0 0   2 p x   s o l i d ;   
 C O L O R :   # f f 6 6 0 0 ;   
 F O N T - F A M I L Y :   A r i a l ;   
 F O N T - W E I G H T :   B O L D ;   
 C U R S O R :   h a n d ;   
 }   
 T D . D O W N   
 {   
 B A C K G R O U N D - C O L O R :   # f f f f f f ;   
 B O R D E R - B O T T O M :   # f f f f f f   2 p x   s o l i d ;   
 B O R D E R - L E F T :   # f f f f f f   2 p x   s o l i d ;   
 B O R D E R - R I G H T :   # f f f f f f   2 p x   s o l i d ;   
 B O R D E R - T O P :   # f f f f f f   2 p x   s o l i d ;   
 C O L O R :   b l a c k ;   
 F O N T - F A M I L Y :   A r i a l ;   
 F O N T - W E I G H T :   B O L D ;   
 C U R S O R :   h a n d ;   
 }   
 T D . N O A C T I O N   
 {   
 B A C K G R O U N D - C O L O R :   # f f f f f f ;   
 B O R D E R - B O T T O M :   # f f f f f f   2 p x   s o l i d ;   
 B O R D E R - L E F T :   # f f f f f f   2 p x   s o l i d ;   
 B O R D E R - R I G H T :   # f f f f f f   2 p x   s o l i d ;   
 B O R D E R - T O P :   # f f f f f f   2 p x   s o l i d ;   
 C O L O R :   # f f 6 6 0 0 ;   
 F O N T - F A M I L Y :   A r i a l ;   
 F O N T - W E I G H T :   B O L D ;   
 }   
 < / S T Y L E > �< S C R I P T   L A N G U A G E = j a v a s c r i p t >   
 < ! - -   
 v a r   C u r r e n t P a g e ;   
 v a r   M a x P a g e ;   
 v a r   C u r r e n t P r i n t P a g e ;   
 v a r   S e t P a g e   =   t r u e ;   
 M a x P a g e = [ M a x P a g e ] ;   
 C u r r e n t P a g e = 1 ;   
 f u n c t i o n   P r i n t P a g e s ( )   
 {   
 S e t P a g e = f a l s e ;   
 C u r r e n t P r i n t P a g e = 1 ;   
 d o c u m e n t . a l l ( ' P a g e '   +   C u r r e n t P a g e ) . s t y l e . d i s p l a y = ' n o n e ' ;   
 N a v . s t y l e . d i s p l a y = ' n o n e ' ;   
 H o l d e r . s t y l e . o v e r f l o w = ' v i s i b l e ' ;   
 w h i l e   ( C u r r e n t P r i n t P a g e   < =   M a x P a g e )   
 {   
 i f   (   C u r r e n t P r i n t P a g e   ! =   1   )   
 {   d o c u m e n t . a l l ( ' P a g e '   +   ( C u r r e n t P r i n t P a g e   -   1 ) ) . s t y l e . d i s p l a y = ' n o n e ' ;   }   
 d o c u m e n t . a l l ( ' P a g e '   +   C u r r e n t P r i n t P a g e ) . s t y l e . d i s p l a y = ' b l o c k ' ;   
 i f ( ( C u r r e n t P r i n t P a g e   %   2 ) = = 0 )   
 {   w i n d o w . r e s i z e B y ( 0 , - 1 ) ;   }   
 e l s e   
 {   w i n d o w . r e s i z e B y ( 0 , + 1 ) ;   }   
 t o p . s t a t u s = ' P r i n t i n g :   '   +   C u r r e n t P r i n t P a g e ; P r i n t ( ) ;   
 d o c u m e n t . a l l ( ' P a g e '   +   C u r r e n t P r i n t P a g e ) . s t y l e . d i s p l a y = ' n o n e ' ;   
 C u r r e n t P r i n t P a g e + + ;   
 }   
 N a v . s t y l e . d i s p l a y = ' b l o c k ' ;   
 H o l d e r . s t y l e . o v e r f l o w = ' s c r o l l ' ;   
 d o c u m e n t . a l l ( ' P a g e '   +   C u r r e n t P a g e ) . s t y l e . d i s p l a y = ' b l o c k ' ;   
 t o p . s t a t u s = ' ' ; S e t P a g e = t r u e ;   
 }   
 f u n c t i o n   C h a n g e P a g e ( P a g e D i r )   
 {   
 d o c u m e n t . a l l ( ' P a g e '   +   C u r r e n t P a g e ) . s t y l e . d i s p l a y = ' n o n e ' ;   
 i f ( P a g e D i r = = 1 )   
 {   
 C u r r e n t P a g e = 1 ;   
 }   
 e l s e   i f ( P a g e D i r = = 2 )   
 {   
 C u r r e n t P a g e - - ;   
 i f ( C u r r e n t P a g e < 1 )   
 {   
 C u r r e n t P a g e = 1 ;   
 }   
 }   
 e l s e   i f ( P a g e D i r = = 3 )   
 {   
 C u r r e n t P a g e + + ;   
 i f ( C u r r e n t P a g e > M a x P a g e )   
 {   
 C u r r e n t P a g e = M a x P a g e ;   
 }   
 }   
 e l s e   i f ( P a g e D i r = = 4 )   
 {   
 C u r r e n t P a g e = M a x P a g e ;   
 }   
 d o c u m e n t . a l l ( ' P a g e '   +   C u r r e n t P a g e ) . s t y l e . d i s p l a y = ' b l o c k ' ;             I n f o . i n n e r H T M L = ' P a g e   '   +   C u r r e n t P a g e   +   '   o f   '   +   M a x P a g e ;   
 }   
 f u n c t i o n   S h o w H e l p ( )   
 {   
 s h o w M o d a l D i a l o g ( w i n d o w . l o c a t i o n . h r e f , " D i a l o g " , " d i a l o g h e i g h t :   3 0 0 p x ;   d i a l o g w i d t h :   4 0 0 p x ;   h e l p :   n o ;   s t a t u s :   n o ; " ) ;   
 }   
 f u n c t i o n   S e t D o w n l o a d ( )   
 {   
 v a r   b I s I E   =   n a v i g a t o r . a p p N a m e   = =   " M i c r o s o f t   I n t e r n e t   E x p l o r e r "   ;   
 v a r   M S I E = n a v i g a t o r . u s e r A g e n t ;   
 v a r   i M S I E = M S I E . i n d e x O f ( " M S I E   " ) ;   
 v a r   i M a j o r = M S I E . c h a r A t ( i M S I E + 5 ) ;   
 v a r   i M i n o r = M S I E . c h a r A t ( i M S I E + 7 ) ;   
 v a r   b I s I E 5 5   =   b I s I E   & &   ( i M a j o r = = 5 )   & &   ( i M i n o r = = 5 ) ;   
 v a r   b I s I E 5   =   b I s I E   & &   ( i M a j o r = = 5 )   & &   ( i M i n o r = = 0 ) ;   
 v a r   b I s I E 4   =   b I s I E   & &   ( i M a j o r = = 4 ) ;   
 v a r   B r o w s e r S t r i n g   =   " " ;   
 i f ( b I s I E 5 )   
 {   
 B r o w s e r S t r i n g = " Y o u   a r e   v i e w i n g   t h i s   R e p o r t   w i t h   I E   5 .   W e   r e c o m m e n d   I E   5 . 5 . "   
 D o w n l o a d S e c t i o n . s t y l e . d i s p l a y = ' b l o c k ' ;   
 }   
 e l s e   i f   ( b I s I E 4 )   
 {   
 B r o w s e r S t r i n g = " Y o u   a r e   v i e w i n g   t h i s   R e p o r t   w i t h   I E   4 .   W e   r e c o m m e n d   I E   5 . 5 . "   
 D o w n l o a d S e c t i o n . s t y l e . d i s p l a y = ' b l o c k ' ;   
 }   
 D o w n l o a d S e c t i o n . i n n e r H T M L = B r o w s e r S t r i n g ;   
 }   
 f u n c t i o n   c h e c k H e l p ( )   
 {   
 i f ( w i n d o w . d i a l o g A r g u m e n t s ! = ' D i a l o g ' )   
 {   
 W h o l e T h i n g . s t y l e . d i s p l a y = ' b l o c k ' ;   
 }   
 e l s e   
 {   
 d o c u m e n t . b o d y . i n n e r H T M L = " [ H e l p ] " ;   
 }   
 }   
 - - >   
 < / S C R I P T >   
 < S C R I P T   L A N G U A G E = v b s c r i p t >   
 < ! - -   
 S u b   S e t S c r e e n ( )   
 D i m   h g t   
 i f   S e t P a g e   T h e n   
 h g t   =   N a v . S t y l e . H e i g h t   
 h g t   =   L e f t ( h g t ,   L e n ( h g t )   -   2 )   
 h g t   =   D o c u m e n t . b o d y . o f f s e t H e i g h t   -   h g t   -   2 0   
 H o l d e r . S t y l e . H e i g h t   =   h g t   
 C a l l   C h a n g e P a g e ( 1 )   
 C a l l   c h e c k H e l p   
 E n d   I f   
 E n d   S u b   
 S u b   P r i n t ( )   
 O n   E r r o r   R e s u m e   N e x t   
 C a l l   d o c u m e n t . b o d y . i n s e r t A d j a c e n t H T M L ( " b e f o r e E n d " ,   " < o b j e c t   i d = ' i d W B P r i n t '   w i d t h = 0   h e i g h t = 0   c l a s s i d = ' c l s i d : 8 8 5 6 F 9 6 1 - 3 4 0 A - 1 1 D 0 - A 9 6 B - 0 0 C 0 4 F D 7 0 5 A 2 ' > < / o b j e c t > " )   
 C a l l   d o c u m e n t . A l l ( " i d W B P r i n t " ) . E x e c W B ( 6 ,   1 )   
 i d W B P r i n t . o u t e r H T M L   =   " "   
 E n d   S u b   
 - - >   
 < / S C R I P T > �< B O D Y   l e f t m a r g i n = 0   b o t t o m m a r g i n = 0   r i g h t m a r g i n = 0   t o p m a r g i n = 0   s t y l e = ' B A C K G R O U N D - C O L O R :   # F F F F F F ; '   S C R O L L = N O   o n l o a d = ' S e t D o w n l o a d ( ) ' >     < D I V   S t y l e = ' p o s i t i o n :   a b s o l u t e ;   L e f t :   0 p x ;   T o p :   0 % ;   W i d t h :   1 0 0 % ;   H e i g h t :   1 0 % ;   B A C K G R O U N D - C O L O R :   # F F 6 6 0 0 ; ' >     < T A B L E   W I D T H = 1 0 0 %   H E I G H T = 1 0 0 % >     < T R >     < T D   W I D T H = 1 0 % > < / T D >     < T D   S t y l e = ' F O N T - W E I G H T :   b o l d ;   F O N T - S I Z E :   1 2 p t ;   C O L O R :   # f f f f f f ' > [ A p p l i c a t i o n   N a m e ] < / T D >     < / T R >     < / T A B L E >     < / D I V >     < D I V   I D = H e l p S e c t i o n   S t y l e = ' p o s i t i o n :   a b s o l u t e ;   L e f t :   1 0 % ;   T o p :   1 1 % ;   W i d t h :   8 0 % ;   H e i g h t :   7 0 % ;   B A C K G R O U N D - C O L O R :   # f f f f f f ;   F O N T - S I Z E :   8 p t ;   ' >     < B R >     T o   P r i n t   y o u r   r e p o r t   y o u   s h o u l d   c h a n g e   s o m e   I n t e r n e t   E x p l o r e r   s e t t i n g s   f i r s t   t o   m a k e   t h e   r e p o r t   a s   r e a d a b l e   a s   p o s s i b l e < B R >     < B R >     1 .   T u r n   o n   t h e   p r i n t i n g   o f   b a c k g r o u n d   c o l o u r s   a n d   g r a p h i c s . < B R >     2 .   C h a n g e   t h e   P a g e   S e t t i n g s   a s   d e t a i l e d   b e l o w . < B R >   < U L >   O r i e n t a t i o n :   [ O R I E N T A T I O N ] < B R >   T o p   M a r g i n :   [ T O P ] < B R >   B o t t o m   M a r g i n :   [ B O T T O M ] < B R >   L e f t   M a r g i n :   [ L E F T ] < B R >   R i g h t   M a r g i n :   [ R I G H T ] < B R > < / U L >   < / D I V >     < D I V   I D = D o w n l o a d S e c t i o n   S t y l e = ' d i s p l a y :   d i s p l a y ;   p o s i t i o n :   a b s o l u t e ;   L e f t :   0 p x ;   T o p :   8 0 % ;   W i d t h :   1 0 0 % ;   H e i g h t :   1 0 % ;   B A C K G R O U N D - C O L O R :   # f f f f f f ;   F O N T - W E I G H T :   b o l d ;   F O N T - S I Z E :   1 0 p t ;   t e x t - a l i g n :   c e n t e r ; ' >     < / D I V >     < D I V   S t y l e = ' p o s i t i o n :   a b s o l u t e ;   L e f t :   0 p x ;   T o p :   9 0 % ;   W i d t h :   1 0 0 % ;   H e i g h t :   1 0 % ;   B A C K G R O U N D - C O L O R :   # F F 6 6 0 0 ;   ' >     < T A B L E   W I D T H = 1 0 0 %   H E I G H T = 1 0 0 % >     < T R >     < T D   W I D T H = 1 0 % > < / T D >     < T D   v a l i g n = m i d d l e   S t y l e = ' F O N T - W E I G H T :   b o l d ;   F O N T - S I Z E :   1 0 p t ;   C O L O R :   # f f f f f f ' > [ C o n t a c t   D e t a i l s ] < / T D >     < / T R >     < / T A B L E >     < / D I V >     < / B O D Y >     < / H T M L > �< D I V   I D = ' N a v '   s t y l e = ' d i s p l a y :   v i s i b l e ;   
 H E I G H T = 2 0 p x ;   B O R D E R - B O T T O M :   # 0 0 0 0 0 0   t h i n   s o l i d ;   B O R D E R - L E F T :   # 0 0 0 0 0 0   t h i n   s o l i d ;   B O R D E R - R I G H T :   # 0 0 0 0 0 0   t h i n   s o l i d ;   B O R D E R - T O P :   # 0 0 0 0 0 0   t h i n   s o l i d ;   ' >   
 < T A B L E   W i d t h = 1 0 0 % >   
 < T R >   
 < T D   i d = ' F i r s t '   W I D T H = 8 0 p x   A L I G N = m i d d l e   C L A S S = ' D O W N '   o n m o u s e o v e r = " F i r s t . c l a s s N a m e = ' U P ' "   o n m o u s e o u t = " F i r s t . c l a s s N a m e = ' D O W N ' "     o n c l i c k = ' C h a n g e P a g e ( 1 ) '   > F i r s t   P a g e < / T D >   
 < T D   i d = ' B a c k '   W I D T H = 1 2 0 p x   A L I G N = m i d d l e   C L A S S = ' D O W N '   o n m o u s e o v e r = " B a c k . c l a s s N a m e = ' U P ' "   o n m o u s e o u t = " B a c k . c l a s s N a m e = ' D O W N ' "     o n c l i c k = ' C h a n g e P a g e ( 2 ) '   > P r e v i o u s   P a g e < / T D >   
 < T D   i d = ' F o r w a r d '   W I D T H = 8 0 p x   A L I G N = m i d d l e   C L A S S = ' D O W N '   o n m o u s e o v e r = " F o r w a r d . c l a s s N a m e = ' U P ' "   o n m o u s e o u t = " F o r w a r d . c l a s s N a m e = ' D O W N ' "     o n c l i c k = ' C h a n g e P a g e ( 3 ) '   > N e x t   P a g e < / T D >   
 < T D   i d = ' L a s t '   W I D T H = 8 0 p x   A L I G N = m i d d l e   C L A S S = ' D O W N '   o n m o u s e o v e r = " L a s t . c l a s s N a m e = ' U P ' "   o n m o u s e o u t = " L a s t . c l a s s N a m e = ' D O W N ' "     o n c l i c k = ' C h a n g e P a g e ( 4 ) '   > L a s t   P a g e < / T D >   
 < T D   i d = ' G o '   W I D T H = 4 0 p x   A L I G N = m i d d l e   C L A S S = ' D O W N '   o n m o u s e o v e r = " G o . c l a s s N a m e = ' U P ' "   o n m o u s e o u t = " G o . c l a s s N a m e = ' D O W N ' "   o n c l i c k = ' P r i n t P a g e s ( ) ' > P r i n t < / T D >   
 < T D   i d = ' H e l p '   W I D T H = 2 0 p x   A L I G N = m i d d l e   C L A S S = ' D O W N '   o n m o u s e o v e r = " H e l p . c l a s s N a m e = ' U P ' "   o n m o u s e o u t = " H e l p . c l a s s N a m e = ' D O W N ' "   o n c l i c k = ' S h o w H e l p ( ) ' > ? < / T D >   
 < T D   i d = ' I n f o '   A L I G N = r i g h t   C L A S S = ' N O A C T I O N '   > < / T D >   
 < / T R >   
 < / T A B L E >   
 < / D I V >                 