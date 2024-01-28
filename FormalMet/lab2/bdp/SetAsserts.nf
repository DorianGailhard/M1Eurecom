Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(SetAsserts))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(SetAsserts))==(Machine(SetAsserts));
  Level(Machine(SetAsserts))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(SetAsserts)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(SetAsserts))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(SetAsserts))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(SetAsserts))==(?);
  List_Includes(Machine(SetAsserts))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(SetAsserts))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(SetAsserts))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(SetAsserts))==(?);
  Context_List_Variables(Machine(SetAsserts))==(?);
  Abstract_List_Variables(Machine(SetAsserts))==(?);
  Local_List_Variables(Machine(SetAsserts))==(?);
  List_Variables(Machine(SetAsserts))==(?);
  External_List_Variables(Machine(SetAsserts))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(SetAsserts))==(?);
  Abstract_List_VisibleVariables(Machine(SetAsserts))==(?);
  External_List_VisibleVariables(Machine(SetAsserts))==(?);
  Expanded_List_VisibleVariables(Machine(SetAsserts))==(?);
  List_VisibleVariables(Machine(SetAsserts))==(?);
  Internal_List_VisibleVariables(Machine(SetAsserts))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(SetAsserts))==(btrue);
  Gluing_List_Invariant(Machine(SetAsserts))==(btrue);
  Expanded_List_Invariant(Machine(SetAsserts))==(btrue);
  Abstract_List_Invariant(Machine(SetAsserts))==(btrue);
  Context_List_Invariant(Machine(SetAsserts))==(btrue);
  List_Invariant(Machine(SetAsserts))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(SetAsserts))==(btrue);
  Abstract_List_Assertions(Machine(SetAsserts))==(btrue);
  Context_List_Assertions(Machine(SetAsserts))==(btrue);
  List_Assertions(Machine(SetAsserts))==(!SS.(SS: FIN(NATURAL) => #TT.(TT: FIN(NATURAL) & SS <<: TT)) & !SS.(SS: FIN(NATURAL) => #(aa,bb).(aa: NATURAL & bb: NATURAL & SS <: aa..bb)) & !nn.(nn: NATURAL & nn/=0 => {kk | kk: NATURAL & #kk.(kk: NATURAL & nn = kk*kk)}: FIN(NATURAL)) & !(SS,TT).(SS: FIN(UNIVERSE) & TT: FIN(UNIVERSE) & SS <: TT => card(SS)<=card(TT)) & !(SS,TT).(SS: FIN(UNIVERSE) & TT: FIN(UNIVERSE) => card(SS)<=card(TT) <=> #ff.(ff: SS >-> TT)) & !(SS,TT).(SS: FIN(UNIVERSE) & TT: FIN(UNIVERSE) => card(SS)>=card(TT) <=> #ff.(ff: SS -->> TT)) & !SS.(SS: POW(UNIVERSE) => SS <: SS & !TT.(TT: POW(UNIVERSE) => (SS <: TT & TT <: SS => SS = TT) & !UU.(UU: POW(UNIVERSE) & TT <: UU & SS <: TT => SS <: UU))) & !ff.(#SS.(SS <: POW(UNIVERSE) & ff: SS +-> POW(UNIVERSE) & !(xx,yy).(xx: SS & yy: SS & xx <: yy => ff(xx) <: ff(yy))) => #xx.(xx: POW(UNIVERSE) & ff(xx) = xx)))
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(SetAsserts))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(SetAsserts))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(SetAsserts))==(skip);
  Context_List_Initialisation(Machine(SetAsserts))==(skip);
  List_Initialisation(Machine(SetAsserts))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(SetAsserts))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(SetAsserts))==(btrue);
  List_Constraints(Machine(SetAsserts))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(SetAsserts))==(?);
  List_Operations(Machine(SetAsserts))==(?)
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
  List_Valuable_Constants(Machine(SetAsserts))==(?);
  Inherited_List_Constants(Machine(SetAsserts))==(?);
  List_Constants(Machine(SetAsserts))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(SetAsserts),UNIVERSE)==(?);
  Context_List_Enumerated(Machine(SetAsserts))==(?);
  Context_List_Defered(Machine(SetAsserts))==(?);
  Context_List_Sets(Machine(SetAsserts))==(?);
  List_Valuable_Sets(Machine(SetAsserts))==(UNIVERSE);
  Inherited_List_Enumerated(Machine(SetAsserts))==(?);
  Inherited_List_Defered(Machine(SetAsserts))==(?);
  Inherited_List_Sets(Machine(SetAsserts))==(?);
  List_Enumerated(Machine(SetAsserts))==(?);
  List_Defered(Machine(SetAsserts))==(UNIVERSE);
  List_Sets(Machine(SetAsserts))==(UNIVERSE)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(SetAsserts))==(?);
  Expanded_List_HiddenConstants(Machine(SetAsserts))==(?);
  List_HiddenConstants(Machine(SetAsserts))==(?);
  External_List_HiddenConstants(Machine(SetAsserts))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(SetAsserts))==(btrue);
  Context_List_Properties(Machine(SetAsserts))==(btrue);
  Inherited_List_Properties(Machine(SetAsserts))==(btrue);
  List_Properties(Machine(SetAsserts))==(UNIVERSE: FIN(INTEGER) & not(UNIVERSE = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(SetAsserts)) == (UNIVERSE | ? | ? | ? | ? | ? | ? | ? | SetAsserts);
  List_Of_HiddenCst_Ids(Machine(SetAsserts)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(SetAsserts)) == (?);
  List_Of_VisibleVar_Ids(Machine(SetAsserts)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(SetAsserts)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(SetAsserts)) == (Type(UNIVERSE) == Cst(SetOf(atype(UNIVERSE,"[UNIVERSE","]UNIVERSE"))))
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
