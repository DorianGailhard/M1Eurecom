package simpledb;

import java.util.ArrayList;
import java.util.HashMap;

import simpledb.Aggregator.Op;

/**
 * Knows how to compute some aggregate over a set of StringFields.
 */
public class StringAggregator implements Aggregator {

    private static final long serialVersionUID = 1L;
    private int gbField;
    private Type gbFieldType;
    private int afield;
    private Op what;
    private HashMap<Field, Integer> groupCounts;
    private HashMap<Field, String> groupAggregates;

    /**
     * Aggregate constructor
     * @param gbfield the 0-based index of the group-by field in the tuple, or NO_GROUPING if there is no grouping
     * @param gbfieldtype the type of the group by field (e.g., Type.INT_TYPE), or null if there is no grouping
     * @param afield the 0-based index of the aggregate field in the tuple
     * @param what aggregation operator to use -- only supports COUNT
     * @throws IllegalArgumentException if what != COUNT
     */

    public StringAggregator(int gbfield, Type gbfieldtype, int afield, Op what) {
        this.gbField = gbfield;
        this.gbFieldType = gbfieldtype;
        this.afield = afield;
        this.what = what;
        this.groupCounts = new HashMap<Field, Integer>();
        this.groupAggregates = new HashMap<Field, String>();
    }

    /**
     * Merge a new tuple into the aggregate, grouping as indicated in the constructor
     * @param tup the Tuple containing an aggregate field and a group-by field
     */
    public void mergeTupleIntoGroup(Tuple tup) {
    	Field groupByField;
    	
    	if (gbField != Aggregator.NO_GROUPING) {
    		groupByField = tup.getField(gbField);
    	} else {
    		groupByField = null;
    	}
    	
    	Integer count = groupCounts.get(groupByField);
    	
        String prev = groupAggregates.get(groupByField); //Previous value
        String value = ((StringField)tup.getField(afield)).getValue(); //Value of the field afield for this tuple
        
    	if (count == null) {
    		count = 0;
    	}
    	
        groupCounts.put(groupByField, count+1);
        
        switch (what) {
        	case MIN : if (prev == null || prev.compareTo(value) < 0) groupAggregates.put(groupByField, value); break;
        	case MAX : if (prev == null || prev.compareTo(value) > 0) groupAggregates.put(groupByField, value); break;
        	case COUNT: groupAggregates.put(groupByField, null);
        } //COUNT only needs groupCounts
    }

    /**
     * Create a OpIterator over group aggregate results.
     *
     * @return a OpIterator whose tuples are the pair (groupVal,
     *   aggregateVal) if using group, or a single (aggregateVal) if no
     *   grouping. The aggregateVal is determined by the type of
     *   aggregate specified in the constructor.
     */
    public OpIterator iterator() {
	   	 TupleDesc groupAggregateTd;
	     ArrayList<Tuple> tuples = new ArrayList<>();
	     boolean group = (gbField != Aggregator.NO_GROUPING);
	     Type aggregateType;
	
	     if (what == Aggregator.Op.COUNT) {
	    	 aggregateType = Type.INT_TYPE;
	     } else {
	    	 aggregateType = Type.STRING_TYPE;
	     }
	     
	     if (group) {
	         groupAggregateTd = new TupleDesc(new Type[]{gbFieldType, aggregateType});
	     } else {
	         groupAggregateTd = new TupleDesc(new Type[]{aggregateType});
	     }
	
	     for (HashMap.Entry<Field, String> groupAggregateEntry: groupAggregates.entrySet()) {
	         Tuple groupAggregateTuple = new Tuple(groupAggregateTd);
	         Field finalAggregateField;
	         
	         switch (what) {
	         	case COUNT: finalAggregateField = new IntField(groupCounts.get(groupAggregateEntry.getKey())); break;
	        	default: finalAggregateField = new StringField(groupAggregateEntry.getValue(),((String)groupAggregateEntry.getValue()).length()); break;
	         }
	
	         if (group) {
	        	 //In tuple[0], the grouping value, in tuple[1], the aggregate value
	             groupAggregateTuple.setField(0, groupAggregateEntry.getKey());
	             groupAggregateTuple.setField(1, finalAggregateField);
	         } else {
	        	 //No grouping
	             groupAggregateTuple.setField(0, finalAggregateField);
	         }
	         
	         tuples.add(groupAggregateTuple);
	     }
	     
	     return new TupleIterator(groupAggregateTd, tuples);
    }

}
