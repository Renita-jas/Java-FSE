public class LibraryManagementSystem{
    private Book[] books;
    private int count;
    public LibraryManagementSystem(int size){
        books=new Book[size];
        count=0;
    }
    public void addBook(Book book){
        if (count<books.length){
            books[count++]=book;
        }
    }
    public Book linearSearch(String title){
        for (int i=0; i<count;i++){
            if (books[i].title.equalsIgnoreCase(title)){
                return books[i];
            }
        }
        return null;
    }
    public Book binarySearch(String title){
        int low=0;
        int high=count - 1;
        while (low<=high){
            int mid=(low + high) / 2;
            int result=books[mid].title.compareToIgnoreCase(title);
            if (result==0){
                return books[mid];
            } else if(result<0){
                low=mid + 1;
            } else{
                high=mid - 1;
            }
        }
        return null;
    }
}
