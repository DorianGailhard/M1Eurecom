package simpledb;

import java.util.ArrayList;
import java.util.HashMap;

/**
 * Knows how to compute some aggregate over a set of IntFields.
 */
public class IntegerAggregator implements Aggregator {

    private static final long serialVersionUID = 1L;
    private int gbField;
    private Type gbFieldType;
    private int afield;
    private Op what;
    private HashMap<Field, Integer> groupCounts;
    private HashMap<Field, Integer> groupAggregates;
    
    /**
     * Aggregate constructor
     * 
     * @param gbfield
     *            the 0-based index of the group-by field in the tuple, or
     *            NO_GROUPING if there is no grouping
     * @param gbfieldtype
     *            the type of the group by field (e.g., Type.INT_TYPE), or null
     *            if there is no grouping
     * @param afield
     *            the 0-based index of the aggregate field in the tuple
     * @param what
     *            the aggregation operator
     */

    public IntegerAggregator(int gbfield, Type gbfieldtype, int afield, Op what) {
        this.gbField = gbfield;
        this.gbFieldType = gbfieldtype;
        this.afield = afield;
        this.what = what;
        this.groupCounts = new HashMap<Field, Integer>();
        this.groupAggregates = new HashMap<Field, Integer>();
    }

    /**
     * Merge a new tuple into the aggregate, grouping as indicated in the
     * constructor
     * 
     * @param tup
     *            the Tuple containing an aggregate field and a group-by field
     */
    public void mergeTupleIntoGroup(Tuple tup) {
    	Field groupByField;
    	
    	if (gbField != Aggregator.NO_GROUPING) {
    		groupByField = tup.getField(gbField);
    	} else {
    		groupByField = null;
    	}
    	
    	Integer count = groupCounts.get(groupByField);
    	
        Integer prev = groupAggregates.get(groupByField); //Previous value
        Integer value = ((IntField)tup.getField(afield)).getValue(); //Value of the field afield for this tuple
        
    	if (count == null) {
    		count = 0;
    	}
    	
    	if (prev == null && (what == Aggregator.Op.SUM || what == Aggregator.Op.AVG)) {
    		prev = 0;
    	}

        groupCounts.put(groupByField, count+1);
        
        switch (what) {
        	case MIN : if (prev == null || prev > value) groupAggregates.put(groupByField, value); break;
        	case MAX : if (prev == null || prev < value) groupAggregates.put(groupByField, value); break;
        	case SUM : groupAggregates.put(groupByField, prev + value); break;
        	case AVG : groupAggregates.put(groupByField, prev + value); break; //Division by the number of tuples will be done in iterator()
        	case COUNT: groupAggregates.put(groupByField, null);
        } //COUNT only needs groupCounts
    }

    /**
     * Create a OpIterator over group aggregate results.
     * 
     * @return a OpIterator whose tuples are the pair (groupVal, aggregateVal)
     *         if using group, or a single (aggregateVal) if no grouping. The
     *         aggregateVal is determined by the type of aggregate specified in
     *         the constructor.
     */
    public OpIterator iterator() {
    	 TupleDesc groupAggregateTd;
         ArrayList<Tuple> tuples = new ArrayList<Tuple>();
         boolean group = (gbField != Aggregator.NO_GROUPING);

         if (group) {
             groupAggregateTd = new TupleDesc(new Type[]{gbFieldType, Type.INT_TYPE});
         } else {
             groupAggregateTd = new TupleDesc(new Type[]{Type.INT_TYPE});
         }

         for (HashMap.Entry<Field, Integer> groupAggregateEntry: groupAggregates.entrySet()) {
             Tuple groupAggregateTuple = new Tuple(groupAggregateTd);
             Integer finalAggregateValue;
             
             switch (what) {
             	case AVG: finalAggregateValue = groupAggregateEntry.getValue()/groupCounts.get(groupAggregateEntry.getKey()); break;
             	case COUNT: finalAggregateValue = groupCounts.get(groupAggregateEntry.getKey()); break;
            	default: finalAggregateValue = groupAggregateEntry.getValue(); break;
             }

             if (group) {
            	 //In tuple[0], the grouping value, in tuple[1], the aggregate value
                 groupAggregateTuple.setField(0, groupAggregateEntry.getKey());
                 groupAggregateTuple.setField(1, new IntField(finalAggregateValue));
             } else {
            	 //No grouping
                 groupAggregateTuple.setField(0, new IntField(finalAggregateValue));
             }
             
             tuples.add(groupAggregateTuple);
         }
         
         return new TupleIterator(groupAggregateTd, tuples);
    }

}
