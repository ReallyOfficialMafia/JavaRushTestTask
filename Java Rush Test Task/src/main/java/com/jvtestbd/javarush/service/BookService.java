package com.jvtestbd.javarush.service;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import com.jvtestbd.javarush.domain.Book;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("bookService")
@Transactional
public class BookService {
    @Resource(name="sessionFactory")
    private SessionFactory sessionFactory;

    public List<Book> getAll(String title) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from com");
        return query.list();
    }

    public List<Book> getAllPage(int begin, int num) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM com");
        List<Book> books = query.list();
        List<Book> books_end = new ArrayList<Book>();
        if (books.size() <= begin) {
            return books;
        }else if (begin < books.size() && books.size() < (begin+num)){
            for (int i = begin; i < books.size(); i++) {
                books_end.add(books.get(i));
            }
            return books_end;
        }
        else {
            for (int i = begin; i < begin + num; i++) {
                books_end.add(books.get(i));
            }
            return books_end;
        }
    }

    public Book get(Integer id ) {
        Session session = sessionFactory.getCurrentSession();
        Book book = (Book) session.get(Book.class, id);
        return book;
    }

    public void add(Book book) {
        Session session = sessionFactory.getCurrentSession();
        session.save(book);
    }

    public void delete(Integer id) {
        Session session = sessionFactory.getCurrentSession();
        Book book = (Book) session.get(Book.class, id);
        session.delete(book);
    }

    public void edit(Book book) {
        Session session = sessionFactory.getCurrentSession();
        Book existingBook = (Book) session.get(Book.class, book.getId());
        existingBook.setTitle(book.getTitle());
        existingBook.setDescription(book.getDescription());
        existingBook.setIsbn(book.getIsbn());
        existingBook.setPrintYear(book.getPrintYear());
        session.save(existingBook);
    }
}
