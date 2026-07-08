package com.library.service;

import com.library.repository.BookRepository;

public class BookService {

    private BookRepository bookRepository;

    public void setBookRepository(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    public void service() {
        System.out.println("BookService: Book service started.");

        if (bookRepository != null) {
            bookRepository.display();
        } else {
            System.out.println("BookRepository is not injected.");
        }
    }
}