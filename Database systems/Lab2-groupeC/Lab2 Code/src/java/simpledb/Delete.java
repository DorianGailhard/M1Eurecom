package simpledb;

import java.io.IOException;

/**
 * The delete operator. Delete reads tuples from its child operator and removes
 * them from the table they belong to.
 */
public class Delete extends Operator {

    private static final long serialVersionUID = 1L;
    private final TransactionId tid;
    private OpIterator child;
    private final TupleDesc td;
    private boolean called;

    /**
     * Constructor specifying the transaction that this delete belongs to as
     * well as the child to read from.
     * 
     * @param t
     *            The transaction this delete runs in
     * @param child
     *            The child operator from which to read tuples for deletion
     */
    public Delete(TransactionId t, OpIterator child) {
    	this.tid = t;
        this.child = child;
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
     * Deletes tuples as they are read from the child operator. Deletes are
     * processed via the buffer pool (which can be accessed via the
     * Database.getBufferPool() method.
     * 
     * @return A 1-field tuple containing the number of deleted records.
     * @see Database#getBufferPool
     * @see BufferPool#deleteTuple
     */
    protected Tuple fetchNext() throws TransactionAbortedException, DbException {
    	if (!called) {	
    		int deleteCount = 0;
	    	
	        while (child.hasNext()) {
	        	try {
	        		Database.getBufferPool().deleteTuple(tid, child.next());
	        	} catch (IOException e) {
	        		e.printStackTrace();
	        	}
	        	
	            deleteCount += 1;
	        }
	
	        Tuple deleteResults = new Tuple(td);
	        deleteResults.setField(0, new IntField(deleteCount));
	        called = true;
	        
	        return deleteResults;
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
