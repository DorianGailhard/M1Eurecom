Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Machine2))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Machine2))==(Machine(Machine2));
  Level(Machine(Machine2))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Machine2)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Machine2))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Machine2))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Machine2))==(?);
  List_Includes(Machine(Machine2))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Machine2))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Machine2))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Machine2))==(?);
  Context_List_Variables(Machine(Machine2))==(?);
  Abstract_List_Variables(Machine(Machine2))==(?);
  Local_List_Variables(Machine(Machine2))==(many,few);
  List_Variables(Machine(Machine2))==(many,few);
  External_List_Variables(Machine(Machine2))==(many,few)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Machine2))==(?);
  Abstract_List_VisibleVariables(Machine(Machine2))==(?);
  External_List_VisibleVariables(Machine(Machine2))==(?);
  Expanded_List_VisibleVariables(Machine(Machine2))==(?);
  List_VisibleVariables(Machine(Machine2))==(?);
  Internal_List_VisibleVariables(Machine(Machine2))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Machine2))==(btrue);
  Gluing_List_Invariant(Machine(Machine2))==(btrue);
  Expanded_List_Invariant(Machine(Machine2))==(btrue);
  Abstract_List_Invariant(Machine(Machine2))==(btrue);
  Context_List_Invariant(Machine(Machine2))==(btrue);
  List_Invariant(Machine(Machine2))==(few <: NATURAL & many <: NATURAL & few <: many)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Machine2))==(btrue);
  Abstract_List_Assertions(Machine(Machine2))==(btrue);
  Context_List_Assertions(Machine(Machine2))==(btrue);
  List_Assertions(Machine(Machine2))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Machine2))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Machine2))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Machine2))==(few,many:={2,3},{2,3,4});
  Context_List_Initialisation(Machine(Machine2))==(skip);
  List_Initialisation(Machine(Machine2))==(few,many:={2,3},{2,3,4})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Machine2))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Machine2))==(btrue);
  List_Constraints(Machine(Machine2))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Machine2))==(?);
  List_Operations(Machine(Machine2))==(?)
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
  List_Valuable_Constants(Machine(Machine2))==(?);
  Inherited_List_Constants(Machine(Machine2))==(?);
  List_Constants(Machine(Machine2))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(Machine2))==(?);
  Context_List_Defered(Machine(Machine2))==(?);
  Context_List_Sets(Machine(Machine2))==(?);
  List_Valuable_Sets(Machine(Machine2))==(?);
  Inherited_List_Enumerated(Machine(Machine2))==(?);
  Inherited_List_Defered(Machine(Machine2))==(?);
  Inherited_List_Sets(Machine(Machine2))==(?);
  List_Enumerated(Machine(Machine2))==(?);
  List_Defered(Machine(Machine2))==(?);
  List_Sets(Machine(Machine2))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Machine2))==(?);
  Expanded_List_HiddenConstants(Machine(Machine2))==(?);
  List_HiddenConstants(Machine(Machine2))==(?);
  External_List_HiddenConstants(Machine(Machine2))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Machine2))==(btrue);
  Context_List_Properties(Machine(Machine2))==(btrue);
  Inherited_List_Properties(Machine(Machine2))==(btrue);
  List_Properties(Machine(Machine2))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Machine2)) == (? | ? | many,few | ? | ? | ? | ? | ? | Machine2);
  List_Of_HiddenCst_Ids(Machine(Machine2)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Machine2)) == (?);
  List_Of_VisibleVar_Ids(Machine(Machine2)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Machine2)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Machine2)) == (Type(many) == Mvl(SetOf(btype(INTEGER,?,?)));Type(few) == Mvl(SetOf(btype(INTEGER,?,?))))
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
