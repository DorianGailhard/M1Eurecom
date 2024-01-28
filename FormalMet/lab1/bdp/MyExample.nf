Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(MyExample))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(MyExample))==(Machine(MyExample));
  Level(Machine(MyExample))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(MyExample)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(MyExample))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(MyExample))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(MyExample))==(?);
  List_Includes(Machine(MyExample))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(MyExample))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(MyExample))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(MyExample))==(?);
  Context_List_Variables(Machine(MyExample))==(?);
  Abstract_List_Variables(Machine(MyExample))==(?);
  Local_List_Variables(Machine(MyExample))==(ss);
  List_Variables(Machine(MyExample))==(ss);
  External_List_Variables(Machine(MyExample))==(ss)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(MyExample))==(?);
  Abstract_List_VisibleVariables(Machine(MyExample))==(?);
  External_List_VisibleVariables(Machine(MyExample))==(?);
  Expanded_List_VisibleVariables(Machine(MyExample))==(?);
  List_VisibleVariables(Machine(MyExample))==(?);
  Internal_List_VisibleVariables(Machine(MyExample))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(MyExample))==(btrue);
  Gluing_List_Invariant(Machine(MyExample))==(btrue);
  Expanded_List_Invariant(Machine(MyExample))==(btrue);
  Abstract_List_Invariant(Machine(MyExample))==(btrue);
  Context_List_Invariant(Machine(MyExample))==(btrue);
  List_Invariant(Machine(MyExample))==(ss <: NATURAL)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(MyExample))==(btrue);
  Abstract_List_Assertions(Machine(MyExample))==(btrue);
  Context_List_Assertions(Machine(MyExample))==(btrue);
  List_Assertions(Machine(MyExample))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(MyExample))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(MyExample))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(MyExample))==(ss:={});
  Context_List_Initialisation(Machine(MyExample))==(skip);
  List_Initialisation(Machine(MyExample))==(ss:={})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(MyExample))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(MyExample))==(btrue);
  List_Constraints(Machine(MyExample))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(MyExample))==(lire,maximum);
  List_Operations(Machine(MyExample))==(lire,maximum)
END
&
THEORY ListInputX IS
  List_Input(Machine(MyExample),lire)==(nn);
  List_Input(Machine(MyExample),maximum)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(MyExample),lire)==(?);
  List_Output(Machine(MyExample),maximum)==(mm)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(MyExample),lire)==(lire(nn));
  List_Header(Machine(MyExample),maximum)==(mm <-- maximum)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(MyExample),lire)==(nn: NATURAL);
  List_Precondition(Machine(MyExample),maximum)==(ss/={})
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(MyExample),maximum)==(ss/={} | mm:=max(ss));
  Expanded_List_Substitution(Machine(MyExample),lire)==(nn: NATURAL | ss:=ss\/{nn});
  List_Substitution(Machine(MyExample),lire)==(ss:=ss\/{nn});
  List_Substitution(Machine(MyExample),maximum)==(mm:=max(ss))
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(MyExample))==(?);
  Inherited_List_Constants(Machine(MyExample))==(?);
  List_Constants(Machine(MyExample))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(MyExample))==(?);
  Context_List_Defered(Machine(MyExample))==(?);
  Context_List_Sets(Machine(MyExample))==(?);
  List_Valuable_Sets(Machine(MyExample))==(?);
  Inherited_List_Enumerated(Machine(MyExample))==(?);
  Inherited_List_Defered(Machine(MyExample))==(?);
  Inherited_List_Sets(Machine(MyExample))==(?);
  List_Enumerated(Machine(MyExample))==(?);
  List_Defered(Machine(MyExample))==(?);
  List_Sets(Machine(MyExample))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(MyExample))==(?);
  Expanded_List_HiddenConstants(Machine(MyExample))==(?);
  List_HiddenConstants(Machine(MyExample))==(?);
  External_List_HiddenConstants(Machine(MyExample))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(MyExample))==(btrue);
  Context_List_Properties(Machine(MyExample))==(btrue);
  Inherited_List_Properties(Machine(MyExample))==(btrue);
  List_Properties(Machine(MyExample))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(MyExample),lire)==(?);
  List_ANY_Var(Machine(MyExample),maximum)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(MyExample)) == (? | ? | ss | ? | lire,maximum | ? | ? | ? | MyExample);
  List_Of_HiddenCst_Ids(Machine(MyExample)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(MyExample)) == (?);
  List_Of_VisibleVar_Ids(Machine(MyExample)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(MyExample)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(MyExample)) == (Type(ss) == Mvl(SetOf(btype(INTEGER,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(MyExample)) == (Type(maximum) == Cst(btype(INTEGER,?,?),No_type);Type(lire) == Cst(No_type,btype(INTEGER,?,?)));
  Observers(Machine(MyExample)) == (Type(maximum) == Cst(btype(INTEGER,?,?),No_type))
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
