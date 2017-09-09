package apps;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.StringTokenizer;

import structures.Stack;

public class Expression {
	/**
	 * Expression to be evaluated
	 */
	String expr;
	/**
	 * Scalar symbols in the expression
	 */
	ArrayList<ScalarSymbol> scalars;
	/**
	 * Array symbols in the expression
	 */
	ArrayList<ArraySymbol> arrays;
	/**
	 * String containing all delimiters (characters other than variables and
	 * constants), to be used with StringTokenizer
	 */
	public static final String delims = " \t*+-/()[]";

	/**
	 * Initializes this Expression object with an input expression. Sets all
	 * other fields to null.
	 *
	 * @param expr
	 *            Expression
	 */
	public Expression(String expr) {
		this.expr = expr;
	}

	/**
	 * Populates the scalars and arrays lists with symbols for scalar and array
	 * variables in the expression. For every variable, a SINGLE symbol is
	 * created and stored, even if it appears more than once in the expression.
	 * At this time, values for all variables are set to zero - they will be
	 * loaded from a file in the loadSymbolValues method.
	 */
	public void buildSymbols() {
		/** COMPLETE THIS METHOD **/
		String token;
		expr = expr.replaceAll(" ", "");
		expr = expr.replaceAll("\t", "");
		StringTokenizer st = new StringTokenizer(expr, delims);
		arrays = new ArrayList<ArraySymbol>();
		scalars = new ArrayList<ScalarSymbol>();
		while (st.hasMoreTokens()) {
			token = st.nextToken();
			try {
				Float.parseFloat(token);
				continue;
			} catch (Exception e) {
			}
			if (expr.indexOf(token) + token.length() != expr.length()
					&& expr.charAt(expr.indexOf(token) + token.length()) == '[') {
				if (!arrays.contains(new ArraySymbol(token))) arrays
						.add(new ArraySymbol(token));
			} else if (!scalars.contains(new ScalarSymbol(token))) scalars
					.add(new ScalarSymbol(token));
		}
	}

	/**
	 * Loads values for symbols in the expression
	 *
	 * @param sc
	 *            Scanner for values input
	 * @throws IOException
	 *             If there is a problem with the input
	 */
	public void loadSymbolValues(Scanner sc) throws IOException {
		while (sc.hasNextLine()) {
			StringTokenizer st = new StringTokenizer(sc.nextLine().trim());
			int numTokens = st.countTokens();
			String sym = st.nextToken();
			ScalarSymbol ssymbol = new ScalarSymbol(sym);
			ArraySymbol asymbol = new ArraySymbol(sym);
			int ssi = scalars.indexOf(ssymbol);
			int asi = arrays.indexOf(asymbol);
			if (ssi == -1 && asi == -1) continue;
			int num = Integer.parseInt(st.nextToken());
			if (numTokens == 2) scalars.get(ssi).value = num;
			else { // array symbol
				asymbol = arrays.get(asi);
				asymbol.values = new int[num];
				// following are (index,val) pairs
				while (st.hasMoreTokens()) {
					String tok = st.nextToken();
					StringTokenizer stt = new StringTokenizer(tok, " (,)");
					int index = Integer.parseInt(stt.nextToken());
					int val = Integer.parseInt(stt.nextToken());
					asymbol.values[index] = val;
				}
			}
		}
	}

	/**
	 * Evaluates the expression, using RECURSION to evaluate subexpressions and
	 * to evaluate array subscript expressions.
	 *
	 * @return Result of evaluation
	 */
	public float evaluate() {
		/** COMPLETE THIS METHOD **/
		// following line just a placeholder for compilation
		expr = expr.replaceAll(" ", "");
		expr = expr.replaceAll("\t", "");
		return evaluate(expr);
	}

	private float evaluate(String expr) {
		String ch = "", token = "";
		Stack<Float> numbers = new Stack<Float>();
		Stack<String> operators = new Stack<String>();
		numbers.push((float) 0);// in case of (-1) or (+1)
		for (int i = 0; i < expr.length(); i++) {
			ch = expr.charAt(i) + "";
			if (p(ch) > 0) {// if +-*/
				if (!(token.length() == 0)) {
					numbers.push(getFloatValue(token));
					token = "";
				}
				while (!operators.isEmpty() && p(ch) <= p(operators.peek()))
					numbers.push(calculate(numbers.pop(), operators.pop(),
							numbers.pop()));
				operators.push(ch);
			} else if (ch.equals("(") || ch.equals("[")) {// parentheses
				boolean array;
				int count = 1;
				if (ch.equals("(")) array = false;
				else
					array = true;
				for (int j = i + 1; j < expr.length(); j++) {
					if (expr.charAt(j) == '(' || expr.charAt(j) == '[') count++;
					else if (expr.charAt(j) == ')' || expr.charAt(j) == ']') count--;
					if (count == 0) {
						if (array) numbers.push(getArrayValue(new ArraySymbol(
								token),
								(int) evaluate(expr.substring(i + 1, j))));
						else
							numbers.push(evaluate(expr.substring(i + 1, j)));
						i = j;
						token = "";
						break;
					}
				}
			} else {// number or scalar, build token
				token += ch;
				if (i + 1 == expr.length()) numbers.push(getFloatValue(token));
			}
		}
		while (!operators.isEmpty())
			numbers.push(calculate(numbers.pop(), operators.pop(),
					numbers.pop()));
		return numbers.pop();
	}

	// get operation priority
	private int p(String operator) {
		switch (operator) {
		case "+":
			return 1;
		case "-":
			return 1;
		case "*":
			return 2;
		case "/":
			return 2;
		default:
			return 0;
		}
	}

	private float calculate(float number2, String operation, float number1) {
		switch (operation) {
		case "+":
			return number1 + number2;
		case "-":
			return number1 - number2;
		case "*":
			return number1 * number2;
		case "/":
			return number1 / number2;
		default:
			return 0;
		}
	}

	private float getFloatValue(String token) {
		try {
			return Float.parseFloat(token);
		} catch (Exception e) {
			return getScalarValue(new ScalarSymbol(token));
		}
	}

	private float getScalarValue(ScalarSymbol s) {
		return scalars.get(scalars.indexOf(s)).value;
	}

	private float getArrayValue(ArraySymbol a, int i) {
		return arrays.get(arrays.indexOf(a)).values[i];
	}

	/**
	 * Utility method, prints the symbols in the scalars list
	 */
	public void printScalars() {
		for (ScalarSymbol ss : scalars)
			System.out.println(ss);
	}

	/**
	 * Utility method, prints the symbols in the arrays list
	 */
	public void printArrays() {
		for (ArraySymbol as : arrays)
			System.out.println(as);
	}
}
