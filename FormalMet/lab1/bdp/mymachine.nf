Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(mymachine))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(mymachine))==(Machine(mymachine));
  Level(Machine(mymachine))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(mymachine)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(mymachine))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(mymachine))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(mymachine))==(?);
  List_Includes(Machine(mymachine))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(mymachine))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(mymachine))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(mymachine))==(?);
  Context_List_Variables(Machine(mymachine))==(?);
  Abstract_List_Variables(Machine(mymachine))==(?);
  Local_List_Variables(Machine(mymachine))==(?);
  List_Variables(Machine(mymachine))==(?);
  External_List_Variables(Machine(mymachine))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(mymachine))==(?);
  Abstract_List_VisibleVariables(Machine(mymachine))==(?);
  External_List_VisibleVariables(Machine(mymachine))==(?);
  Expanded_List_VisibleVariables(Machine(mymachine))==(?);
  List_VisibleVariables(Machine(mymachine))==(?);
  Internal_List_VisibleVariables(Machine(mymachine))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(mymachine))==(btrue);
  Gluing_List_Invariant(Machine(mymachine))==(btrue);
  Expanded_List_Invariant(Machine(mymachine))==(btrue);
  Abstract_List_Invariant(Machine(mymachine))==(btrue);
  Context_List_Invariant(Machine(mymachine))==(btrue);
  List_Invariant(Machine(mymachine))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(mymachine))==(btrue);
  Abstract_List_Assertions(Machine(mymachine))==(btrue);
  Context_List_Assertions(Machine(mymachine))==(btrue);
  List_Assertions(Machine(mymachine))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(mymachine))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(mymachine))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(mymachine))==(skip);
  Context_List_Initialisation(Machine(mymachine))==(skip);
  List_Initialisation(Machine(mymachine))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(mymachine))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(mymachine))==(btrue);
  List_Constraints(Machine(mymachine))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(mymachine))==(?);
  List_Operations(Machine(mymachine))==(?)
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
  List_Valuable_Constants(Machine(mymachine))==(?);
  Inherited_List_Constants(Machine(mymachine))==(?);
  List_Constants(Machine(mymachine))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(mymachine))==(?);
  Context_List_Defered(Machine(mymachine))==(?);
  Context_List_Sets(Machine(mymachine))==(?);
  List_Valuable_Sets(Machine(mymachine))==(?);
  Inherited_List_Enumerated(Machine(mymachine))==(?);
  Inherited_List_Defered(Machine(mymachine))==(?);
  Inherited_List_Sets(Machine(mymachine))==(?);
  List_Enumerated(Machine(mymachine))==(?);
  List_Defered(Machine(mymachine))==(?);
  List_Sets(Machine(mymachine))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(mymachine))==(?);
  Expanded_List_HiddenConstants(Machine(mymachine))==(?);
  List_HiddenConstants(Machine(mymachine))==(?);
  External_List_HiddenConstants(Machine(mymachine))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(mymachine))==(btrue);
  Context_List_Properties(Machine(mymachine))==(btrue);
  Inherited_List_Properties(Machine(mymachine))==(btrue);
  List_Properties(Machine(mymachine))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(mymachine)) == (? | ? | ? | ? | ? | ? | ? | ? | mymachine);
  List_Of_HiddenCst_Ids(Machine(mymachine)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(mymachine)) == (?);
  List_Of_VisibleVar_Ids(Machine(mymachine)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(mymachine)) == (?: ?)
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
