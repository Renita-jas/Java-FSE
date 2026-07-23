package org.example;

import org.junit.Test;
import static org.junit.Assert.*;

public class CalculatorTest {

    Calculator calculator = new Calculator();

    @Test
    public void testAdd() {
        assertEquals(30, calculator.add(10, 20));
    }

    @Test
    public void testSubtract() {
        assertEquals(10, calculator.subtract(30, 20));
    }

    @Test
    public void testMultiply() {
        assertEquals(200, calculator.multiply(10, 20));
    }

    @Test
    public void testDivide() {
        assertEquals(5, calculator.divide(20, 4));
    }
}