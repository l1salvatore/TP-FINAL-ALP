{-# OPTIONS_GHC -w #-}
module Parse where
import Data.Char
import Common
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
action_0 (14) = happyShift action_5
action_0 (24) = happyShift action_6
action_0 (39) = happyShift action_7
action_0 (40) = happyShift action_8
action_0 (4) = happyGoto action_3
action_0 _ = happyFail

action_1 (9) = happyShift action_2
action_1 _ = happyFail

action_2 _ = happyReduce_1

action_3 (41) = happyAccept
action_3 _ = happyFail

action_4 _ = happyReduce_2

action_5 (10) = happyShift action_13
action_5 (11) = happyShift action_14
action_5 (15) = happyShift action_15
action_5 (24) = happyShift action_16
action_5 (27) = happyShift action_17
action_5 (33) = happyShift action_18
action_5 (34) = happyShift action_19
action_5 (35) = happyShift action_20
action_5 (36) = happyShift action_21
action_5 (37) = happyShift action_22
action_5 (38) = happyShift action_23
action_5 (39) = happyShift action_24
action_5 (40) = happyShift action_25
action_5 (5) = happyGoto action_10
action_5 (6) = happyGoto action_11
action_5 (7) = happyGoto action_12
action_5 _ = happyFail

action_6 (10) = happyShift action_9
action_6 _ = happyFail

action_7 _ = happyReduce_3

action_8 _ = happyReduce_4

action_9 _ = happyReduce_5

action_10 (16) = happyShift action_38
action_10 (17) = happyShift action_39
action_10 (18) = happyShift action_40
action_10 (19) = happyShift action_41
action_10 (20) = happyShift action_42
action_10 (21) = happyShift action_43
action_10 (22) = happyShift action_44
action_10 (23) = happyShift action_45
action_10 (24) = happyShift action_46
action_10 _ = happyReduce_6

action_11 (25) = happyShift action_35
action_11 (26) = happyShift action_36
action_11 (31) = happyShift action_37
action_11 _ = happyReduce_16

action_12 _ = happyReduce_20

action_13 _ = happyReduce_21

action_14 (32) = happyShift action_34
action_14 _ = happyReduce_22

action_15 (9) = happyShift action_33
action_15 _ = happyFail

action_16 (10) = happyShift action_13
action_16 (11) = happyShift action_14
action_16 (15) = happyShift action_15
action_16 (24) = happyShift action_16
action_16 (27) = happyShift action_17
action_16 (33) = happyShift action_18
action_16 (34) = happyShift action_19
action_16 (35) = happyShift action_20
action_16 (36) = happyShift action_21
action_16 (37) = happyShift action_22
action_16 (38) = happyShift action_23
action_16 (39) = happyShift action_24
action_16 (40) = happyShift action_25
action_16 (7) = happyGoto action_32
action_16 _ = happyFail

action_17 (10) = happyShift action_13
action_17 (11) = happyShift action_14
action_17 (15) = happyShift action_15
action_17 (24) = happyShift action_16
action_17 (27) = happyShift action_17
action_17 (33) = happyShift action_18
action_17 (34) = happyShift action_19
action_17 (35) = happyShift action_20
action_17 (36) = happyShift action_21
action_17 (37) = happyShift action_22
action_17 (38) = happyShift action_23
action_17 (39) = happyShift action_24
action_17 (40) = happyShift action_25
action_17 (5) = happyGoto action_31
action_17 (6) = happyGoto action_11
action_17 (7) = happyGoto action_12
action_17 _ = happyFail

action_18 _ = happyReduce_34

action_19 (27) = happyShift action_30
action_19 _ = happyFail

action_20 (27) = happyShift action_29
action_20 _ = happyFail

action_21 (27) = happyShift action_28
action_21 _ = happyFail

action_22 (27) = happyShift action_27
action_22 _ = happyFail

action_23 (27) = happyShift action_26
action_23 _ = happyFail

action_24 _ = happyReduce_24

action_25 _ = happyReduce_26

action_26 (10) = happyShift action_13
action_26 (11) = happyShift action_14
action_26 (15) = happyShift action_15
action_26 (24) = happyShift action_16
action_26 (27) = happyShift action_17
action_26 (33) = happyShift action_18
action_26 (34) = happyShift action_19
action_26 (35) = happyShift action_20
action_26 (36) = happyShift action_21
action_26 (37) = happyShift action_22
action_26 (38) = happyShift action_23
action_26 (39) = happyShift action_24
action_26 (40) = happyShift action_25
action_26 (5) = happyGoto action_67
action_26 (6) = happyGoto action_11
action_26 (7) = happyGoto action_12
action_26 _ = happyFail

action_27 (10) = happyShift action_13
action_27 (11) = happyShift action_14
action_27 (15) = happyShift action_15
action_27 (24) = happyShift action_16
action_27 (27) = happyShift action_17
action_27 (33) = happyShift action_18
action_27 (34) = happyShift action_19
action_27 (35) = happyShift action_20
action_27 (36) = happyShift action_21
action_27 (37) = happyShift action_22
action_27 (38) = happyShift action_23
action_27 (39) = happyShift action_24
action_27 (40) = happyShift action_25
action_27 (5) = happyGoto action_66
action_27 (6) = happyGoto action_11
action_27 (7) = happyGoto action_12
action_27 _ = happyFail

action_28 (10) = happyShift action_13
action_28 (11) = happyShift action_14
action_28 (15) = happyShift action_15
action_28 (24) = happyShift action_16
action_28 (27) = happyShift action_17
action_28 (33) = happyShift action_18
action_28 (34) = happyShift action_19
action_28 (35) = happyShift action_20
action_28 (36) = happyShift action_21
action_28 (37) = happyShift action_22
action_28 (38) = happyShift action_23
action_28 (39) = happyShift action_24
action_28 (40) = happyShift action_25
action_28 (5) = happyGoto action_62
action_28 (6) = happyGoto action_11
action_28 (7) = happyGoto action_12
action_28 (8) = happyGoto action_65
action_28 _ = happyFail

action_29 (10) = happyShift action_13
action_29 (11) = happyShift action_14
action_29 (15) = happyShift action_15
action_29 (24) = happyShift action_16
action_29 (27) = happyShift action_17
action_29 (33) = happyShift action_18
action_29 (34) = happyShift action_19
action_29 (35) = happyShift action_20
action_29 (36) = happyShift action_21
action_29 (37) = happyShift action_22
action_29 (38) = happyShift action_23
action_29 (39) = happyShift action_24
action_29 (40) = happyShift action_25
action_29 (5) = happyGoto action_64
action_29 (6) = happyGoto action_11
action_29 (7) = happyGoto action_12
action_29 _ = happyFail

action_30 (10) = happyShift action_13
action_30 (11) = happyShift action_14
action_30 (15) = happyShift action_15
action_30 (24) = happyShift action_16
action_30 (27) = happyShift action_17
action_30 (33) = happyShift action_18
action_30 (34) = happyShift action_19
action_30 (35) = happyShift action_20
action_30 (36) = happyShift action_21
action_30 (37) = happyShift action_22
action_30 (38) = happyShift action_23
action_30 (39) = happyShift action_24
action_30 (40) = happyShift action_25
action_30 (5) = happyGoto action_62
action_30 (6) = happyGoto action_11
action_30 (7) = happyGoto action_12
action_30 (8) = happyGoto action_63
action_30 _ = happyFail

action_31 (16) = happyShift action_38
action_31 (17) = happyShift action_39
action_31 (18) = happyShift action_40
action_31 (19) = happyShift action_41
action_31 (20) = happyShift action_42
action_31 (21) = happyShift action_43
action_31 (22) = happyShift action_44
action_31 (23) = happyShift action_45
action_31 (24) = happyShift action_46
action_31 (28) = happyShift action_61
action_31 _ = happyFail

action_32 _ = happyReduce_33

action_33 (15) = happyShift action_60
action_33 _ = happyFail

action_34 (11) = happyShift action_59
action_34 _ = happyFail

action_35 (10) = happyShift action_13
action_35 (11) = happyShift action_14
action_35 (15) = happyShift action_15
action_35 (24) = happyShift action_16
action_35 (27) = happyShift action_17
action_35 (33) = happyShift action_18
action_35 (34) = happyShift action_19
action_35 (35) = happyShift action_20
action_35 (36) = happyShift action_21
action_35 (37) = happyShift action_22
action_35 (38) = happyShift action_23
action_35 (39) = happyShift action_24
action_35 (40) = happyShift action_25
action_35 (7) = happyGoto action_58
action_35 _ = happyFail

action_36 (10) = happyShift action_13
action_36 (11) = happyShift action_14
action_36 (15) = happyShift action_15
action_36 (24) = happyShift action_16
action_36 (27) = happyShift action_17
action_36 (33) = happyShift action_18
action_36 (34) = happyShift action_19
action_36 (35) = happyShift action_20
action_36 (36) = happyShift action_21
action_36 (37) = happyShift action_22
action_36 (38) = happyShift action_23
action_36 (39) = happyShift action_24
action_36 (40) = happyShift action_25
action_36 (7) = happyGoto action_57
action_36 _ = happyFail

action_37 (10) = happyShift action_13
action_37 (11) = happyShift action_14
action_37 (15) = happyShift action_15
action_37 (24) = happyShift action_16
action_37 (27) = happyShift action_17
action_37 (33) = happyShift action_18
action_37 (34) = happyShift action_19
action_37 (35) = happyShift action_20
action_37 (36) = happyShift action_21
action_37 (37) = happyShift action_22
action_37 (38) = happyShift action_23
action_37 (39) = happyShift action_24
action_37 (40) = happyShift action_25
action_37 (7) = happyGoto action_56
action_37 _ = happyFail

action_38 (10) = happyShift action_13
action_38 (11) = happyShift action_14
action_38 (15) = happyShift action_15
action_38 (24) = happyShift action_16
action_38 (27) = happyShift action_17
action_38 (33) = happyShift action_18
action_38 (34) = happyShift action_19
action_38 (35) = happyShift action_20
action_38 (36) = happyShift action_21
action_38 (37) = happyShift action_22
action_38 (38) = happyShift action_23
action_38 (39) = happyShift action_24
action_38 (40) = happyShift action_25
action_38 (6) = happyGoto action_55
action_38 (7) = happyGoto action_12
action_38 _ = happyFail

action_39 (10) = happyShift action_13
action_39 (11) = happyShift action_14
action_39 (15) = happyShift action_15
action_39 (24) = happyShift action_16
action_39 (27) = happyShift action_17
action_39 (33) = happyShift action_18
action_39 (34) = happyShift action_19
action_39 (35) = happyShift action_20
action_39 (36) = happyShift action_21
action_39 (37) = happyShift action_22
action_39 (38) = happyShift action_23
action_39 (39) = happyShift action_24
action_39 (40) = happyShift action_25
action_39 (6) = happyGoto action_54
action_39 (7) = happyGoto action_12
action_39 _ = happyFail

action_40 (10) = happyShift action_13
action_40 (11) = happyShift action_14
action_40 (15) = happyShift action_15
action_40 (24) = happyShift action_16
action_40 (27) = happyShift action_17
action_40 (33) = happyShift action_18
action_40 (34) = happyShift action_19
action_40 (35) = happyShift action_20
action_40 (36) = happyShift action_21
action_40 (37) = happyShift action_22
action_40 (38) = happyShift action_23
action_40 (39) = happyShift action_24
action_40 (40) = happyShift action_25
action_40 (6) = happyGoto action_53
action_40 (7) = happyGoto action_12
action_40 _ = happyFail

action_41 (10) = happyShift action_13
action_41 (11) = happyShift action_14
action_41 (15) = happyShift action_15
action_41 (24) = happyShift action_16
action_41 (27) = happyShift action_17
action_41 (33) = happyShift action_18
action_41 (34) = happyShift action_19
action_41 (35) = happyShift action_20
action_41 (36) = happyShift action_21
action_41 (37) = happyShift action_22
action_41 (38) = happyShift action_23
action_41 (39) = happyShift action_24
action_41 (40) = happyShift action_25
action_41 (6) = happyGoto action_52
action_41 (7) = happyGoto action_12
action_41 _ = happyFail

action_42 (10) = happyShift action_13
action_42 (11) = happyShift action_14
action_42 (15) = happyShift action_15
action_42 (24) = happyShift action_16
action_42 (27) = happyShift action_17
action_42 (33) = happyShift action_18
action_42 (34) = happyShift action_19
action_42 (35) = happyShift action_20
action_42 (36) = happyShift action_21
action_42 (37) = happyShift action_22
action_42 (38) = happyShift action_23
action_42 (39) = happyShift action_24
action_42 (40) = happyShift action_25
action_42 (6) = happyGoto action_51
action_42 (7) = happyGoto action_12
action_42 _ = happyFail

action_43 (10) = happyShift action_13
action_43 (11) = happyShift action_14
action_43 (15) = happyShift action_15
action_43 (24) = happyShift action_16
action_43 (27) = happyShift action_17
action_43 (33) = happyShift action_18
action_43 (34) = happyShift action_19
action_43 (35) = happyShift action_20
action_43 (36) = happyShift action_21
action_43 (37) = happyShift action_22
action_43 (38) = happyShift action_23
action_43 (39) = happyShift action_24
action_43 (40) = happyShift action_25
action_43 (6) = happyGoto action_50
action_43 (7) = happyGoto action_12
action_43 _ = happyFail

action_44 (10) = happyShift action_13
action_44 (11) = happyShift action_14
action_44 (15) = happyShift action_15
action_44 (24) = happyShift action_16
action_44 (27) = happyShift action_17
action_44 (33) = happyShift action_18
action_44 (34) = happyShift action_19
action_44 (35) = happyShift action_20
action_44 (36) = happyShift action_21
action_44 (37) = happyShift action_22
action_44 (38) = happyShift action_23
action_44 (39) = happyShift action_24
action_44 (40) = happyShift action_25
action_44 (6) = happyGoto action_49
action_44 (7) = happyGoto action_12
action_44 _ = happyFail

action_45 (10) = happyShift action_13
action_45 (11) = happyShift action_14
action_45 (15) = happyShift action_15
action_45 (24) = happyShift action_16
action_45 (27) = happyShift action_17
action_45 (33) = happyShift action_18
action_45 (34) = happyShift action_19
action_45 (35) = happyShift action_20
action_45 (36) = happyShift action_21
action_45 (37) = happyShift action_22
action_45 (38) = happyShift action_23
action_45 (39) = happyShift action_24
action_45 (40) = happyShift action_25
action_45 (6) = happyGoto action_48
action_45 (7) = happyGoto action_12
action_45 _ = happyFail

action_46 (10) = happyShift action_13
action_46 (11) = happyShift action_14
action_46 (15) = happyShift action_15
action_46 (24) = happyShift action_16
action_46 (27) = happyShift action_17
action_46 (33) = happyShift action_18
action_46 (34) = happyShift action_19
action_46 (35) = happyShift action_20
action_46 (36) = happyShift action_21
action_46 (37) = happyShift action_22
action_46 (38) = happyShift action_23
action_46 (39) = happyShift action_24
action_46 (40) = happyShift action_25
action_46 (6) = happyGoto action_47
action_46 (7) = happyGoto action_12
action_46 _ = happyFail

action_47 (25) = happyShift action_35
action_47 (26) = happyShift action_36
action_47 (31) = happyShift action_37
action_47 _ = happyReduce_15

action_48 (25) = happyShift action_35
action_48 (26) = happyShift action_36
action_48 (31) = happyShift action_37
action_48 _ = happyReduce_14

action_49 (25) = happyShift action_35
action_49 (26) = happyShift action_36
action_49 (31) = happyShift action_37
action_49 _ = happyReduce_13

action_50 (25) = happyShift action_35
action_50 (26) = happyShift action_36
action_50 (31) = happyShift action_37
action_50 _ = happyReduce_12

action_51 (25) = happyShift action_35
action_51 (26) = happyShift action_36
action_51 (31) = happyShift action_37
action_51 _ = happyReduce_11

action_52 (25) = happyShift action_35
action_52 (26) = happyShift action_36
action_52 (31) = happyShift action_37
action_52 _ = happyReduce_10

action_53 (25) = happyShift action_35
action_53 (26) = happyShift action_36
action_53 (31) = happyShift action_37
action_53 _ = happyReduce_9

action_54 (25) = happyShift action_35
action_54 (26) = happyShift action_36
action_54 (31) = happyShift action_37
action_54 _ = happyReduce_8

action_55 (25) = happyShift action_35
action_55 (26) = happyShift action_36
action_55 (31) = happyShift action_37
action_55 _ = happyReduce_7

action_56 _ = happyReduce_18

action_57 _ = happyReduce_19

action_58 _ = happyReduce_17

action_59 _ = happyReduce_23

action_60 _ = happyReduce_25

action_61 _ = happyReduce_27

action_62 (13) = happyShift action_71
action_62 (16) = happyShift action_38
action_62 (17) = happyShift action_39
action_62 (18) = happyShift action_40
action_62 (19) = happyShift action_41
action_62 (20) = happyShift action_42
action_62 (21) = happyShift action_43
action_62 (22) = happyShift action_44
action_62 (23) = happyShift action_45
action_62 (24) = happyShift action_46
action_62 (28) = happyShift action_72
action_62 _ = happyFail

action_63 _ = happyReduce_28

action_64 (13) = happyShift action_70
action_64 (16) = happyShift action_38
action_64 (17) = happyShift action_39
action_64 (18) = happyShift action_40
action_64 (19) = happyShift action_41
action_64 (20) = happyShift action_42
action_64 (21) = happyShift action_43
action_64 (22) = happyShift action_44
action_64 (23) = happyShift action_45
action_64 (24) = happyShift action_46
action_64 _ = happyFail

action_65 _ = happyReduce_29

action_66 (13) = happyShift action_69
action_66 (16) = happyShift action_38
action_66 (17) = happyShift action_39
action_66 (18) = happyShift action_40
action_66 (19) = happyShift action_41
action_66 (20) = happyShift action_42
action_66 (21) = happyShift action_43
action_66 (22) = happyShift action_44
action_66 (23) = happyShift action_45
action_66 (24) = happyShift action_46
action_66 _ = happyFail

action_67 (16) = happyShift action_38
action_67 (17) = happyShift action_39
action_67 (18) = happyShift action_40
action_67 (19) = happyShift action_41
action_67 (20) = happyShift action_42
action_67 (21) = happyShift action_43
action_67 (22) = happyShift action_44
action_67 (23) = happyShift action_45
action_67 (24) = happyShift action_46
action_67 (28) = happyShift action_68
action_67 _ = happyFail

action_68 _ = happyReduce_31

action_69 (10) = happyShift action_13
action_69 (11) = happyShift action_14
action_69 (15) = happyShift action_15
action_69 (24) = happyShift action_16
action_69 (27) = happyShift action_17
action_69 (33) = happyShift action_18
action_69 (34) = happyShift action_19
action_69 (35) = happyShift action_20
action_69 (36) = happyShift action_21
action_69 (37) = happyShift action_22
action_69 (38) = happyShift action_23
action_69 (39) = happyShift action_24
action_69 (40) = happyShift action_25
action_69 (5) = happyGoto action_75
action_69 (6) = happyGoto action_11
action_69 (7) = happyGoto action_12
action_69 _ = happyFail

action_70 (10) = happyShift action_13
action_70 (11) = happyShift action_14
action_70 (15) = happyShift action_15
action_70 (24) = happyShift action_16
action_70 (27) = happyShift action_17
action_70 (33) = happyShift action_18
action_70 (34) = happyShift action_19
action_70 (35) = happyShift action_20
action_70 (36) = happyShift action_21
action_70 (37) = happyShift action_22
action_70 (38) = happyShift action_23
action_70 (39) = happyShift action_24
action_70 (40) = happyShift action_25
action_70 (5) = happyGoto action_74
action_70 (6) = happyGoto action_11
action_70 (7) = happyGoto action_12
action_70 _ = happyFail

action_71 (10) = happyShift action_13
action_71 (11) = happyShift action_14
action_71 (15) = happyShift action_15
action_71 (24) = happyShift action_16
action_71 (27) = happyShift action_17
action_71 (33) = happyShift action_18
action_71 (34) = happyShift action_19
action_71 (35) = happyShift action_20
action_71 (36) = happyShift action_21
action_71 (37) = happyShift action_22
action_71 (38) = happyShift action_23
action_71 (39) = happyShift action_24
action_71 (40) = happyShift action_25
action_71 (5) = happyGoto action_62
action_71 (6) = happyGoto action_11
action_71 (7) = happyGoto action_12
action_71 (8) = happyGoto action_73
action_71 _ = happyFail

action_72 _ = happyReduce_35

action_73 _ = happyReduce_36

action_74 (13) = happyShift action_77
action_74 (16) = happyShift action_38
action_74 (17) = happyShift action_39
action_74 (18) = happyShift action_40
action_74 (19) = happyShift action_41
action_74 (20) = happyShift action_42
action_74 (21) = happyShift action_43
action_74 (22) = happyShift action_44
action_74 (23) = happyShift action_45
action_74 (24) = happyShift action_46
action_74 _ = happyFail

action_75 (16) = happyShift action_38
action_75 (17) = happyShift action_39
action_75 (18) = happyShift action_40
action_75 (19) = happyShift action_41
action_75 (20) = happyShift action_42
action_75 (21) = happyShift action_43
action_75 (22) = happyShift action_44
action_75 (23) = happyShift action_45
action_75 (24) = happyShift action_46
action_75 (28) = happyShift action_76
action_75 _ = happyFail

action_76 _ = happyReduce_30

action_77 (10) = happyShift action_13
action_77 (11) = happyShift action_14
action_77 (15) = happyShift action_15
action_77 (24) = happyShift action_16
action_77 (27) = happyShift action_17
action_77 (33) = happyShift action_18
action_77 (34) = happyShift action_19
action_77 (35) = happyShift action_20
action_77 (36) = happyShift action_21
action_77 (37) = happyShift action_22
action_77 (38) = happyShift action_23
action_77 (39) = happyShift action_24
action_77 (40) = happyShift action_25
action_77 (5) = happyGoto action_78
action_77 (6) = happyGoto action_11
action_77 (7) = happyGoto action_12
action_77 _ = happyFail

action_78 (16) = happyShift action_38
action_78 (17) = happyShift action_39
action_78 (18) = happyShift action_40
action_78 (19) = happyShift action_41
action_78 (20) = happyShift action_42
action_78 (21) = happyShift action_43
action_78 (22) = happyShift action_44
action_78 (23) = happyShift action_45
action_78 (24) = happyShift action_46
action_78 (28) = happyShift action_79
action_78 _ = happyFail

action_79 _ = happyReduce_32

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
		 (Potencia happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  6 happyReduction_19
happyReduction_19 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Div happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  6 happyReduction_20
happyReduction_20 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_20 _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  7 happyReduction_21
happyReduction_21 (HappyTerminal (TokenFloat happy_var_1))
	 =  HappyAbsSyn7
		 (EFl happy_var_1
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_1  7 happyReduction_22
happyReduction_22 (HappyTerminal (TokenCelda happy_var_1))
	 =  HappyAbsSyn7
		 (Var happy_var_1
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  7 happyReduction_23
happyReduction_23 (HappyTerminal (TokenCelda happy_var_3))
	_
	(HappyTerminal (TokenCelda happy_var_1))
	 =  HappyAbsSyn7
		 (Ran happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  7 happyReduction_24
happyReduction_24 _
	 =  HappyAbsSyn7
		 (EBo True
	)

happyReduce_25 = happySpecReduce_3  7 happyReduction_25
happyReduction_25 _
	(HappyTerminal (TokenString happy_var_2))
	_
	 =  HappyAbsSyn7
		 (EStr happy_var_2
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_1  7 happyReduction_26
happyReduction_26 _
	 =  HappyAbsSyn7
		 (EBo False
	)

happyReduce_27 = happySpecReduce_3  7 happyReduction_27
happyReduction_27 _
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (happy_var_2
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  7 happyReduction_28
happyReduction_28 (HappyAbsSyn8  happy_var_3)
	_
	_
	 =  HappyAbsSyn7
		 (Suma happy_var_3
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  7 happyReduction_29
happyReduction_29 (HappyAbsSyn8  happy_var_3)
	_
	_
	 =  HappyAbsSyn7
		 (Concat happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happyReduce 6 7 happyReduction_30
happyReduction_30 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (ContarSi happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_31 = happyReduce 4 7 happyReduction_31
happyReduction_31 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Abs happy_var_3
	) `HappyStk` happyRest

happyReduce_32 = happyReduce 8 7 happyReduction_32
happyReduction_32 (_ `HappyStk`
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

happyReduce_33 = happySpecReduce_2  7 happyReduction_33
happyReduction_33 (HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (Opuesto happy_var_2
	)
happyReduction_33 _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_1  7 happyReduction_34
happyReduction_34 _
	 =  HappyAbsSyn7
		 (Star
	)

happyReduce_35 = happySpecReduce_2  8 happyReduction_35
happyReduction_35 _
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn8
		 ([happy_var_1]
	)
happyReduction_35 _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  8 happyReduction_36
happyReduction_36 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1:happy_var_3
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 41 41 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenString happy_dollar_dollar -> cont 9;
	TokenFloat happy_dollar_dollar -> cont 10;
	TokenCelda happy_dollar_dollar -> cont 11;
	TokenPunto -> cont 12;
	TokenComa -> cont 13;
	TokenEval -> cont 14;
	TokenComilla -> cont 15;
	TokenIg -> cont 16;
	TokenMenor -> cont 17;
	TokenMayor -> cont 18;
	TokenMenorIg -> cont 19;
	TokenMayorIg -> cont 20;
	TokenAnd -> cont 21;
	TokenOr -> cont 22;
	TokenMas -> cont 23;
	TokenMenos -> cont 24;
	TokenPor -> cont 25;
	TokenDiv -> cont 26;
	TokenParIzq -> cont 27;
	TokenParDer -> cont 28;
	TokenCorIzq -> cont 29;
	TokenCorDer -> cont 30;
	TokenPot -> cont 31;
	TokenDoblePunto -> cont 32;
	TokenAdm -> cont 33;
	TokenSUMATORIA -> cont 34;
	TokenSI -> cont 35;
	TokenCONCATENACION -> cont 36;
	TokenCONTARSI -> cont 37;
	TokenABSOLUTO -> cont 38;
	TokenTRUE -> cont 39;
	TokenFALSE -> cont 40;
	_ -> happyError' (tk:tks)
	}

happyError_ 41 tk tks = happyError' tks
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
      | c == '!' = TokenAdm : lexer2 cs
      | c == '-' = TokenMenos : lexer2 cs
      | c == '*' = TokenPor : lexer2 cs
      | c == '^' = TokenPot : lexer2 cs
      | c == ':' = TokenDoblePunto : lexer2 cs
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
      ("contarSi",rest) -> TokenCONTARSI : lexer2 rest
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
