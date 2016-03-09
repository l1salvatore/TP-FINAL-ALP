{-# OPTIONS_GHC -w #-}
module Parse where
import Data.Char
import Common
import Data.Time
--import Eval
import System.Console.Readline
import Control.Monad.Except

-- parser produced by Happy Version 1.19.0

data HappyAbsSyn t4 t5 t6 t7 t8
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8

action_0 (9) = happyShift action_2
action_0 (10) = happyShift action_4
action_0 (11) = happyShift action_5
action_0 (15) = happyShift action_6
action_0 (25) = happyShift action_7
action_0 (41) = happyShift action_8
action_0 (42) = happyShift action_9
action_0 (4) = happyGoto action_3
action_0 _ = happyFail

action_1 (9) = happyShift action_2
action_1 _ = happyFail

action_2 _ = happyReduce_1

action_3 (45) = happyAccept
action_3 _ = happyFail

action_4 _ = happyReduce_2

action_5 _ = happyReduce_5

action_6 (10) = happyShift action_14
action_6 (11) = happyShift action_15
action_6 (12) = happyShift action_16
action_6 (16) = happyShift action_17
action_6 (25) = happyShift action_18
action_6 (28) = happyShift action_19
action_6 (34) = happyShift action_20
action_6 (35) = happyShift action_21
action_6 (36) = happyShift action_22
action_6 (37) = happyShift action_23
action_6 (38) = happyShift action_24
action_6 (39) = happyShift action_25
action_6 (40) = happyShift action_26
action_6 (41) = happyShift action_27
action_6 (42) = happyShift action_28
action_6 (43) = happyShift action_29
action_6 (44) = happyShift action_30
action_6 (5) = happyGoto action_11
action_6 (6) = happyGoto action_12
action_6 (7) = happyGoto action_13
action_6 _ = happyFail

action_7 (10) = happyShift action_10
action_7 _ = happyFail

action_8 _ = happyReduce_3

action_9 _ = happyReduce_4

action_10 _ = happyReduce_6

action_11 (17) = happyShift action_46
action_11 (18) = happyShift action_47
action_11 (19) = happyShift action_48
action_11 (20) = happyShift action_49
action_11 (21) = happyShift action_50
action_11 (22) = happyShift action_51
action_11 (23) = happyShift action_52
action_11 (24) = happyShift action_53
action_11 (25) = happyShift action_54
action_11 _ = happyReduce_7

action_12 (26) = happyShift action_43
action_12 (27) = happyShift action_44
action_12 (32) = happyShift action_45
action_12 _ = happyReduce_17

action_13 _ = happyReduce_21

action_14 _ = happyReduce_22

action_15 _ = happyReduce_37

action_16 (33) = happyShift action_42
action_16 _ = happyReduce_23

action_17 (9) = happyShift action_41
action_17 _ = happyFail

action_18 (10) = happyShift action_14
action_18 (11) = happyShift action_15
action_18 (12) = happyShift action_16
action_18 (16) = happyShift action_17
action_18 (25) = happyShift action_18
action_18 (28) = happyShift action_19
action_18 (34) = happyShift action_20
action_18 (35) = happyShift action_21
action_18 (36) = happyShift action_22
action_18 (37) = happyShift action_23
action_18 (38) = happyShift action_24
action_18 (39) = happyShift action_25
action_18 (40) = happyShift action_26
action_18 (41) = happyShift action_27
action_18 (42) = happyShift action_28
action_18 (43) = happyShift action_29
action_18 (44) = happyShift action_30
action_18 (7) = happyGoto action_40
action_18 _ = happyFail

action_19 (10) = happyShift action_14
action_19 (11) = happyShift action_15
action_19 (12) = happyShift action_16
action_19 (16) = happyShift action_17
action_19 (25) = happyShift action_18
action_19 (28) = happyShift action_19
action_19 (34) = happyShift action_20
action_19 (35) = happyShift action_21
action_19 (36) = happyShift action_22
action_19 (37) = happyShift action_23
action_19 (38) = happyShift action_24
action_19 (39) = happyShift action_25
action_19 (40) = happyShift action_26
action_19 (41) = happyShift action_27
action_19 (42) = happyShift action_28
action_19 (43) = happyShift action_29
action_19 (44) = happyShift action_30
action_19 (5) = happyGoto action_39
action_19 (6) = happyGoto action_12
action_19 (7) = happyGoto action_13
action_19 _ = happyFail

action_20 _ = happyReduce_36

action_21 (28) = happyShift action_38
action_21 _ = happyFail

action_22 (28) = happyShift action_37
action_22 _ = happyFail

action_23 (28) = happyShift action_36
action_23 _ = happyFail

action_24 (28) = happyShift action_35
action_24 _ = happyFail

action_25 (28) = happyShift action_34
action_25 _ = happyFail

action_26 (28) = happyShift action_33
action_26 _ = happyFail

action_27 _ = happyReduce_25

action_28 _ = happyReduce_27

action_29 (28) = happyShift action_32
action_29 _ = happyFail

action_30 (28) = happyShift action_31
action_30 _ = happyFail

action_31 (10) = happyShift action_14
action_31 (11) = happyShift action_15
action_31 (12) = happyShift action_16
action_31 (16) = happyShift action_17
action_31 (25) = happyShift action_18
action_31 (28) = happyShift action_19
action_31 (34) = happyShift action_20
action_31 (35) = happyShift action_21
action_31 (36) = happyShift action_22
action_31 (37) = happyShift action_23
action_31 (38) = happyShift action_24
action_31 (39) = happyShift action_25
action_31 (40) = happyShift action_26
action_31 (41) = happyShift action_27
action_31 (42) = happyShift action_28
action_31 (43) = happyShift action_29
action_31 (44) = happyShift action_30
action_31 (5) = happyGoto action_78
action_31 (6) = happyGoto action_12
action_31 (7) = happyGoto action_13
action_31 _ = happyFail

action_32 (10) = happyShift action_14
action_32 (11) = happyShift action_15
action_32 (12) = happyShift action_16
action_32 (16) = happyShift action_17
action_32 (25) = happyShift action_18
action_32 (28) = happyShift action_19
action_32 (34) = happyShift action_20
action_32 (35) = happyShift action_21
action_32 (36) = happyShift action_22
action_32 (37) = happyShift action_23
action_32 (38) = happyShift action_24
action_32 (39) = happyShift action_25
action_32 (40) = happyShift action_26
action_32 (41) = happyShift action_27
action_32 (42) = happyShift action_28
action_32 (43) = happyShift action_29
action_32 (44) = happyShift action_30
action_32 (5) = happyGoto action_77
action_32 (6) = happyGoto action_12
action_32 (7) = happyGoto action_13
action_32 _ = happyFail

action_33 (29) = happyShift action_76
action_33 _ = happyFail

action_34 (10) = happyShift action_14
action_34 (11) = happyShift action_15
action_34 (12) = happyShift action_16
action_34 (16) = happyShift action_17
action_34 (25) = happyShift action_18
action_34 (28) = happyShift action_19
action_34 (34) = happyShift action_20
action_34 (35) = happyShift action_21
action_34 (36) = happyShift action_22
action_34 (37) = happyShift action_23
action_34 (38) = happyShift action_24
action_34 (39) = happyShift action_25
action_34 (40) = happyShift action_26
action_34 (41) = happyShift action_27
action_34 (42) = happyShift action_28
action_34 (43) = happyShift action_29
action_34 (44) = happyShift action_30
action_34 (5) = happyGoto action_75
action_34 (6) = happyGoto action_12
action_34 (7) = happyGoto action_13
action_34 _ = happyFail

action_35 (10) = happyShift action_14
action_35 (11) = happyShift action_15
action_35 (12) = happyShift action_16
action_35 (16) = happyShift action_17
action_35 (25) = happyShift action_18
action_35 (28) = happyShift action_19
action_35 (34) = happyShift action_20
action_35 (35) = happyShift action_21
action_35 (36) = happyShift action_22
action_35 (37) = happyShift action_23
action_35 (38) = happyShift action_24
action_35 (39) = happyShift action_25
action_35 (40) = happyShift action_26
action_35 (41) = happyShift action_27
action_35 (42) = happyShift action_28
action_35 (43) = happyShift action_29
action_35 (44) = happyShift action_30
action_35 (5) = happyGoto action_74
action_35 (6) = happyGoto action_12
action_35 (7) = happyGoto action_13
action_35 _ = happyFail

action_36 (10) = happyShift action_14
action_36 (11) = happyShift action_15
action_36 (12) = happyShift action_16
action_36 (16) = happyShift action_17
action_36 (25) = happyShift action_18
action_36 (28) = happyShift action_19
action_36 (34) = happyShift action_20
action_36 (35) = happyShift action_21
action_36 (36) = happyShift action_22
action_36 (37) = happyShift action_23
action_36 (38) = happyShift action_24
action_36 (39) = happyShift action_25
action_36 (40) = happyShift action_26
action_36 (41) = happyShift action_27
action_36 (42) = happyShift action_28
action_36 (43) = happyShift action_29
action_36 (44) = happyShift action_30
action_36 (5) = happyGoto action_70
action_36 (6) = happyGoto action_12
action_36 (7) = happyGoto action_13
action_36 (8) = happyGoto action_73
action_36 _ = happyFail

action_37 (10) = happyShift action_14
action_37 (11) = happyShift action_15
action_37 (12) = happyShift action_16
action_37 (16) = happyShift action_17
action_37 (25) = happyShift action_18
action_37 (28) = happyShift action_19
action_37 (34) = happyShift action_20
action_37 (35) = happyShift action_21
action_37 (36) = happyShift action_22
action_37 (37) = happyShift action_23
action_37 (38) = happyShift action_24
action_37 (39) = happyShift action_25
action_37 (40) = happyShift action_26
action_37 (41) = happyShift action_27
action_37 (42) = happyShift action_28
action_37 (43) = happyShift action_29
action_37 (44) = happyShift action_30
action_37 (5) = happyGoto action_72
action_37 (6) = happyGoto action_12
action_37 (7) = happyGoto action_13
action_37 _ = happyFail

action_38 (10) = happyShift action_14
action_38 (11) = happyShift action_15
action_38 (12) = happyShift action_16
action_38 (16) = happyShift action_17
action_38 (25) = happyShift action_18
action_38 (28) = happyShift action_19
action_38 (34) = happyShift action_20
action_38 (35) = happyShift action_21
action_38 (36) = happyShift action_22
action_38 (37) = happyShift action_23
action_38 (38) = happyShift action_24
action_38 (39) = happyShift action_25
action_38 (40) = happyShift action_26
action_38 (41) = happyShift action_27
action_38 (42) = happyShift action_28
action_38 (43) = happyShift action_29
action_38 (44) = happyShift action_30
action_38 (5) = happyGoto action_70
action_38 (6) = happyGoto action_12
action_38 (7) = happyGoto action_13
action_38 (8) = happyGoto action_71
action_38 _ = happyFail

action_39 (17) = happyShift action_46
action_39 (18) = happyShift action_47
action_39 (19) = happyShift action_48
action_39 (20) = happyShift action_49
action_39 (21) = happyShift action_50
action_39 (22) = happyShift action_51
action_39 (23) = happyShift action_52
action_39 (24) = happyShift action_53
action_39 (25) = happyShift action_54
action_39 (29) = happyShift action_69
action_39 _ = happyFail

action_40 _ = happyReduce_34

action_41 (16) = happyShift action_68
action_41 _ = happyFail

action_42 (12) = happyShift action_67
action_42 _ = happyFail

action_43 (10) = happyShift action_14
action_43 (11) = happyShift action_15
action_43 (12) = happyShift action_16
action_43 (16) = happyShift action_17
action_43 (25) = happyShift action_18
action_43 (28) = happyShift action_19
action_43 (34) = happyShift action_20
action_43 (35) = happyShift action_21
action_43 (36) = happyShift action_22
action_43 (37) = happyShift action_23
action_43 (38) = happyShift action_24
action_43 (39) = happyShift action_25
action_43 (40) = happyShift action_26
action_43 (41) = happyShift action_27
action_43 (42) = happyShift action_28
action_43 (43) = happyShift action_29
action_43 (44) = happyShift action_30
action_43 (7) = happyGoto action_66
action_43 _ = happyFail

action_44 (10) = happyShift action_14
action_44 (11) = happyShift action_15
action_44 (12) = happyShift action_16
action_44 (16) = happyShift action_17
action_44 (25) = happyShift action_18
action_44 (28) = happyShift action_19
action_44 (34) = happyShift action_20
action_44 (35) = happyShift action_21
action_44 (36) = happyShift action_22
action_44 (37) = happyShift action_23
action_44 (38) = happyShift action_24
action_44 (39) = happyShift action_25
action_44 (40) = happyShift action_26
action_44 (41) = happyShift action_27
action_44 (42) = happyShift action_28
action_44 (43) = happyShift action_29
action_44 (44) = happyShift action_30
action_44 (7) = happyGoto action_65
action_44 _ = happyFail

action_45 (10) = happyShift action_14
action_45 (11) = happyShift action_15
action_45 (12) = happyShift action_16
action_45 (16) = happyShift action_17
action_45 (25) = happyShift action_18
action_45 (28) = happyShift action_19
action_45 (34) = happyShift action_20
action_45 (35) = happyShift action_21
action_45 (36) = happyShift action_22
action_45 (37) = happyShift action_23
action_45 (38) = happyShift action_24
action_45 (39) = happyShift action_25
action_45 (40) = happyShift action_26
action_45 (41) = happyShift action_27
action_45 (42) = happyShift action_28
action_45 (43) = happyShift action_29
action_45 (44) = happyShift action_30
action_45 (7) = happyGoto action_64
action_45 _ = happyFail

action_46 (10) = happyShift action_14
action_46 (11) = happyShift action_15
action_46 (12) = happyShift action_16
action_46 (16) = happyShift action_17
action_46 (25) = happyShift action_18
action_46 (28) = happyShift action_19
action_46 (34) = happyShift action_20
action_46 (35) = happyShift action_21
action_46 (36) = happyShift action_22
action_46 (37) = happyShift action_23
action_46 (38) = happyShift action_24
action_46 (39) = happyShift action_25
action_46 (40) = happyShift action_26
action_46 (41) = happyShift action_27
action_46 (42) = happyShift action_28
action_46 (43) = happyShift action_29
action_46 (44) = happyShift action_30
action_46 (6) = happyGoto action_63
action_46 (7) = happyGoto action_13
action_46 _ = happyFail

action_47 (10) = happyShift action_14
action_47 (11) = happyShift action_15
action_47 (12) = happyShift action_16
action_47 (16) = happyShift action_17
action_47 (25) = happyShift action_18
action_47 (28) = happyShift action_19
action_47 (34) = happyShift action_20
action_47 (35) = happyShift action_21
action_47 (36) = happyShift action_22
action_47 (37) = happyShift action_23
action_47 (38) = happyShift action_24
action_47 (39) = happyShift action_25
action_47 (40) = happyShift action_26
action_47 (41) = happyShift action_27
action_47 (42) = happyShift action_28
action_47 (43) = happyShift action_29
action_47 (44) = happyShift action_30
action_47 (6) = happyGoto action_62
action_47 (7) = happyGoto action_13
action_47 _ = happyFail

action_48 (10) = happyShift action_14
action_48 (11) = happyShift action_15
action_48 (12) = happyShift action_16
action_48 (16) = happyShift action_17
action_48 (25) = happyShift action_18
action_48 (28) = happyShift action_19
action_48 (34) = happyShift action_20
action_48 (35) = happyShift action_21
action_48 (36) = happyShift action_22
action_48 (37) = happyShift action_23
action_48 (38) = happyShift action_24
action_48 (39) = happyShift action_25
action_48 (40) = happyShift action_26
action_48 (41) = happyShift action_27
action_48 (42) = happyShift action_28
action_48 (43) = happyShift action_29
action_48 (44) = happyShift action_30
action_48 (6) = happyGoto action_61
action_48 (7) = happyGoto action_13
action_48 _ = happyFail

action_49 (10) = happyShift action_14
action_49 (11) = happyShift action_15
action_49 (12) = happyShift action_16
action_49 (16) = happyShift action_17
action_49 (25) = happyShift action_18
action_49 (28) = happyShift action_19
action_49 (34) = happyShift action_20
action_49 (35) = happyShift action_21
action_49 (36) = happyShift action_22
action_49 (37) = happyShift action_23
action_49 (38) = happyShift action_24
action_49 (39) = happyShift action_25
action_49 (40) = happyShift action_26
action_49 (41) = happyShift action_27
action_49 (42) = happyShift action_28
action_49 (43) = happyShift action_29
action_49 (44) = happyShift action_30
action_49 (6) = happyGoto action_60
action_49 (7) = happyGoto action_13
action_49 _ = happyFail

action_50 (10) = happyShift action_14
action_50 (11) = happyShift action_15
action_50 (12) = happyShift action_16
action_50 (16) = happyShift action_17
action_50 (25) = happyShift action_18
action_50 (28) = happyShift action_19
action_50 (34) = happyShift action_20
action_50 (35) = happyShift action_21
action_50 (36) = happyShift action_22
action_50 (37) = happyShift action_23
action_50 (38) = happyShift action_24
action_50 (39) = happyShift action_25
action_50 (40) = happyShift action_26
action_50 (41) = happyShift action_27
action_50 (42) = happyShift action_28
action_50 (43) = happyShift action_29
action_50 (44) = happyShift action_30
action_50 (6) = happyGoto action_59
action_50 (7) = happyGoto action_13
action_50 _ = happyFail

action_51 (10) = happyShift action_14
action_51 (11) = happyShift action_15
action_51 (12) = happyShift action_16
action_51 (16) = happyShift action_17
action_51 (25) = happyShift action_18
action_51 (28) = happyShift action_19
action_51 (34) = happyShift action_20
action_51 (35) = happyShift action_21
action_51 (36) = happyShift action_22
action_51 (37) = happyShift action_23
action_51 (38) = happyShift action_24
action_51 (39) = happyShift action_25
action_51 (40) = happyShift action_26
action_51 (41) = happyShift action_27
action_51 (42) = happyShift action_28
action_51 (43) = happyShift action_29
action_51 (44) = happyShift action_30
action_51 (6) = happyGoto action_58
action_51 (7) = happyGoto action_13
action_51 _ = happyFail

action_52 (10) = happyShift action_14
action_52 (11) = happyShift action_15
action_52 (12) = happyShift action_16
action_52 (16) = happyShift action_17
action_52 (25) = happyShift action_18
action_52 (28) = happyShift action_19
action_52 (34) = happyShift action_20
action_52 (35) = happyShift action_21
action_52 (36) = happyShift action_22
action_52 (37) = happyShift action_23
action_52 (38) = happyShift action_24
action_52 (39) = happyShift action_25
action_52 (40) = happyShift action_26
action_52 (41) = happyShift action_27
action_52 (42) = happyShift action_28
action_52 (43) = happyShift action_29
action_52 (44) = happyShift action_30
action_52 (6) = happyGoto action_57
action_52 (7) = happyGoto action_13
action_52 _ = happyFail

action_53 (10) = happyShift action_14
action_53 (11) = happyShift action_15
action_53 (12) = happyShift action_16
action_53 (16) = happyShift action_17
action_53 (25) = happyShift action_18
action_53 (28) = happyShift action_19
action_53 (34) = happyShift action_20
action_53 (35) = happyShift action_21
action_53 (36) = happyShift action_22
action_53 (37) = happyShift action_23
action_53 (38) = happyShift action_24
action_53 (39) = happyShift action_25
action_53 (40) = happyShift action_26
action_53 (41) = happyShift action_27
action_53 (42) = happyShift action_28
action_53 (43) = happyShift action_29
action_53 (44) = happyShift action_30
action_53 (6) = happyGoto action_56
action_53 (7) = happyGoto action_13
action_53 _ = happyFail

action_54 (10) = happyShift action_14
action_54 (11) = happyShift action_15
action_54 (12) = happyShift action_16
action_54 (16) = happyShift action_17
action_54 (25) = happyShift action_18
action_54 (28) = happyShift action_19
action_54 (34) = happyShift action_20
action_54 (35) = happyShift action_21
action_54 (36) = happyShift action_22
action_54 (37) = happyShift action_23
action_54 (38) = happyShift action_24
action_54 (39) = happyShift action_25
action_54 (40) = happyShift action_26
action_54 (41) = happyShift action_27
action_54 (42) = happyShift action_28
action_54 (43) = happyShift action_29
action_54 (44) = happyShift action_30
action_54 (6) = happyGoto action_55
action_54 (7) = happyGoto action_13
action_54 _ = happyFail

action_55 (26) = happyShift action_43
action_55 (27) = happyShift action_44
action_55 (32) = happyShift action_45
action_55 _ = happyReduce_16

action_56 (26) = happyShift action_43
action_56 (27) = happyShift action_44
action_56 (32) = happyShift action_45
action_56 _ = happyReduce_15

action_57 (26) = happyShift action_43
action_57 (27) = happyShift action_44
action_57 (32) = happyShift action_45
action_57 _ = happyReduce_14

action_58 (26) = happyShift action_43
action_58 (27) = happyShift action_44
action_58 (32) = happyShift action_45
action_58 _ = happyReduce_13

action_59 (26) = happyShift action_43
action_59 (27) = happyShift action_44
action_59 (32) = happyShift action_45
action_59 _ = happyReduce_12

action_60 (26) = happyShift action_43
action_60 (27) = happyShift action_44
action_60 (32) = happyShift action_45
action_60 _ = happyReduce_11

action_61 (26) = happyShift action_43
action_61 (27) = happyShift action_44
action_61 (32) = happyShift action_45
action_61 _ = happyReduce_10

action_62 (26) = happyShift action_43
action_62 (27) = happyShift action_44
action_62 (32) = happyShift action_45
action_62 _ = happyReduce_9

action_63 (26) = happyShift action_43
action_63 (27) = happyShift action_44
action_63 (32) = happyShift action_45
action_63 _ = happyReduce_8

action_64 _ = happyReduce_19

action_65 _ = happyReduce_20

action_66 _ = happyReduce_18

action_67 _ = happyReduce_24

action_68 _ = happyReduce_26

action_69 _ = happyReduce_28

action_70 (14) = happyShift action_84
action_70 (17) = happyShift action_46
action_70 (18) = happyShift action_47
action_70 (19) = happyShift action_48
action_70 (20) = happyShift action_49
action_70 (21) = happyShift action_50
action_70 (22) = happyShift action_51
action_70 (23) = happyShift action_52
action_70 (24) = happyShift action_53
action_70 (25) = happyShift action_54
action_70 (29) = happyShift action_85
action_70 _ = happyFail

action_71 _ = happyReduce_29

action_72 (14) = happyShift action_83
action_72 (17) = happyShift action_46
action_72 (18) = happyShift action_47
action_72 (19) = happyShift action_48
action_72 (20) = happyShift action_49
action_72 (21) = happyShift action_50
action_72 (22) = happyShift action_51
action_72 (23) = happyShift action_52
action_72 (24) = happyShift action_53
action_72 (25) = happyShift action_54
action_72 _ = happyFail

action_73 _ = happyReduce_30

action_74 (14) = happyShift action_82
action_74 (17) = happyShift action_46
action_74 (18) = happyShift action_47
action_74 (19) = happyShift action_48
action_74 (20) = happyShift action_49
action_74 (21) = happyShift action_50
action_74 (22) = happyShift action_51
action_74 (23) = happyShift action_52
action_74 (24) = happyShift action_53
action_74 (25) = happyShift action_54
action_74 _ = happyFail

action_75 (17) = happyShift action_46
action_75 (18) = happyShift action_47
action_75 (19) = happyShift action_48
action_75 (20) = happyShift action_49
action_75 (21) = happyShift action_50
action_75 (22) = happyShift action_51
action_75 (23) = happyShift action_52
action_75 (24) = happyShift action_53
action_75 (25) = happyShift action_54
action_75 (29) = happyShift action_81
action_75 _ = happyFail

action_76 _ = happyReduce_35

action_77 (14) = happyShift action_80
action_77 (17) = happyShift action_46
action_77 (18) = happyShift action_47
action_77 (19) = happyShift action_48
action_77 (20) = happyShift action_49
action_77 (21) = happyShift action_50
action_77 (22) = happyShift action_51
action_77 (23) = happyShift action_52
action_77 (24) = happyShift action_53
action_77 (25) = happyShift action_54
action_77 _ = happyFail

action_78 (17) = happyShift action_46
action_78 (18) = happyShift action_47
action_78 (19) = happyShift action_48
action_78 (20) = happyShift action_49
action_78 (21) = happyShift action_50
action_78 (22) = happyShift action_51
action_78 (23) = happyShift action_52
action_78 (24) = happyShift action_53
action_78 (25) = happyShift action_54
action_78 (29) = happyShift action_79
action_78 _ = happyFail

action_79 _ = happyReduce_39

action_80 (10) = happyShift action_14
action_80 (11) = happyShift action_15
action_80 (12) = happyShift action_16
action_80 (16) = happyShift action_17
action_80 (25) = happyShift action_18
action_80 (28) = happyShift action_19
action_80 (34) = happyShift action_20
action_80 (35) = happyShift action_21
action_80 (36) = happyShift action_22
action_80 (37) = happyShift action_23
action_80 (38) = happyShift action_24
action_80 (39) = happyShift action_25
action_80 (40) = happyShift action_26
action_80 (41) = happyShift action_27
action_80 (42) = happyShift action_28
action_80 (43) = happyShift action_29
action_80 (44) = happyShift action_30
action_80 (5) = happyGoto action_89
action_80 (6) = happyGoto action_12
action_80 (7) = happyGoto action_13
action_80 _ = happyFail

action_81 _ = happyReduce_32

action_82 (10) = happyShift action_14
action_82 (11) = happyShift action_15
action_82 (12) = happyShift action_16
action_82 (16) = happyShift action_17
action_82 (25) = happyShift action_18
action_82 (28) = happyShift action_19
action_82 (34) = happyShift action_20
action_82 (35) = happyShift action_21
action_82 (36) = happyShift action_22
action_82 (37) = happyShift action_23
action_82 (38) = happyShift action_24
action_82 (39) = happyShift action_25
action_82 (40) = happyShift action_26
action_82 (41) = happyShift action_27
action_82 (42) = happyShift action_28
action_82 (43) = happyShift action_29
action_82 (44) = happyShift action_30
action_82 (5) = happyGoto action_88
action_82 (6) = happyGoto action_12
action_82 (7) = happyGoto action_13
action_82 _ = happyFail

action_83 (10) = happyShift action_14
action_83 (11) = happyShift action_15
action_83 (12) = happyShift action_16
action_83 (16) = happyShift action_17
action_83 (25) = happyShift action_18
action_83 (28) = happyShift action_19
action_83 (34) = happyShift action_20
action_83 (35) = happyShift action_21
action_83 (36) = happyShift action_22
action_83 (37) = happyShift action_23
action_83 (38) = happyShift action_24
action_83 (39) = happyShift action_25
action_83 (40) = happyShift action_26
action_83 (41) = happyShift action_27
action_83 (42) = happyShift action_28
action_83 (43) = happyShift action_29
action_83 (44) = happyShift action_30
action_83 (5) = happyGoto action_87
action_83 (6) = happyGoto action_12
action_83 (7) = happyGoto action_13
action_83 _ = happyFail

action_84 (10) = happyShift action_14
action_84 (11) = happyShift action_15
action_84 (12) = happyShift action_16
action_84 (16) = happyShift action_17
action_84 (25) = happyShift action_18
action_84 (28) = happyShift action_19
action_84 (34) = happyShift action_20
action_84 (35) = happyShift action_21
action_84 (36) = happyShift action_22
action_84 (37) = happyShift action_23
action_84 (38) = happyShift action_24
action_84 (39) = happyShift action_25
action_84 (40) = happyShift action_26
action_84 (41) = happyShift action_27
action_84 (42) = happyShift action_28
action_84 (43) = happyShift action_29
action_84 (44) = happyShift action_30
action_84 (5) = happyGoto action_70
action_84 (6) = happyGoto action_12
action_84 (7) = happyGoto action_13
action_84 (8) = happyGoto action_86
action_84 _ = happyFail

action_85 _ = happyReduce_40

action_86 _ = happyReduce_41

action_87 (14) = happyShift action_92
action_87 (17) = happyShift action_46
action_87 (18) = happyShift action_47
action_87 (19) = happyShift action_48
action_87 (20) = happyShift action_49
action_87 (21) = happyShift action_50
action_87 (22) = happyShift action_51
action_87 (23) = happyShift action_52
action_87 (24) = happyShift action_53
action_87 (25) = happyShift action_54
action_87 _ = happyFail

action_88 (17) = happyShift action_46
action_88 (18) = happyShift action_47
action_88 (19) = happyShift action_48
action_88 (20) = happyShift action_49
action_88 (21) = happyShift action_50
action_88 (22) = happyShift action_51
action_88 (23) = happyShift action_52
action_88 (24) = happyShift action_53
action_88 (25) = happyShift action_54
action_88 (29) = happyShift action_91
action_88 _ = happyFail

action_89 (17) = happyShift action_46
action_89 (18) = happyShift action_47
action_89 (19) = happyShift action_48
action_89 (20) = happyShift action_49
action_89 (21) = happyShift action_50
action_89 (22) = happyShift action_51
action_89 (23) = happyShift action_52
action_89 (24) = happyShift action_53
action_89 (25) = happyShift action_54
action_89 (29) = happyShift action_90
action_89 _ = happyFail

action_90 _ = happyReduce_38

action_91 _ = happyReduce_31

action_92 (10) = happyShift action_14
action_92 (11) = happyShift action_15
action_92 (12) = happyShift action_16
action_92 (16) = happyShift action_17
action_92 (25) = happyShift action_18
action_92 (28) = happyShift action_19
action_92 (34) = happyShift action_20
action_92 (35) = happyShift action_21
action_92 (36) = happyShift action_22
action_92 (37) = happyShift action_23
action_92 (38) = happyShift action_24
action_92 (39) = happyShift action_25
action_92 (40) = happyShift action_26
action_92 (41) = happyShift action_27
action_92 (42) = happyShift action_28
action_92 (43) = happyShift action_29
action_92 (44) = happyShift action_30
action_92 (5) = happyGoto action_93
action_92 (6) = happyGoto action_12
action_92 (7) = happyGoto action_13
action_92 _ = happyFail

action_93 (17) = happyShift action_46
action_93 (18) = happyShift action_47
action_93 (19) = happyShift action_48
action_93 (20) = happyShift action_49
action_93 (21) = happyShift action_50
action_93 (22) = happyShift action_51
action_93 (23) = happyShift action_52
action_93 (24) = happyShift action_53
action_93 (25) = happyShift action_54
action_93 (29) = happyShift action_94
action_93 _ = happyFail

action_94 _ = happyReduce_33

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

happyReduce_5 = happySpecReduce_1  4 happyReduction_5
happyReduction_5 (HappyTerminal (TokenDate happy_var_1))
	 =  HappyAbsSyn4
		 (Date happy_var_1
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_2  4 happyReduction_6
happyReduction_6 (HappyTerminal (TokenFloat happy_var_2))
	_
	 =  HappyAbsSyn4
		 (Fl (-1*happy_var_2)
	)
happyReduction_6 _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_2  4 happyReduction_7
happyReduction_7 (HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Eval happy_var_2
	)
happyReduction_7 _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  5 happyReduction_8
happyReduction_8 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Ig happy_var_1 happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  5 happyReduction_9
happyReduction_9 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Menor happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  5 happyReduction_10
happyReduction_10 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Mayor happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  5 happyReduction_11
happyReduction_11 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (MenorIg happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  5 happyReduction_12
happyReduction_12 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (MayorIg happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  5 happyReduction_13
happyReduction_13 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (And happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  5 happyReduction_14
happyReduction_14 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Or happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  5 happyReduction_15
happyReduction_15 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Mas happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  5 happyReduction_16
happyReduction_16 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Menos happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  5 happyReduction_17
happyReduction_17 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  6 happyReduction_18
happyReduction_18 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Por happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  6 happyReduction_19
happyReduction_19 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Potencia happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  6 happyReduction_20
happyReduction_20 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Div happy_var_1 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  6 happyReduction_21
happyReduction_21 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_1  7 happyReduction_22
happyReduction_22 (HappyTerminal (TokenFloat happy_var_1))
	 =  HappyAbsSyn7
		 (EFl happy_var_1
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  7 happyReduction_23
happyReduction_23 (HappyTerminal (TokenCelda happy_var_1))
	 =  HappyAbsSyn7
		 (Var happy_var_1
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  7 happyReduction_24
happyReduction_24 (HappyTerminal (TokenCelda happy_var_3))
	_
	(HappyTerminal (TokenCelda happy_var_1))
	 =  HappyAbsSyn7
		 (Ran happy_var_1 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_1  7 happyReduction_25
happyReduction_25 _
	 =  HappyAbsSyn7
		 (EBo True
	)

happyReduce_26 = happySpecReduce_3  7 happyReduction_26
happyReduction_26 _
	(HappyTerminal (TokenString happy_var_2))
	_
	 =  HappyAbsSyn7
		 (EStr happy_var_2
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_1  7 happyReduction_27
happyReduction_27 _
	 =  HappyAbsSyn7
		 (EBo False
	)

happyReduce_28 = happySpecReduce_3  7 happyReduction_28
happyReduction_28 _
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (happy_var_2
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  7 happyReduction_29
happyReduction_29 (HappyAbsSyn8  happy_var_3)
	_
	_
	 =  HappyAbsSyn7
		 (Suma happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  7 happyReduction_30
happyReduction_30 (HappyAbsSyn8  happy_var_3)
	_
	_
	 =  HappyAbsSyn7
		 (Concat happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happyReduce 6 7 happyReduction_31
happyReduction_31 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (ContarSi happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_32 = happyReduce 4 7 happyReduction_32
happyReduction_32 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Abs happy_var_3
	) `HappyStk` happyRest

happyReduce_33 = happyReduce 8 7 happyReduction_33
happyReduction_33 (_ `HappyStk`
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

happyReduce_34 = happySpecReduce_2  7 happyReduction_34
happyReduction_34 (HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (Opuesto happy_var_2
	)
happyReduction_34 _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  7 happyReduction_35
happyReduction_35 _
	_
	_
	 =  HappyAbsSyn7
		 (Hoy
	)

happyReduce_36 = happySpecReduce_1  7 happyReduction_36
happyReduction_36 _
	 =  HappyAbsSyn7
		 (Star
	)

happyReduce_37 = happySpecReduce_1  7 happyReduction_37
happyReduction_37 (HappyTerminal (TokenDate happy_var_1))
	 =  HappyAbsSyn7
		 (EDate happy_var_1
	)
happyReduction_37 _  = notHappyAtAll 

happyReduce_38 = happyReduce 6 7 happyReduction_38
happyReduction_38 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (DiasEntre happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_39 = happyReduce 4 7 happyReduction_39
happyReduction_39 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (DiaPascua happy_var_3
	) `HappyStk` happyRest

happyReduce_40 = happySpecReduce_2  8 happyReduction_40
happyReduction_40 _
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn8
		 ([happy_var_1]
	)
happyReduction_40 _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_3  8 happyReduction_41
happyReduction_41 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1:happy_var_3
	)
happyReduction_41 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 45 45 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenString happy_dollar_dollar -> cont 9;
	TokenFloat happy_dollar_dollar -> cont 10;
	TokenDate happy_dollar_dollar -> cont 11;
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
	TokenPot -> cont 32;
	TokenDoblePunto -> cont 33;
	TokenAdm -> cont 34;
	TokenSUMATORIA -> cont 35;
	TokenSI -> cont 36;
	TokenCONCATENACION -> cont 37;
	TokenCONTARSI -> cont 38;
	TokenABSOLUTO -> cont 39;
	TokenTODAY -> cont 40;
	TokenTRUE -> cont 41;
	TokenFALSE -> cont 42;
	TokenDIFDAYS -> cont 43;
	TokenEASTERDAY -> cont 44;
	_ -> happyError' (tk:tks)
	}

happyError_ 45 tk tks = happyError' tks
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




data Token = TokenString String
	   | TokenFloat Float
	   | TokenCelda (String,Int)
	   | TokenDate Day
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
	   | TokenDoblePunto
	   | TokenMas 
	   | TokenMenos 
	   | TokenPor 
	   | TokenAdm
	   | TokenDiv 
	   | TokenParIzq 
	   | TokenParDer
	   | TokenCONTARSI 
	   | TokenCorIzq
	   | TokenCorDer 
	   | TokenPot
	   | TokenSUMATORIA 
	   | TokenCONCATENACION 
	   | TokenABSOLUTO 
	   | TokenTODAY
	   | TokenDIFDAYS
	   | TokenTRUE
	   | TokenFALSE
	   | TokenEASTERDAY
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
	    if rest0 == [] then [TokenFloat (read (num))] else
		if rest0!!0 == '.' then 
			if rest1 == [] then [TokenFloat (read (num ++ num1) / 10^(length num1))] else [TokenString cs] 
		else if rest0!!0 == '/' then if rest1 /= [] && rest1!!0 == '/' then if rest2 == [] then [TokenDate (fromGregorian (read num2) (read num1) (read num))]
										                   else [TokenString cs]
								               else [TokenString cs]
				        else [TokenString cs]
	    else
	    if rest5 == [] then [TokenMenos,TokenFloat (read (num4))] else
		if rest5!!0 == '.' then 
			if rest6 == [] then [TokenMenos,TokenFloat (read (num4 ++ num5) / 10^(length num5))] else [TokenString cs] 
		else [TokenString cs]
		where (num,rest0) = span (\x -> isDigit x || isSpace x) cs  -- 23 "/392/132"
		      (num1,rest1) = span (\x -> isDigit x || isSpace x) (tail rest0) -- 392 "/132"
		      (num2,rest2) = span (\x -> isDigit x || isSpace x) (tail rest1) -- 132
		      cs' = tail cs 
		      (spaces,rest4) = span (\i -> i == ' ') cs' 
		      (num4,rest5) = span (\x -> isDigit x || isSpace x) rest4 
		      (num5,rest6) = span (\x -> isDigit x || isSpace x) (tail rest5)


lexer2 :: String -> [Token]
lexer2 [] = []
lexer2 (c:cs) 
      | isSpace c = lexer2 cs
      | isAlpha c && (fromEnum c <= fromEnum 'Z' && fromEnum c >= fromEnum 'A') = lexCelda 'a' (c:cs)
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
      | c == '!' = TokenAdm : lexer2 cs
      | c == '-' = TokenMenos : lexer2 cs
      | c == '*' = TokenPor : lexer2 cs
      | c == '^' = TokenPot : lexer2 cs
      | c == ':' = TokenDoblePunto : lexer2 cs
      | c == '/' = TokenDiv : lexer2 cs
      | c == '(' = TokenParIzq : lexer2 cs
      | c == ')' = TokenParDer : lexer2 cs
      | otherwise = [TokenString (c:cs)]


lexerFuncDays :: String -> [Token]
lexerFuncDays [] = []
lexerFuncDays (c:cs) 
	| isSpace c = lexerFuncDays cs
	| isAlpha c && (fromEnum c <= fromEnum 'Z' && fromEnum c >= fromEnum 'A') = lexCelda 'b' (c:cs)
	| isDigit c = lexerDay (c:cs)
	| c == ','  = TokenComa : lexerFuncDays cs
	| c == '('  = TokenParIzq : lexerFuncDays cs
        | c == ')'  = TokenParDer : lexer2 cs
	| otherwise = [TokenString [c]] ++ lexer2 cs

lexerDay :: String -> [Token]
lexerDay [] = []
lexerDay cs = if rest0!!0 == '/' then if rest1 /= [] && rest1!!0 == '/' then[TokenDate (fromGregorian (read num2) (read num1) (read num))] ++ lexerFuncDays rest2
								        else [TokenString cs]
			         else [TokenString cs]
	        where (num,rest0) = span (\x -> isDigit x || isSpace x) cs  -- 23 "/392/132"
		      (num1,rest1) = span (\x -> isDigit x || isSpace x) (tail rest0) -- 392 "/132"
		      (num2,rest2) = span (\x -> isDigit x || isSpace x) (tail rest1) -- 132

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
      ("contarSi",rest) -> TokenCONTARSI : lexer2 rest
      ("abs",rest) -> TokenABSOLUTO : lexer2 rest
      ("true",rest) -> TokenTRUE : lexer2 rest
      ("false",rest) -> TokenFALSE : lexer2 rest
      ("hoy",rest) -> TokenTODAY : lexer2 rest
      ("diasEntre",rest) -> TokenDIFDAYS : lexerFuncDays rest
      ("diaPascua",rest) -> TokenEASTERDAY : lexer2 rest
      (otherstr,rest) -> (TokenString otherstr) : lexer2 rest

lexCelda :: Char -> String -> [Token]
lexCelda b [] = []
lexCelda b cs = if b == 'a' then t3 : lexer2 rest' else t3 : lexerFuncDays rest' 
		where (columna,rest) = span (\x -> isAlpha x) cs
		      t1 	  = map (\x -> if (fromEnum x <= fromEnum 'Z' && fromEnum x >= fromEnum 'A') then x else chr (fromEnum x + (fromEnum 'A' - fromEnum 'a'))) columna
		      (fila,rest') = if rest == [] then ("",[]) else span isDigit rest 
		      t2	 = if fila /= "" then read (fila) else -555
		      t3 	 = if (t2 /= -555) && (length t1 == 1) && (t2 <= 99) then TokenCelda (t1,t2) else TokenString (t1++"-555")
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<command-line>" #-}





# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4














# 1 "/usr/include/x86_64-linux-gnu/bits/predefs.h" 1 3 4

# 18 "/usr/include/x86_64-linux-gnu/bits/predefs.h" 3 4












# 31 "/usr/include/stdc-predef.h" 2 3 4








# 5 "<command-line>" 2
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 

{-# LINE 13 "templates/GenericTemplate.hs" #-}

{-# LINE 45 "templates/GenericTemplate.hs" #-}








{-# LINE 66 "templates/GenericTemplate.hs" #-}

{-# LINE 76 "templates/GenericTemplate.hs" #-}

{-# LINE 85 "templates/GenericTemplate.hs" #-}

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

{-# LINE 154 "templates/GenericTemplate.hs" #-}

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
     let i = (case x of { HappyErrorToken (i) -> i }) in
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
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 255 "templates/GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
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

{-# LINE 321 "templates/GenericTemplate.hs" #-}
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
