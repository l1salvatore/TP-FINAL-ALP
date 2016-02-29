{-# OPTIONS_GHC -w #-}
module Parse where
import Data.Char
import Common
--import Eval
import System.Console.Readline
import Control.Monad.Except

-- parser produced by Happy Version 1.18.9

data HappyAbsSyn t4 t5 t6 t7 t8
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8

action_0 (10) = happyShift action_2
action_0 (11) = happyShift action_4
action_0 (15) = happyShift action_5
action_0 (25) = happyShift action_6
action_0 (36) = happyShift action_7
action_0 (37) = happyShift action_8
action_0 (4) = happyGoto action_3
action_0 _ = happyFail

action_1 (10) = happyShift action_2
action_1 _ = happyFail

action_2 _ = happyReduce_1

action_3 (38) = happyAccept
action_3 _ = happyFail

action_4 _ = happyReduce_2

action_5 (11) = happyShift action_13
action_5 (12) = happyShift action_14
action_5 (16) = happyShift action_15
action_5 (25) = happyShift action_16
action_5 (28) = happyShift action_17
action_5 (32) = happyShift action_18
action_5 (33) = happyShift action_19
action_5 (34) = happyShift action_20
action_5 (35) = happyShift action_21
action_5 (36) = happyShift action_22
action_5 (37) = happyShift action_23
action_5 (5) = happyGoto action_10
action_5 (6) = happyGoto action_11
action_5 (7) = happyGoto action_12
action_5 _ = happyFail

action_6 (11) = happyShift action_9
action_6 _ = happyFail

action_7 _ = happyReduce_3

action_8 _ = happyReduce_4

action_9 _ = happyReduce_5

action_10 (17) = happyShift action_33
action_10 (18) = happyShift action_34
action_10 (19) = happyShift action_35
action_10 (20) = happyShift action_36
action_10 (21) = happyShift action_37
action_10 (22) = happyShift action_38
action_10 (23) = happyShift action_39
action_10 (24) = happyShift action_40
action_10 (25) = happyShift action_41
action_10 _ = happyReduce_6

action_11 (26) = happyShift action_31
action_11 (27) = happyShift action_32
action_11 _ = happyReduce_16

action_12 _ = happyReduce_19

action_13 _ = happyReduce_20

action_14 _ = happyReduce_21

action_15 (10) = happyShift action_30
action_15 _ = happyFail

action_16 (11) = happyShift action_13
action_16 (12) = happyShift action_14
action_16 (16) = happyShift action_15
action_16 (25) = happyShift action_16
action_16 (28) = happyShift action_17
action_16 (32) = happyShift action_18
action_16 (33) = happyShift action_19
action_16 (34) = happyShift action_20
action_16 (35) = happyShift action_21
action_16 (36) = happyShift action_22
action_16 (37) = happyShift action_23
action_16 (7) = happyGoto action_29
action_16 _ = happyFail

action_17 (11) = happyShift action_13
action_17 (12) = happyShift action_14
action_17 (16) = happyShift action_15
action_17 (25) = happyShift action_16
action_17 (28) = happyShift action_17
action_17 (32) = happyShift action_18
action_17 (33) = happyShift action_19
action_17 (34) = happyShift action_20
action_17 (35) = happyShift action_21
action_17 (36) = happyShift action_22
action_17 (37) = happyShift action_23
action_17 (5) = happyGoto action_28
action_17 (6) = happyGoto action_11
action_17 (7) = happyGoto action_12
action_17 _ = happyFail

action_18 (28) = happyShift action_27
action_18 _ = happyFail

action_19 (28) = happyShift action_26
action_19 _ = happyFail

action_20 (28) = happyShift action_25
action_20 _ = happyFail

action_21 (28) = happyShift action_24
action_21 _ = happyFail

action_22 _ = happyReduce_22

action_23 _ = happyReduce_24

action_24 (11) = happyShift action_13
action_24 (12) = happyShift action_14
action_24 (16) = happyShift action_15
action_24 (25) = happyShift action_16
action_24 (28) = happyShift action_17
action_24 (32) = happyShift action_18
action_24 (33) = happyShift action_19
action_24 (34) = happyShift action_20
action_24 (35) = happyShift action_21
action_24 (36) = happyShift action_22
action_24 (37) = happyShift action_23
action_24 (5) = happyGoto action_59
action_24 (6) = happyGoto action_11
action_24 (7) = happyGoto action_12
action_24 _ = happyFail

action_25 (11) = happyShift action_13
action_25 (12) = happyShift action_14
action_25 (16) = happyShift action_15
action_25 (25) = happyShift action_16
action_25 (28) = happyShift action_17
action_25 (32) = happyShift action_18
action_25 (33) = happyShift action_19
action_25 (34) = happyShift action_20
action_25 (35) = happyShift action_21
action_25 (36) = happyShift action_22
action_25 (37) = happyShift action_23
action_25 (5) = happyGoto action_55
action_25 (6) = happyGoto action_11
action_25 (7) = happyGoto action_12
action_25 (8) = happyGoto action_58
action_25 _ = happyFail

action_26 (11) = happyShift action_13
action_26 (12) = happyShift action_14
action_26 (16) = happyShift action_15
action_26 (25) = happyShift action_16
action_26 (28) = happyShift action_17
action_26 (32) = happyShift action_18
action_26 (33) = happyShift action_19
action_26 (34) = happyShift action_20
action_26 (35) = happyShift action_21
action_26 (36) = happyShift action_22
action_26 (37) = happyShift action_23
action_26 (5) = happyGoto action_57
action_26 (6) = happyGoto action_11
action_26 (7) = happyGoto action_12
action_26 _ = happyFail

action_27 (11) = happyShift action_13
action_27 (12) = happyShift action_14
action_27 (16) = happyShift action_15
action_27 (25) = happyShift action_16
action_27 (28) = happyShift action_17
action_27 (32) = happyShift action_18
action_27 (33) = happyShift action_19
action_27 (34) = happyShift action_20
action_27 (35) = happyShift action_21
action_27 (36) = happyShift action_22
action_27 (37) = happyShift action_23
action_27 (5) = happyGoto action_55
action_27 (6) = happyGoto action_11
action_27 (7) = happyGoto action_12
action_27 (8) = happyGoto action_56
action_27 _ = happyFail

action_28 (17) = happyShift action_33
action_28 (18) = happyShift action_34
action_28 (19) = happyShift action_35
action_28 (20) = happyShift action_36
action_28 (21) = happyShift action_37
action_28 (22) = happyShift action_38
action_28 (23) = happyShift action_39
action_28 (24) = happyShift action_40
action_28 (25) = happyShift action_41
action_28 (29) = happyShift action_54
action_28 _ = happyFail

action_29 _ = happyReduce_30

action_30 (16) = happyShift action_53
action_30 _ = happyFail

action_31 (11) = happyShift action_13
action_31 (12) = happyShift action_14
action_31 (16) = happyShift action_15
action_31 (25) = happyShift action_16
action_31 (28) = happyShift action_17
action_31 (32) = happyShift action_18
action_31 (33) = happyShift action_19
action_31 (34) = happyShift action_20
action_31 (35) = happyShift action_21
action_31 (36) = happyShift action_22
action_31 (37) = happyShift action_23
action_31 (7) = happyGoto action_52
action_31 _ = happyFail

action_32 (11) = happyShift action_13
action_32 (12) = happyShift action_14
action_32 (16) = happyShift action_15
action_32 (25) = happyShift action_16
action_32 (28) = happyShift action_17
action_32 (32) = happyShift action_18
action_32 (33) = happyShift action_19
action_32 (34) = happyShift action_20
action_32 (35) = happyShift action_21
action_32 (36) = happyShift action_22
action_32 (37) = happyShift action_23
action_32 (7) = happyGoto action_51
action_32 _ = happyFail

action_33 (11) = happyShift action_13
action_33 (12) = happyShift action_14
action_33 (16) = happyShift action_15
action_33 (25) = happyShift action_16
action_33 (28) = happyShift action_17
action_33 (32) = happyShift action_18
action_33 (33) = happyShift action_19
action_33 (34) = happyShift action_20
action_33 (35) = happyShift action_21
action_33 (36) = happyShift action_22
action_33 (37) = happyShift action_23
action_33 (6) = happyGoto action_50
action_33 (7) = happyGoto action_12
action_33 _ = happyFail

action_34 (11) = happyShift action_13
action_34 (12) = happyShift action_14
action_34 (16) = happyShift action_15
action_34 (25) = happyShift action_16
action_34 (28) = happyShift action_17
action_34 (32) = happyShift action_18
action_34 (33) = happyShift action_19
action_34 (34) = happyShift action_20
action_34 (35) = happyShift action_21
action_34 (36) = happyShift action_22
action_34 (37) = happyShift action_23
action_34 (6) = happyGoto action_49
action_34 (7) = happyGoto action_12
action_34 _ = happyFail

action_35 (11) = happyShift action_13
action_35 (12) = happyShift action_14
action_35 (16) = happyShift action_15
action_35 (25) = happyShift action_16
action_35 (28) = happyShift action_17
action_35 (32) = happyShift action_18
action_35 (33) = happyShift action_19
action_35 (34) = happyShift action_20
action_35 (35) = happyShift action_21
action_35 (36) = happyShift action_22
action_35 (37) = happyShift action_23
action_35 (6) = happyGoto action_48
action_35 (7) = happyGoto action_12
action_35 _ = happyFail

action_36 (11) = happyShift action_13
action_36 (12) = happyShift action_14
action_36 (16) = happyShift action_15
action_36 (25) = happyShift action_16
action_36 (28) = happyShift action_17
action_36 (32) = happyShift action_18
action_36 (33) = happyShift action_19
action_36 (34) = happyShift action_20
action_36 (35) = happyShift action_21
action_36 (36) = happyShift action_22
action_36 (37) = happyShift action_23
action_36 (6) = happyGoto action_47
action_36 (7) = happyGoto action_12
action_36 _ = happyFail

action_37 (11) = happyShift action_13
action_37 (12) = happyShift action_14
action_37 (16) = happyShift action_15
action_37 (25) = happyShift action_16
action_37 (28) = happyShift action_17
action_37 (32) = happyShift action_18
action_37 (33) = happyShift action_19
action_37 (34) = happyShift action_20
action_37 (35) = happyShift action_21
action_37 (36) = happyShift action_22
action_37 (37) = happyShift action_23
action_37 (6) = happyGoto action_46
action_37 (7) = happyGoto action_12
action_37 _ = happyFail

action_38 (11) = happyShift action_13
action_38 (12) = happyShift action_14
action_38 (16) = happyShift action_15
action_38 (25) = happyShift action_16
action_38 (28) = happyShift action_17
action_38 (32) = happyShift action_18
action_38 (33) = happyShift action_19
action_38 (34) = happyShift action_20
action_38 (35) = happyShift action_21
action_38 (36) = happyShift action_22
action_38 (37) = happyShift action_23
action_38 (6) = happyGoto action_45
action_38 (7) = happyGoto action_12
action_38 _ = happyFail

action_39 (11) = happyShift action_13
action_39 (12) = happyShift action_14
action_39 (16) = happyShift action_15
action_39 (25) = happyShift action_16
action_39 (28) = happyShift action_17
action_39 (32) = happyShift action_18
action_39 (33) = happyShift action_19
action_39 (34) = happyShift action_20
action_39 (35) = happyShift action_21
action_39 (36) = happyShift action_22
action_39 (37) = happyShift action_23
action_39 (6) = happyGoto action_44
action_39 (7) = happyGoto action_12
action_39 _ = happyFail

action_40 (11) = happyShift action_13
action_40 (12) = happyShift action_14
action_40 (16) = happyShift action_15
action_40 (25) = happyShift action_16
action_40 (28) = happyShift action_17
action_40 (32) = happyShift action_18
action_40 (33) = happyShift action_19
action_40 (34) = happyShift action_20
action_40 (35) = happyShift action_21
action_40 (36) = happyShift action_22
action_40 (37) = happyShift action_23
action_40 (6) = happyGoto action_43
action_40 (7) = happyGoto action_12
action_40 _ = happyFail

action_41 (11) = happyShift action_13
action_41 (12) = happyShift action_14
action_41 (16) = happyShift action_15
action_41 (25) = happyShift action_16
action_41 (28) = happyShift action_17
action_41 (32) = happyShift action_18
action_41 (33) = happyShift action_19
action_41 (34) = happyShift action_20
action_41 (35) = happyShift action_21
action_41 (36) = happyShift action_22
action_41 (37) = happyShift action_23
action_41 (6) = happyGoto action_42
action_41 (7) = happyGoto action_12
action_41 _ = happyFail

action_42 (26) = happyShift action_31
action_42 (27) = happyShift action_32
action_42 _ = happyReduce_15

action_43 (26) = happyShift action_31
action_43 (27) = happyShift action_32
action_43 _ = happyReduce_14

action_44 (26) = happyShift action_31
action_44 (27) = happyShift action_32
action_44 _ = happyReduce_13

action_45 (26) = happyShift action_31
action_45 (27) = happyShift action_32
action_45 _ = happyReduce_12

action_46 (26) = happyShift action_31
action_46 (27) = happyShift action_32
action_46 _ = happyReduce_11

action_47 (26) = happyShift action_31
action_47 (27) = happyShift action_32
action_47 _ = happyReduce_10

action_48 (26) = happyShift action_31
action_48 (27) = happyShift action_32
action_48 _ = happyReduce_9

action_49 (26) = happyShift action_31
action_49 (27) = happyShift action_32
action_49 _ = happyReduce_8

action_50 (26) = happyShift action_31
action_50 (27) = happyShift action_32
action_50 _ = happyReduce_7

action_51 _ = happyReduce_18

action_52 _ = happyReduce_17

action_53 _ = happyReduce_23

action_54 _ = happyReduce_25

action_55 (14) = happyShift action_62
action_55 (17) = happyShift action_33
action_55 (18) = happyShift action_34
action_55 (19) = happyShift action_35
action_55 (20) = happyShift action_36
action_55 (21) = happyShift action_37
action_55 (22) = happyShift action_38
action_55 (23) = happyShift action_39
action_55 (24) = happyShift action_40
action_55 (25) = happyShift action_41
action_55 (29) = happyShift action_63
action_55 _ = happyFail

action_56 _ = happyReduce_26

action_57 (14) = happyShift action_61
action_57 (17) = happyShift action_33
action_57 (18) = happyShift action_34
action_57 (19) = happyShift action_35
action_57 (20) = happyShift action_36
action_57 (21) = happyShift action_37
action_57 (22) = happyShift action_38
action_57 (23) = happyShift action_39
action_57 (24) = happyShift action_40
action_57 (25) = happyShift action_41
action_57 _ = happyFail

action_58 _ = happyReduce_27

action_59 (17) = happyShift action_33
action_59 (18) = happyShift action_34
action_59 (19) = happyShift action_35
action_59 (20) = happyShift action_36
action_59 (21) = happyShift action_37
action_59 (22) = happyShift action_38
action_59 (23) = happyShift action_39
action_59 (24) = happyShift action_40
action_59 (25) = happyShift action_41
action_59 (29) = happyShift action_60
action_59 _ = happyFail

action_60 _ = happyReduce_28

action_61 (11) = happyShift action_13
action_61 (12) = happyShift action_14
action_61 (16) = happyShift action_15
action_61 (25) = happyShift action_16
action_61 (28) = happyShift action_17
action_61 (32) = happyShift action_18
action_61 (33) = happyShift action_19
action_61 (34) = happyShift action_20
action_61 (35) = happyShift action_21
action_61 (36) = happyShift action_22
action_61 (37) = happyShift action_23
action_61 (5) = happyGoto action_65
action_61 (6) = happyGoto action_11
action_61 (7) = happyGoto action_12
action_61 _ = happyFail

action_62 (11) = happyShift action_13
action_62 (12) = happyShift action_14
action_62 (16) = happyShift action_15
action_62 (25) = happyShift action_16
action_62 (28) = happyShift action_17
action_62 (32) = happyShift action_18
action_62 (33) = happyShift action_19
action_62 (34) = happyShift action_20
action_62 (35) = happyShift action_21
action_62 (36) = happyShift action_22
action_62 (37) = happyShift action_23
action_62 (5) = happyGoto action_55
action_62 (6) = happyGoto action_11
action_62 (7) = happyGoto action_12
action_62 (8) = happyGoto action_64
action_62 _ = happyFail

action_63 _ = happyReduce_31

action_64 _ = happyReduce_32

action_65 (14) = happyShift action_66
action_65 (17) = happyShift action_33
action_65 (18) = happyShift action_34
action_65 (19) = happyShift action_35
action_65 (20) = happyShift action_36
action_65 (21) = happyShift action_37
action_65 (22) = happyShift action_38
action_65 (23) = happyShift action_39
action_65 (24) = happyShift action_40
action_65 (25) = happyShift action_41
action_65 _ = happyFail

action_66 (11) = happyShift action_13
action_66 (12) = happyShift action_14
action_66 (16) = happyShift action_15
action_66 (25) = happyShift action_16
action_66 (28) = happyShift action_17
action_66 (32) = happyShift action_18
action_66 (33) = happyShift action_19
action_66 (34) = happyShift action_20
action_66 (35) = happyShift action_21
action_66 (36) = happyShift action_22
action_66 (37) = happyShift action_23
action_66 (5) = happyGoto action_67
action_66 (6) = happyGoto action_11
action_66 (7) = happyGoto action_12
action_66 _ = happyFail

action_67 (17) = happyShift action_33
action_67 (18) = happyShift action_34
action_67 (19) = happyShift action_35
action_67 (20) = happyShift action_36
action_67 (21) = happyShift action_37
action_67 (22) = happyShift action_38
action_67 (23) = happyShift action_39
action_67 (24) = happyShift action_40
action_67 (25) = happyShift action_41
action_67 (29) = happyShift action_68
action_67 _ = happyFail

action_68 _ = happyReduce_29

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyTerminal (TokenString happy_var_1))
	 =  HappyAbsSyn4
		 (Str happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 (HappyTerminal (TokenFloat happy_var_1))
	 =  HappyAbsSyn4
		 (Fl happy_var_1
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_1  4 happyReduction_3
happyReduction_3 _
	 =  HappyAbsSyn4
		 (Bo True
	)

happyReduce_4 = happySpecReduce_1  4 happyReduction_4
happyReduction_4 _
	 =  HappyAbsSyn4
		 (Bo False
	)

happyReduce_5 = happySpecReduce_2  4 happyReduction_5
happyReduction_5 (HappyTerminal (TokenFloat happy_var_2))
	_
	 =  HappyAbsSyn4
		 (Fl (-1*happy_var_2)
	)
happyReduction_5 _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_2  4 happyReduction_6
happyReduction_6 (HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Eval happy_var_2
	)
happyReduction_6 _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  5 happyReduction_7
happyReduction_7 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Ig happy_var_1 happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  5 happyReduction_8
happyReduction_8 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Menor happy_var_1 happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  5 happyReduction_9
happyReduction_9 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Mayor happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  5 happyReduction_10
happyReduction_10 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (MenorIg happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  5 happyReduction_11
happyReduction_11 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (MayorIg happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  5 happyReduction_12
happyReduction_12 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (And happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  5 happyReduction_13
happyReduction_13 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Or happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  5 happyReduction_14
happyReduction_14 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Mas happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  5 happyReduction_15
happyReduction_15 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Menos happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_1  5 happyReduction_16
happyReduction_16 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  6 happyReduction_17
happyReduction_17 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Por happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  6 happyReduction_18
happyReduction_18 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Div happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_1  6 happyReduction_19
happyReduction_19 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_19 _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  7 happyReduction_20
happyReduction_20 (HappyTerminal (TokenFloat happy_var_1))
	 =  HappyAbsSyn7
		 (EFl happy_var_1
	)
happyReduction_20 _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  7 happyReduction_21
happyReduction_21 (HappyTerminal (TokenCelda happy_var_1))
	 =  HappyAbsSyn7
		 (Var happy_var_1
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_1  7 happyReduction_22
happyReduction_22 _
	 =  HappyAbsSyn7
		 (EBo True
	)

happyReduce_23 = happySpecReduce_3  7 happyReduction_23
happyReduction_23 _
	(HappyTerminal (TokenString happy_var_2))
	_
	 =  HappyAbsSyn7
		 (EStr happy_var_2
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  7 happyReduction_24
happyReduction_24 _
	 =  HappyAbsSyn7
		 (EBo False
	)

happyReduce_25 = happySpecReduce_3  7 happyReduction_25
happyReduction_25 _
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (happy_var_2
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  7 happyReduction_26
happyReduction_26 (HappyAbsSyn8  happy_var_3)
	_
	_
	 =  HappyAbsSyn7
		 (Suma happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  7 happyReduction_27
happyReduction_27 (HappyAbsSyn8  happy_var_3)
	_
	_
	 =  HappyAbsSyn7
		 (Concat happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happyReduce 4 7 happyReduction_28
happyReduction_28 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Abs happy_var_3
	) `HappyStk` happyRest

happyReduce_29 = happyReduce 8 7 happyReduction_29
happyReduction_29 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Si happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_30 = happySpecReduce_2  7 happyReduction_30
happyReduction_30 (HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (Opuesto happy_var_2
	)
happyReduction_30 _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_2  8 happyReduction_31
happyReduction_31 _
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn8
		 ([happy_var_1]
	)
happyReduction_31 _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  8 happyReduction_32
happyReduction_32 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1:happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 38 38 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenInt happy_dollar_dollar -> cont 9;
	TokenString happy_dollar_dollar -> cont 10;
	TokenFloat happy_dollar_dollar -> cont 11;
	TokenCelda happy_dollar_dollar -> cont 12;
	TokenPunto -> cont 13;
	TokenComa -> cont 14;
	TokenEval -> cont 15;
	TokenComilla -> cont 16;
	TokenIg -> cont 17;
	TokenMenor -> cont 18;
	TokenMayor -> cont 19;
	TokenMenorIg -> cont 20;
	TokenMayorIg -> cont 21;
	TokenAnd -> cont 22;
	TokenOr -> cont 23;
	TokenMas -> cont 24;
	TokenMenos -> cont 25;
	TokenPor -> cont 26;
	TokenDiv -> cont 27;
	TokenParIzq -> cont 28;
	TokenParDer -> cont 29;
	TokenCorIzq -> cont 30;
	TokenCorDer -> cont 31;
	TokenSUMATORIA -> cont 32;
	TokenSI -> cont 33;
	TokenCONCATENACION -> cont 34;
	TokenABSOLUTO -> cont 35;
	TokenTRUE -> cont 36;
	TokenFALSE -> cont 37;
	_ -> happyError' (tk:tks)
	}

happyError_ 38 tk tks = happyError' tks
happyError_ _ tk tks = happyError' (tk:tks)

happyThen :: () => IO a -> (a -> IO b) -> IO b
happyThen = ((>>=))
happyReturn :: () => a -> IO a
happyReturn = (return)
happyThen1 m k tks = ((>>=)) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> IO a
happyReturn1 = \a tks -> (return) a
happyError' :: () => [(Token)] -> IO a
happyError' = parseError

parseExpr tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> IO a
parseError _ = ioError (error "Parse error")




data Token = TokenInt Int
	   | TokenString String
	   | TokenFloat Float
	   | TokenCelda (String,Int)
	   | TokenPunto
	   | TokenComa
	   | TokenEval 
	   | TokenComilla 
	   | TokenIg  
	   | TokenMenor
	   | TokenMayor
	   | TokenMenorIg
	   | TokenMayorIg
	   | TokenAnd
	   | TokenOr
	   | TokenSI
	   | TokenMas 
	   | TokenMenos 
	   | TokenPor 
	   | TokenDiv 
	   | TokenParIzq 
	   | TokenParDer 
	   | TokenCorIzq
	   | TokenCorDer 
	   | TokenSUMATORIA 
	   | TokenCONCATENACION 
	   | TokenABSOLUTO 
	   | TokenTRUE
	   | TokenFALSE
	deriving(Show)




lexer :: String -> [Token]
lexer [] = []
lexer (c:cs) 
	| isDigit c = lexer1 (c:cs)
	| c == '-'  = lexer1 (c:cs)
	| c == '='  = TokenEval : (lexer2 cs)
	| isSpace c = lexer cs 
    	| otherwise = [TokenString (c:cs)]

lexer1 :: String -> [Token]
lexer1 [] = []
lexer1 cs = if cs!!0 /= '-' then
	    if rest == [] then [TokenFloat (read (num))] else
		if rest!!0 == '.' then 
			if rest' == [] then [TokenFloat (read (num ++ num1) / 10^(length num1))] else [TokenString cs] 
		else [TokenString cs]
	    else
	    if rest''' == [] then [TokenMenos,TokenFloat (read (num2))] else
		if rest'''!!0 == '.' then 
			if rest'''' == [] then [TokenMenos,TokenFloat (read (num2 ++ num3) / 10^(length num3))] else [TokenString cs] 
		else [TokenString cs]
		where (num,rest) = span isDigit cs
		      (num1,rest') = span isDigit (tail rest)
		      cs' = tail cs
		      (spaces,rest'') = span (\i -> i == ' ') cs'
		      (num2,rest''') = span isDigit rest''
		      (num3,rest'''') = span isDigit (tail rest''')


lexer2 :: String -> [Token]
lexer2 [] = []
lexer2 (c:cs) 
      | isSpace c = lexer2 cs
      | isAlpha c && (fromEnum c <= fromEnum 'Z' && fromEnum c >= fromEnum 'A') = lexCelda (c:cs)
      | isAlpha c = lexFunc (c:cs)
      | isDigit c = lexNum (c:cs)
      | c == '-' = TokenMenos : lexer2 cs
      | c == '.' = TokenPunto : lexer2 cs
      | c == ',' = TokenComa : lexer2 cs
      | c == '"' = TokenComilla : lexer3 cs []
      | c == '=' = if cs!!0 == '=' then TokenIg : lexer2 (tail cs) else [TokenString (c:cs)]
      | c == '<' = if cs!!0 == '=' then TokenMenorIg : lexer2 (tail cs) else TokenMenor : lexer2 cs
      | c == '>' = if cs!!0 == '=' then TokenMayorIg : lexer2 (tail cs) else TokenMayor : lexer2 cs
      | c == '&' = TokenAnd : lexer2 cs
      | c == '|' = TokenOr : lexer2 cs
      | c == '+' = TokenMas : lexer2 cs
      | c == '-' = TokenMenos : lexer2 cs
      | c == '*' = TokenPor : lexer2 cs
      | c == '/' = TokenDiv : lexer2 cs
      | c == '(' = TokenParIzq : lexer2 cs
      | c == ')' = TokenParDer : lexer2 cs
      | c == '[' = TokenCorIzq : lexer2 cs
      | c == ']' = TokenCorDer : lexer2 cs
      | otherwise = [TokenString (c:cs)]


lexer3 :: String -> String -> [Token]
lexer3 [] _ = []
lexer3 ('"':cs) str = (TokenString str) : TokenComilla : lexer2 cs
lexer3 (c:cs) str = lexer3 cs (str++[c])

lexNum cs = if rest /= [] && rest!!0 == '.' then TokenFloat (read (num ++ num1) / 10^(length num1)) : lexer2 rest'  else TokenFloat (read num) : lexer2 rest
      where (num,rest) = span isDigit cs
	    (num1,rest') = span isDigit (tail rest)


lexFunc cs =
   case span isAlpha cs of
      ("suma",rest) -> TokenSUMATORIA : lexer2 rest
      ("si",rest) -> TokenSI : lexer2 rest
      ("concat",rest)  -> TokenCONCATENACION : lexer2 rest
      ("abs",rest) -> TokenABSOLUTO : lexer2 rest
      ("true",rest) -> TokenTRUE : lexer2 rest
      ("false",rest) -> TokenFALSE : lexer2 rest
      (otherstr,rest) -> (TokenString otherstr) : lexer2 rest

lexCelda :: String -> [Token]
lexCelda [] = []
lexCelda cs = t3 : lexer2 rest'
		where (columna,rest) = span (\x -> isAlpha x) cs
		      t1 	  = map (\x -> if (fromEnum x <= fromEnum 'Z' && fromEnum x >= fromEnum 'A') then x else chr (fromEnum x + (fromEnum 'A' - fromEnum 'a'))) columna
		      (fila,rest') = if rest == [] then ("",[]) else span isDigit rest 
		      t2	 = if fila /= "" then read (fila) else -555
		      t3 	 = if t2 /= -555 then TokenCelda (t1,t2) else TokenString (t1++"-555")
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 

{-# LINE 30 "templates/GenericTemplate.hs" #-}








{-# LINE 51 "templates/GenericTemplate.hs" #-}

{-# LINE 61 "templates/GenericTemplate.hs" #-}

{-# LINE 70 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
	happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
	 (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 148 "templates/GenericTemplate.hs" #-}

-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let (i) = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
	 sts1@(((st1@(HappyState (action))):(_))) ->
        	let r = fn stk in  -- it doesn't hurt to always seq here...
       		happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
        happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))
       where (sts1@(((st1@(HappyState (action))):(_)))) = happyDrop k ((st):(sts))
             drop_stk = happyDropStk k stk

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
       happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))
       where (sts1@(((st1@(HappyState (action))):(_)))) = happyDrop k ((st):(sts))
             drop_stk = happyDropStk k stk





             new_state = action


happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 246 "templates/GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail (1) tk old_st _ stk@(x `HappyStk` _) =
     let (i) = (case x of { HappyErrorToken (i) -> i }) in
--	trace "failing" $ 
        happyError_ i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
						(saved_tok `HappyStk` _ `HappyStk` stk) =
--	trace ("discarding state, depth " ++ show (length stk))  $
	action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail  i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
	action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--	happySeq = happyDoSeq
-- otherwise it emits
-- 	happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 312 "templates/GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
