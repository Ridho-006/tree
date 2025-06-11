import 'bst.dart';
void main(){
  binarySearchTree bst = binarySearchTree();
  bst.insertData(60);
  bst.insertData(34);
  bst.insertData(56);
  bst.insertData(22);
  bst.insertData(6);
  bst.insertData(100);
  bst.insertData(43);
  bst.insertData(67);

  print('visuaisasi struktur Binary Serach Tree: ');
  bst.printTree();
  
  print('traversal preOrder: ');
  bst.PreOrder();
  print('\ntraversal inOrder:');
  bst.InOrder();
  print('\ntraversal postOrder: ');
  bst.PostOrder();
  
  print('\n');
  print('Tree Size: ${bst.treeSize}');
  var node = bst.findNode(5);
  if (node != null) {
    print('Node target ${node.nodeValue} ditemukan');
  } else {
    print('Node tidak di temukan.');
  }
}