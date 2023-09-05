package simpledb;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.NoSuchElementException;

/**
 * HeapFile is an implementation of a DbFile that stores a collection of tuples
 * in no particular order. Tuples are stored on pages, each of which is a fixed
 * size, and the file is simply a collection of those pages. HeapFile works
 * closely with HeapPage. The format of HeapPages is described in the HeapPage
 * constructor.
 * 
 * @see simpledb.HeapPage#HeapPage
 * @author Sam Madden
 */
public class HeapFile implements DbFile {
	 private final File dbFile;
	 private final TupleDesc tupleDesc;

    /**
     * Constructs a heap file backed by the specified file.
     * 
     * @param f
     *            the file that stores the on-disk backing store for this heap
     *            file.
     */
    public HeapFile(File f, TupleDesc td) {
        // some code goes here
		this.dbFile = f;
		this.tupleDesc = td;
		
		int fileSize = (int) dbFile.length();
    }

    /**
     * Returns the File backing this HeapFile on disk.
     * 
     * @return the File backing this HeapFile on disk.
     */
    public File getFile() {
        // some code goes here
        return dbFile;
    }

    /**
     * Returns an ID uniquely identifying this HeapFile. Implementation note:
     * you will need to generate this tableid somewhere to ensure that each
     * HeapFile has a "unique id," and that you always return the same value for
     * a particular HeapFile. We suggest hashing the absolute file name of the
     * file underlying the heapfile, i.e. f.getAbsoluteFile().hashCode().
     * 
     * @return an ID uniquely identifying this HeapFile.
     */
    public int getId() {
        // some code goes here
        return dbFile.getAbsoluteFile().hashCode();
		}

    /**
     * Returns the TupleDesc of the table stored in this DbFile.
     * 
     * @return TupleDesc of this DbFile.
     */
    public TupleDesc getTupleDesc() {
        // some code goes here
        return tupleDesc;
		}

    // see DbFile.java for javadocs
    public Page readPage(PageId pid) {
    	// some code goes here
        int tableId = pid.getTableId();
    int pgNo = pid.getPageNumber();
    byte[] rawPgData = HeapPage.createEmptyPageData();

    // random access read from disk
    try {
      FileInputStream in = new FileInputStream(dbFile);
      in.skip(pgNo * BufferPool.getPageSize());
      in.read(rawPgData);
      in.close();
      return new HeapPage(new HeapPageId(tableId, pgNo), rawPgData);
    } catch (IOException e) {
      throw new IllegalArgumentException("Heap file I/O error");
    }
    }

    // see DbFile.java for javadocs
    public void writePage(Page page) throws IOException {
    	RandomAccessFile access = new RandomAccessFile(getFile(), "rw");
    		
    	int offset = page.getId().getPageNumber()*BufferPool.getPageSize();
    	access.skipBytes(offset);
    		
    	byte [] data = page.getPageData();
    	access.write(data, 0, BufferPool.getPageSize());
    	access.close();
    		
    	page.markDirty(false, null);
    }

    /**
     * Returns the number of pages in this HeapFile.
     */
    public int numPages() {
        // some code goes here
        int fileSize = (int) dbFile.length();
		return fileSize / BufferPool.getPageSize();
    }

    // see DbFile.java for javadocs
    public ArrayList<Page> insertTuple(TransactionId tid, Tuple t)
            throws DbException, IOException, TransactionAbortedException {
    	//Search for a page with an empty slot
    	HeapPage page = null;
    	
    	for (int i = 0; i < numPages() ; i++) {
            PageId pid = new HeapPageId(this.getId(), i);
            page = (HeapPage) Database.getBufferPool().getPage(tid, pid, Permissions.READ_ONLY);
           
            if (page.getNumEmptySlots() > 0) { break; }
        }
    	
    	if (page == null || !(page.getNumEmptySlots() > 0)) {
    		//No slots available, we create a new page
            HeapPageId heapPageId = new HeapPageId(getId(), numPages());
            page = new HeapPage(heapPageId, HeapPage.createEmptyPageData());
           
            page.insertTuple(t); //Necessary else page doesn't write correctly, don't know why
            writePage(page);
    	} else {
    		page.insertTuple(t);
    	}
    	
    	ArrayList<Page> pageList = new ArrayList<Page>();
    	pageList.add(page);
    	return pageList;
    }

    // see DbFile.java for javadocs
    public ArrayList<Page> deleteTuple(TransactionId tid, Tuple t) throws DbException,
            TransactionAbortedException {
    	HeapPage page = ((HeapPage)Database.getBufferPool().getPage(tid, t.getRecordId().getPageId(), Permissions.READ_WRITE));
    	page.deleteTuple(t);
    	
    	ArrayList<Page> pageList = new ArrayList<Page>();
    	pageList.add(page);
    	return pageList;
    }

    // see DbFile.java for javadocs
 private class HeapFileIterator implements DbFileIterator {

    private Integer pageCursor;
    private Iterator<Tuple> tupleIterator;
    private final TransactionId transactionId;
    private final int tableId;
    private final int numPages;

    public HeapFileIterator(TransactionId tid) {
      this.pageCursor = null;
      this.tupleIterator = null;
      this.transactionId = tid;
      this.tableId = getId();
      this.numPages = numPages();
    }

    private Iterator<Tuple> getTupleIterator(int pageNumber) throws TransactionAbortedException, DbException {
      PageId pid = new HeapPageId(tableId, pageNumber);
      return ((HeapPage) Database.getBufferPool().getPage(transactionId, pid, Permissions.READ_ONLY)).iterator();
    }

    @Override
    public void open() throws DbException, TransactionAbortedException {
      pageCursor = 0;
      tupleIterator = getTupleIterator(pageCursor);
    }

    @Override
    public boolean hasNext() throws DbException, TransactionAbortedException {
      if (pageCursor != null) {
        while (pageCursor < numPages - 1) {
          if (tupleIterator.hasNext()) {
            return true;
          } else {
            pageCursor += 1;
            tupleIterator = getTupleIterator(pageCursor);
          }
        }
        return tupleIterator.hasNext();
      } else {
        return false;
      }
    }

    @Override
    public Tuple next() throws DbException, TransactionAbortedException, NoSuchElementException {
      if (hasNext()) {
        return tupleIterator.next();
      }
      throw new NoSuchElementException("HeapFileIterator error: no more elements");
    }

    @Override
    public void rewind() throws DbException, TransactionAbortedException {
      close();
      open();
    }

    @Override
    public void close() {
      pageCursor = null;
      tupleIterator = null;
    }

  }

  // see DbFile.java for javadocs
  public DbFileIterator iterator(TransactionId tid) {
    // some code goes here
    return new HeapFileIterator(tid);
  }

}


