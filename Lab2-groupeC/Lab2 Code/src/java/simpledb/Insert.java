package simpledb;

import java.io.IOException;

/**
 * Inserts tuples read from the child operator into the tableId specified in the
 * constructor
 */
public class Insert extends Operator {

    private static final long serialVersionUID = 1L;
    private final TransactionId t;
    private OpIterator child;
    private final int tableId;
    private final TupleDesc td;
    private boolean called;

    /**
     * Constructor.
     *
     * @param t
     *            The transaction running the insert.
     * @param child
     *            The child operator from which to read tuples to be inserted.
     * @param tableId
     *            The table in which to insert tuples.
     * @throws DbException
     *             if TupleDesc of child differs from table into which we are to
     *             insert.
     */
    public Insert(TransactionId t, OpIterator child, int tableId)
            throws DbException {
    	if (!child.getTupleDesc().equals(Database.getCatalog().getDatabaseFile(tableId).getTupleDesc())) {
    		System.out.print(child.getTupleDesc().toString()+"\n");
    		System.out.print(Database.getCatalog().getDatabaseFile(tableId).getTupleDesc()+"\n");
    		throw new DbException("The table does not have the same tuple descriptor as the tuples.");
    	}
    	
        this.t = t;
        this.child = child;
        this.tableId = tableId;
        this.td = new TupleDesc(new Type[]{Type.INT_TYPE});
    }

    public TupleDesc getTupleDesc() {
        return td;
    }

    public void open() throws DbException, TransactionAbortedException {
    	super.open();
        child.open();
        called = false;
    }

    public void close() {
        child.close();
    }

    public void rewind() throws DbException, TransactionAbortedException {
        child.rewind();
        called = false;
    }

    /**
     * Inserts tuples read from child into the tableId specified by the
     * constructor. It returns a one field tuple containing the number of
     * inserted records. Inserts should be passed through BufferPool. An
     * instances of BufferPool is available via Database.getBufferPool(). Note
     * that insert DOES NOT need check to see if a particular tuple is a
     * duplicate before inserting it.
     *
     * @return A 1-field tuple containing the number of inserted records, or
     *         null if called more than once.
     * @see Database#getBufferPool
     * @see BufferPool#insertTuple
     */
    protected Tuple fetchNext() throws TransactionAbortedException, DbException {
	    if (!called) {	
    		int insertCount = 0;
	    	
	        while (child.hasNext()) {
	        	try {
	        		insertCount += 1;
	        		
	        		Tuple tuple = child.next();
	        		Database.getBufferPool().insertTuple(t, tableId, tuple);
	        	} catch (IOException e) {
	        		e.printStackTrace();
	        	}
	        }
	
	        Tuple countResults = new Tuple(td);
	        countResults.setField(0, new IntField(insertCount));
	        System.out.print(countResults.toString()+"\n");
	        called = true;
	        return countResults;
    	} else {
    		return null;
    	}
    }

    @Override
    public OpIterator[] getChildren() {
        return new OpIterator[] {child};
    }

    @Override
    public void setChildren(OpIterator[] children) {
        child = children[0];
    }
}
