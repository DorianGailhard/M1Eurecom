Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(utils))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(utils))==(Machine(utils));
  Level(Machine(utils))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(utils)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(utils))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(utils))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(utils))==(?);
  List_Includes(Machine(utils))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(utils))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(utils))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(utils))==(?);
  Context_List_Variables(Machine(utils))==(?);
  Abstract_List_Variables(Machine(utils))==(?);
  Local_List_Variables(Machine(utils))==(?);
  List_Variables(Machine(utils))==(?);
  External_List_Variables(Machine(utils))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(utils))==(?);
  Abstract_List_VisibleVariables(Machine(utils))==(?);
  External_List_VisibleVariables(Machine(utils))==(?);
  Expanded_List_VisibleVariables(Machine(utils))==(?);
  List_VisibleVariables(Machine(utils))==(?);
  Internal_List_VisibleVariables(Machine(utils))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(utils))==(btrue);
  Gluing_List_Invariant(Machine(utils))==(btrue);
  Expanded_List_Invariant(Machine(utils))==(btrue);
  Abstract_List_Invariant(Machine(utils))==(btrue);
  Context_List_Invariant(Machine(utils))==(btrue);
  List_Invariant(Machine(utils))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(utils))==(btrue);
  Abstract_List_Assertions(Machine(utils))==(btrue);
  Context_List_Assertions(Machine(utils))==(btrue);
  List_Assertions(Machine(utils))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(utils))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(utils))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(utils))==(skip);
  Context_List_Initialisation(Machine(utils))==(skip);
  List_Initialisation(Machine(utils))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(utils))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(utils))==(btrue);
  List_Constraints(Machine(utils))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(utils))==(mini,maxi);
  List_Operations(Machine(utils))==(mini,maxi)
END
&
THEORY ListInputX IS
  List_Input(Machine(utils),mini)==(xx,yy);
  List_Input(Machine(utils),maxi)==(xx,yy,zz)
END
&
THEORY ListOutputX IS
  List_Output(Machine(utils),mini)==(res);
  List_Output(Machine(utils),maxi)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(utils),mini)==(res <-- mini(xx,yy));
  List_Header(Machine(utils),maxi)==(res <-- maxi(xx,yy,zz))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(utils),mini)==(xx: NAT & yy: NAT);
  List_Precondition(Machine(utils),maxi)==(xx: NAT & yy: NAT & zz: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(utils),maxi)==(xx: NAT & yy: NAT & zz: NAT | res:=max({xx,yy,zz}));
  Expanded_List_Substitution(Machine(utils),mini)==(xx: NAT & yy: NAT | res:=min({xx,yy}));
  List_Substitution(Machine(utils),mini)==(res:=min({xx,yy}));
  List_Substitution(Machine(utils),maxi)==(res:=max({xx,yy,zz}))
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(utils))==(?);
  Inherited_List_Constants(Machine(utils))==(?);
  List_Constants(Machine(utils))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(utils))==(?);
  Context_List_Defered(Machine(utils))==(?);
  Context_List_Sets(Machine(utils))==(?);
  List_Valuable_Sets(Machine(utils))==(?);
  Inherited_List_Enumerated(Machine(utils))==(?);
  Inherited_List_Defered(Machine(utils))==(?);
  Inherited_List_Sets(Machine(utils))==(?);
  List_Enumerated(Machine(utils))==(?);
  List_Defered(Machine(utils))==(?);
  List_Sets(Machine(utils))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(utils))==(?);
  Expanded_List_HiddenConstants(Machine(utils))==(?);
  List_HiddenConstants(Machine(utils))==(?);
  External_List_HiddenConstants(Machine(utils))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(utils))==(btrue);
  Context_List_Properties(Machine(utils))==(btrue);
  Inherited_List_Properties(Machine(utils))==(btrue);
  List_Properties(Machine(utils))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(utils),mini)==(?);
  List_ANY_Var(Machine(utils),maxi)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(utils)) == (? | ? | ? | ? | mini,maxi | ? | ? | ? | utils);
  List_Of_HiddenCst_Ids(Machine(utils)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(utils)) == (?);
  List_Of_VisibleVar_Ids(Machine(utils)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(utils)) == (?: ?)
END
&
THEORY OperationsEnvX IS
  Operations(Machine(utils)) == (Type(maxi) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(mini) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)));
  Observers(Machine(utils)) == (Type(maxi) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(mini) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)))
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
