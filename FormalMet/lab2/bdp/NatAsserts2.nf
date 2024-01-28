Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(NatAsserts2))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(NatAsserts2))==(Machine(NatAsserts2));
  Level(Machine(NatAsserts2))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(NatAsserts2)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(NatAsserts2))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(NatAsserts2))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(NatAsserts2))==(?);
  List_Includes(Machine(NatAsserts2))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(NatAsserts2))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(NatAsserts2))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(NatAsserts2))==(?);
  Context_List_Variables(Machine(NatAsserts2))==(?);
  Abstract_List_Variables(Machine(NatAsserts2))==(?);
  Local_List_Variables(Machine(NatAsserts2))==(?);
  List_Variables(Machine(NatAsserts2))==(?);
  External_List_Variables(Machine(NatAsserts2))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(NatAsserts2))==(?);
  Abstract_List_VisibleVariables(Machine(NatAsserts2))==(?);
  External_List_VisibleVariables(Machine(NatAsserts2))==(?);
  Expanded_List_VisibleVariables(Machine(NatAsserts2))==(?);
  List_VisibleVariables(Machine(NatAsserts2))==(?);
  Internal_List_VisibleVariables(Machine(NatAsserts2))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(NatAsserts2))==(btrue);
  Gluing_List_Invariant(Machine(NatAsserts2))==(btrue);
  Expanded_List_Invariant(Machine(NatAsserts2))==(btrue);
  Abstract_List_Invariant(Machine(NatAsserts2))==(btrue);
  Context_List_Invariant(Machine(NatAsserts2))==(btrue);
  List_Invariant(Machine(NatAsserts2))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(NatAsserts2))==(btrue);
  Abstract_List_Assertions(Machine(NatAsserts2))==(btrue);
  Context_List_Assertions(Machine(NatAsserts2))==(btrue);
  List_Assertions(Machine(NatAsserts2))==(#xx.(xx: NATURAL & !yy.(yy: INTEGER => xx<=yy)) & !xx.(xx: NATURAL => #yy.(yy: NATURAL & xx<yy)) & !(nn,mm).(nn: NATURAL & mm: NATURAL & nn/=mm => nn<mm or nn>mm) & !nn.(nn: NATURAL => #kk.(kk: NATURAL & (nn = 2*kk or nn = 2*kk+1))) & !nn.(nn: NATURAL => #kk.(kk: NATURAL & nn = kk*nn) & #kk.(kk: NATURAL & 0 = kk*nn)) & #kk.(kk: NATURAL & !nn.(nn: NATURAL => #kk.(kk: NATURAL & nn = kk*kk))) & !(dd,nn).(dd: NATURAL & nn: NATURAL & dd/=0 => #kk.(kk: NATURAL & nn = kk*dd) <=> (nn mod dd = 0)) & !nn.(nn: NATURAL => #kk.(kk: NATURAL & nn = kk*nn) & !mm.(mm: NATURAL => (#kk.(kk: NATURAL & mm = kk*nn) & #kk.(kk: NATURAL & nn = kk*mm) => nn = mm) & !kk.(kk: NATURAL & #kk.(kk: NATURAL & kk = kk*mm) & #kk.(kk: NATURAL & mm = kk*nn) => #kk.(kk: NATURAL & kk = kk*nn)))) & !nn.(nn: NATURAL => nn mod 2 = 0 <=> #kk.(kk: NATURAL & nn = kk*2)))
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(NatAsserts2))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(NatAsserts2))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(NatAsserts2))==(skip);
  Context_List_Initialisation(Machine(NatAsserts2))==(skip);
  List_Initialisation(Machine(NatAsserts2))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(NatAsserts2))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(NatAsserts2))==(btrue);
  List_Constraints(Machine(NatAsserts2))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(NatAsserts2))==(?);
  List_Operations(Machine(NatAsserts2))==(?)
END
&
THEORY ListInputX END
&
THEORY ListOutputX END
&
THEORY ListHeaderX END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX END
&
THEORY ListSubstitutionX END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(NatAsserts2))==(?);
  Inherited_List_Constants(Machine(NatAsserts2))==(?);
  List_Constants(Machine(NatAsserts2))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(NatAsserts2))==(?);
  Context_List_Defered(Machine(NatAsserts2))==(?);
  Context_List_Sets(Machine(NatAsserts2))==(?);
  List_Valuable_Sets(Machine(NatAsserts2))==(?);
  Inherited_List_Enumerated(Machine(NatAsserts2))==(?);
  Inherited_List_Defered(Machine(NatAsserts2))==(?);
  Inherited_List_Sets(Machine(NatAsserts2))==(?);
  List_Enumerated(Machine(NatAsserts2))==(?);
  List_Defered(Machine(NatAsserts2))==(?);
  List_Sets(Machine(NatAsserts2))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(NatAsserts2))==(?);
  Expanded_List_HiddenConstants(Machine(NatAsserts2))==(?);
  List_HiddenConstants(Machine(NatAsserts2))==(?);
  External_List_HiddenConstants(Machine(NatAsserts2))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(NatAsserts2))==(btrue);
  Context_List_Properties(Machine(NatAsserts2))==(btrue);
  Inherited_List_Properties(Machine(NatAsserts2))==(btrue);
  List_Properties(Machine(NatAsserts2))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(NatAsserts2)) == (? | ? | ? | ? | ? | ? | ? | ? | NatAsserts2);
  List_Of_HiddenCst_Ids(Machine(NatAsserts2)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(NatAsserts2)) == (?);
  List_Of_VisibleVar_Ids(Machine(NatAsserts2)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(NatAsserts2)) == (?: ?)
END
&
THEORY TCIntRdX IS
  predB0 == OK;
  extended_sees == KO;
  B0check_tab == KO;
  local_op == OK;
  abstract_constants_visible_in_values == KO;
  project_type == SOFTWARE_TYPE;
  event_b_deadlockfreeness == KO;
  variant_clause_mandatory == KO;
  event_b_coverage == KO;
  event_b_exclusivity == KO;
  genFeasibilityPO == KO
END
)
