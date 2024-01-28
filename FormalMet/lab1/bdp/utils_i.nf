Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(utils_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(utils_i))==(Machine(utils));
  Level(Implementation(utils_i))==(1);
  Upper_Level(Implementation(utils_i))==(Machine(utils))
END
&
THEORY LoadedStructureX IS
  Implementation(utils_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(utils_i))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(utils_i))==(?);
  Inherited_List_Includes(Implementation(utils_i))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(utils_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(utils_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(utils_i))==(?);
  Context_List_Variables(Implementation(utils_i))==(?);
  Abstract_List_Variables(Implementation(utils_i))==(?);
  Local_List_Variables(Implementation(utils_i))==(?);
  List_Variables(Implementation(utils_i))==(?);
  External_List_Variables(Implementation(utils_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(utils_i))==(?);
  Abstract_List_VisibleVariables(Implementation(utils_i))==(?);
  External_List_VisibleVariables(Implementation(utils_i))==(?);
  Expanded_List_VisibleVariables(Implementation(utils_i))==(?);
  List_VisibleVariables(Implementation(utils_i))==(?);
  Internal_List_VisibleVariables(Implementation(utils_i))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(utils_i))==(btrue);
  Expanded_List_Invariant(Implementation(utils_i))==(btrue);
  Abstract_List_Invariant(Implementation(utils_i))==(btrue);
  Context_List_Invariant(Implementation(utils_i))==(btrue);
  List_Invariant(Implementation(utils_i))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(utils_i))==(btrue);
  Abstract_List_Assertions(Implementation(utils_i))==(btrue);
  Context_List_Assertions(Implementation(utils_i))==(btrue);
  List_Assertions(Implementation(utils_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(utils_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(utils_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(utils_i))==(skip);
  Context_List_Initialisation(Implementation(utils_i))==(skip);
  List_Initialisation(Implementation(utils_i))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(utils_i))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(utils_i))==(btrue);
  List_Context_Constraints(Implementation(utils_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(utils_i))==(mini,maxi);
  List_Operations(Implementation(utils_i))==(mini,maxi)
END
&
THEORY ListInputX IS
  List_Input(Implementation(utils_i),mini)==(xx,yy);
  List_Input(Implementation(utils_i),maxi)==(xx,yy,zz)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(utils_i),mini)==(res);
  List_Output(Implementation(utils_i),maxi)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(utils_i),mini)==(res <-- mini(xx,yy));
  List_Header(Implementation(utils_i),maxi)==(res <-- maxi(xx,yy,zz))
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(utils_i),mini)==(btrue);
  List_Precondition(Implementation(utils_i),mini)==(xx: NAT & yy: NAT);
  Own_Precondition(Implementation(utils_i),maxi)==(btrue);
  List_Precondition(Implementation(utils_i),maxi)==(xx: NAT & yy: NAT & zz: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(utils_i),maxi)==(xx: NAT & yy: NAT & zz: NAT | xx>=yy ==> (xx: INT | res:=xx) [] not(xx>=yy) ==> skip;(xx<=yy ==> (yy: INT | res:=yy) [] not(xx<=yy) ==> skip);(res<=zz ==> (zz: INT | res:=zz) [] not(res<=zz) ==> skip));
  Expanded_List_Substitution(Implementation(utils_i),mini)==(xx: NAT & yy: NAT | xx>=yy ==> (yy: INT | res:=yy) [] not(xx>=yy) ==> (xx: INT | res:=xx));
  List_Substitution(Implementation(utils_i),mini)==(IF xx>=yy THEN res:=yy ELSE res:=xx END);
  List_Substitution(Implementation(utils_i),maxi)==(IF xx>=yy THEN res:=xx END;IF xx<=yy THEN res:=yy END;IF res<=zz THEN res:=zz END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(utils_i))==(?);
  Inherited_List_Constants(Implementation(utils_i))==(?);
  List_Constants(Implementation(utils_i))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(utils_i))==(?);
  Context_List_Defered(Implementation(utils_i))==(?);
  Context_List_Sets(Implementation(utils_i))==(?);
  List_Own_Enumerated(Implementation(utils_i))==(?);
  List_Valuable_Sets(Implementation(utils_i))==(?);
  Inherited_List_Enumerated(Implementation(utils_i))==(?);
  Inherited_List_Defered(Implementation(utils_i))==(?);
  Inherited_List_Sets(Implementation(utils_i))==(?);
  List_Enumerated(Implementation(utils_i))==(?);
  List_Defered(Implementation(utils_i))==(?);
  List_Sets(Implementation(utils_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(utils_i))==(?);
  Expanded_List_HiddenConstants(Implementation(utils_i))==(?);
  List_HiddenConstants(Implementation(utils_i))==(?);
  External_List_HiddenConstants(Implementation(utils_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(utils_i))==(btrue);
  Context_List_Properties(Implementation(utils_i))==(btrue);
  Inherited_List_Properties(Implementation(utils_i))==(btrue);
  List_Properties(Implementation(utils_i))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(utils_i))==(aa: aa);
  List_Values(Implementation(utils_i))==(?)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX END
&
THEORY InheritedEnvX IS
  Operations(Implementation(utils_i))==(Type(maxi) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(mini) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?)))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(utils_i)) == (? | ? | ? | ? | mini,maxi | ? | ? | ? | utils_i);
  List_Of_HiddenCst_Ids(Implementation(utils_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(utils_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(utils_i)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(utils_i)) == (?: ?)
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
&
THEORY ListLocalOperationsX IS
  List_Local_Operations(Implementation(utils_i))==(?)
END
&
THEORY ListLocalInputX END
&
THEORY ListLocalOutputX END
&
THEORY ListLocalHeaderX END
&
THEORY ListLocalPreconditionX END
&
THEORY ListLocalSubstitutionX END
&
THEORY TypingPredicateX IS
  TypingPredicate(Implementation(utils_i))==(btrue)
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX END
)
