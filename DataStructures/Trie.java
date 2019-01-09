package structures;

import java.util.ArrayList;

/**
 * This class implements a compressed trie. Each node of the tree is a
 * CompressedTrieNode, with fields for indexes, first child and sibling.
 * 
 * @author Sesh Venugopal
 *
 */
public class Trie {
	/**
	 * Words indexed by this trie.
	 */
	ArrayList<String> words;
	/**
	 * Root node of this trie.
	 */
	TrieNode root;

	/**
	 * Initializes a compressed trie with words to be indexed, and root node set
	 * to null fields.
	 * 
	 * @param words
	 */
	public Trie() {
		root = new TrieNode(null, null, null);
		words = new ArrayList<String>();
	}

	/**
	 * Inserts a word into this trie. Converts to lower case before adding. The
	 * word is first added to the words array list, then inserted into the trie.
	 * 
	 * @param word
	 *            Word to be inserted.
	 */
	public void insertWord(String word) {
		/** COMPLETE THIS METHOD **/
		word = word.toLowerCase();
		words.add(word);
		if (words.size() == 1) {// if no child
			root.firstChild = new TrieNode(new Indexes(0, (short) 0,
					(short) (word.length() - 1)), null, null);
			return;
		}
		TrieNode ptr = root.firstChild;
		while (ptr.sibling != null && s(ptr).charAt(0) != word.charAt(0))
			ptr = ptr.sibling;
		while (word.startsWith(s(ptr))) {
			word = word.substring(s(ptr).length());
			ptr = ptr.firstChild;
			while (ptr.sibling != null && s(ptr).charAt(0) != word.charAt(0))
				ptr = ptr.sibling;
		}
		short length = (short) words.get(words.size() - 1).length();
		short i = (short) (firstNewIndex(ptr, word) + length - word.length());
		if (s(ptr).charAt(0) != word.charAt(0)) {// horizontal end, no prefix
			ptr.sibling = new TrieNode(new Indexes(words.size() - 1,
					ptr.substr.startIndex, (short) (length - 1)), null, null);
		} else if (ptr.firstChild == null) {// prefix has no children
			TrieNode sibling = new TrieNode(new Indexes(words.size() - 1, i,
					(short) (length - 1)), null, null);
			ptr.firstChild = new TrieNode(new Indexes(ptr.substr.wordIndex, i,
					ptr.substr.endIndex), null, sibling);
			ptr.substr.endIndex = (short) (i - 1);
		} else {// last prefix, no other prefixes
			TrieNode sibling = new TrieNode(new Indexes(words.size() - 1, i,
					(short) (length - 1)), null, null);
			Indexes firstChild = new Indexes(ptr.substr.wordIndex, i,
					ptr.substr.endIndex);
			ptr.substr.endIndex = (short) (i - 1);
			ptr.firstChild = new TrieNode(firstChild, ptr.firstChild, sibling);
		}
	}

	private short firstNewIndex(TrieNode node, String word) {
		for (short i = 0; i < Math.min(word.length(), s(node).length()); i++)
			if (word.charAt(i) != s(node).charAt(i)) return i;
		return (short) Math.min(word.length(), s(node).length());
	}

	private String s(TrieNode node) {
		return words.get(node.substr.wordIndex).substring(
				node.substr.startIndex, node.substr.endIndex + 1);
	}

	/**
	 * Given a string prefix, returns its "completion list", i.e. all the words
	 * in the trie that start with this prefix. For instance, if the tree had
	 * the words bear, bull, stock, and bell, the completion list for prefix "b"
	 * would be bear, bull, and bell; for prefix "be" would be bear and bell;
	 * and for prefix "bell" would be bell. (The last example shows that a
	 * prefix can be an entire word.) The order of returned words DOES NOT
	 * MATTER. So, if the list contains bear and bell, the returned list can be
	 * either [bear,bell] or [bell,bear]
	 * 
	 * @param prefix
	 *            Prefix to be completed with words in trie
	 * @return List of all words in tree that start with the prefix, order of
	 *         words in list does not matter. If there is no word in the tree
	 *         that has this prefix, null is returned.
	 */
	public ArrayList<String> completionList(String prefix) {
		/** COMPLETE THIS METHOD **/
		/** FOLLOWING LINE IS A PLACEHOLDER FOR COMPILATION **/
		/** REPLACE WITH YOUR IMPLEMENTATION **/
		TrieNode ptr = root.firstChild;
		String s = "";
		while (ptr.sibling != null && s(ptr).charAt(0) != prefix.charAt(0))
			ptr = ptr.sibling;
		while (prefix.startsWith(s(ptr))) {
			if (!s(ptr).startsWith(prefix)) {
				s += prefix.substring(0, s(ptr).length());
				prefix = prefix.substring(s(ptr).length());
			} else
				break;
			if (ptr.firstChild != null) ptr = ptr.firstChild;
			while (ptr.sibling != null && s(ptr).charAt(0) != prefix.charAt(0))
				ptr = ptr.sibling;
		}
		if (!s(ptr).startsWith(prefix)) return null;
		ArrayList<String> list = new ArrayList<String>();
		if (ptr.firstChild == null) {
			list.add(s + s(ptr));
			return list;
		}
		return traverse(ptr.firstChild, s + s(ptr), list);
	}

	private ArrayList<String> traverse(TrieNode ptr, String s,
			ArrayList<String> list) {
		if (ptr.firstChild == null) list.add(s + s(ptr));
		else
			list = traverse(ptr.firstChild, s + s(ptr), list);
		if (ptr.sibling != null) list = traverse(ptr.sibling, s, list);
		return list;
	}

	public void print() {
		print(root, 1, words);
	}

	private void print(TrieNode root, int indent, ArrayList<String> words) {
		if (root == null) {
			return;
		}
		for (int i = 0; i < indent - 1; i++) {
			System.out.print("    ");
		}
		if (root.substr != null) {
			System.out.println("  " + words.get(root.substr.wordIndex) + "("
					+ s(root) + ")");
		}
		for (int i = 0; i < indent - 1; i++) {
			System.out.print("    ");
		}
		System.out.print(" ---");
		System.out.println("(" + root.substr + ")");
		for (TrieNode ptr = root.firstChild; ptr != null; ptr = ptr.sibling) {
			for (int i = 0; i < indent - 1; i++) {
				System.out.print("    ");
			}
			System.out.println("     |");
			print(ptr, indent + 1, words);
		}
	}
}
