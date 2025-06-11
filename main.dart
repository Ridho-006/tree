import 'tree.dart';
void main(){
  binaryTree bt = binaryTree();
  
  bt.insertLevelOrder(1);
  bt.insertLevelOrder(2);
  bt.insertLevelOrder(3);
  bt.insertLevelOrder(4);
  bt.insertLevelOrder(5);
  bt.insertLevelOrder(6);

  bt.insertByTarget(7, 3);
  bt.insertByTarget(9, 2);
  // bt.insertByTarget(9, 8);

  //bt.delete(3);

  print('traversal preOrder:');
  // bt.printPreOrder(bt.root);
  bt.PreOrder();
  print('\ntraversal inOrder:');
  // bt.printInOrder(bt.root);
  bt.InOrder();
  print('\ntraversal postOrder:');
  // bt.printPostOrder(bt.root);
  bt.PostOrder();
}