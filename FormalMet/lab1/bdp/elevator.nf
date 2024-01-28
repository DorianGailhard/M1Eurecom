Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(elevator))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(elevator))==(Machine(elevator));
  Level(Machine(elevator))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(elevator)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(elevator))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(elevator))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(elevator))==(?);
  List_Includes(Machine(elevator))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(elevator))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(elevator))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(elevator))==(?);
  Context_List_Variables(Machine(elevator))==(?);
  Abstract_List_Variables(Machine(elevator))==(?);
  Local_List_Variables(Machine(elevator))==(req,door,currentFloor);
  List_Variables(Machine(elevator))==(req,door,currentFloor);
  External_List_Variables(Machine(elevator))==(req,door,currentFloor)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(elevator))==(?);
  Abstract_List_VisibleVariables(Machine(elevator))==(?);
  External_List_VisibleVariables(Machine(elevator))==(?);
  Expanded_List_VisibleVariables(Machine(elevator))==(?);
  List_VisibleVariables(Machine(elevator))==(?);
  Internal_List_VisibleVariables(Machine(elevator))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(elevator))==(btrue);
  Gluing_List_Invariant(Machine(elevator))==(btrue);
  Expanded_List_Invariant(Machine(elevator))==(btrue);
  Abstract_List_Invariant(Machine(elevator))==(btrue);
  Context_List_Invariant(Machine(elevator))==(btrue);
  List_Invariant(Machine(elevator))==(currentFloor: floors & req <: floors & door: DOORSTATES)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(elevator))==(btrue);
  Abstract_List_Assertions(Machine(elevator))==(btrue);
  Context_List_Assertions(Machine(elevator))==(btrue);
  List_Assertions(Machine(elevator))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(elevator))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(elevator))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(elevator))==(currentFloor,req,door:=fmin,{},closed);
  Context_List_Initialisation(Machine(elevator))==(skip);
  List_Initialisation(Machine(elevator))==(currentFloor:=fmin || req:={} || door:=closed)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(elevator))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(elevator))==(btrue);
  List_Constraints(Machine(elevator))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(elevator))==(request,move,toggle);
  List_Operations(Machine(elevator))==(request,move,toggle)
END
&
THEORY ListInputX IS
  List_Input(Machine(elevator),request)==(fl);
  List_Input(Machine(elevator),move)==(?);
  List_Input(Machine(elevator),toggle)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(elevator),request)==(?);
  List_Output(Machine(elevator),move)==(?);
  List_Output(Machine(elevator),toggle)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(elevator),request)==(request(fl));
  List_Header(Machine(elevator),move)==(move);
  List_Header(Machine(elevator),toggle)==(toggle)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(elevator),request)==(fl: floors);
  List_Precondition(Machine(elevator),move)==(req/={} & currentFloor/:req & door = closed);
  List_Precondition(Machine(elevator),toggle)==(currentFloor: req)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(elevator),toggle)==(currentFloor: req | door = closed ==> door:=open [] not(door = closed) ==> req,door:=req-{currentFloor},closed);
  Expanded_List_Substitution(Machine(elevator),move)==(req/={} & currentFloor/:req & door = closed | @(currentFloor$0).(currentFloor$0: req ==> currentFloor:=currentFloor$0));
  Expanded_List_Substitution(Machine(elevator),request)==(fl: floors | req:=req\/{fl});
  List_Substitution(Machine(elevator),request)==(req:=req\/{fl});
  List_Substitution(Machine(elevator),move)==(currentFloor:: req);
  List_Substitution(Machine(elevator),toggle)==(IF door = closed THEN door:=open ELSE req:=req-{currentFloor} || door:=closed END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(elevator))==(fmin,fmax,floors);
  Inherited_List_Constants(Machine(elevator))==(?);
  List_Constants(Machine(elevator))==(fmin,fmax,floors)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(elevator),DOORSTATES)==({closed,open});
  Context_List_Enumerated(Machine(elevator))==(?);
  Context_List_Defered(Machine(elevator))==(?);
  Context_List_Sets(Machine(elevator))==(?);
  List_Valuable_Sets(Machine(elevator))==(?);
  Inherited_List_Enumerated(Machine(elevator))==(?);
  Inherited_List_Defered(Machine(elevator))==(?);
  Inherited_List_Sets(Machine(elevator))==(?);
  List_Enumerated(Machine(elevator))==(DOORSTATES);
  List_Defered(Machine(elevator))==(?);
  List_Sets(Machine(elevator))==(DOORSTATES)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(elevator))==(?);
  Expanded_List_HiddenConstants(Machine(elevator))==(?);
  List_HiddenConstants(Machine(elevator))==(?);
  External_List_HiddenConstants(Machine(elevator))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(elevator))==(btrue);
  Context_List_Properties(Machine(elevator))==(btrue);
  Inherited_List_Properties(Machine(elevator))==(btrue);
  List_Properties(Machine(elevator))==(fmin: INT & fmax: INT & fmin<fmax & floors = fmin..fmax & DOORSTATES: FIN(INTEGER) & not(DOORSTATES = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(elevator),request)==(?);
  List_ANY_Var(Machine(elevator),move)==(?);
  List_ANY_Var(Machine(elevator),toggle)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(elevator)) == (fmin,fmax,floors,DOORSTATES,closed,open | ? | req,door,currentFloor | ? | request,move,toggle | ? | ? | ? | elevator);
  List_Of_HiddenCst_Ids(Machine(elevator)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(elevator)) == (fmin,fmax,floors);
  List_Of_VisibleVar_Ids(Machine(elevator)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(elevator)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(elevator)) == (Type(DOORSTATES) == Cst(SetOf(etype(DOORSTATES,0,1))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(elevator)) == (Type(closed) == Cst(etype(DOORSTATES,0,1));Type(open) == Cst(etype(DOORSTATES,0,1));Type(fmin) == Cst(btype(INTEGER,?,?));Type(fmax) == Cst(btype(INTEGER,?,?));Type(floors) == Cst(SetOf(btype(INTEGER,"[floors","]floors"))))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(elevator)) == (Type(req) == Mvl(SetOf(btype(INTEGER,?,?)));Type(door) == Mvl(etype(DOORSTATES,?,?));Type(currentFloor) == Mvl(btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(elevator)) == (Type(toggle) == Cst(No_type,No_type);Type(move) == Cst(No_type,No_type);Type(request) == Cst(No_type,btype(INTEGER,?,?)))
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
