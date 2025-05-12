import 'dart:io';

class DNode<T> {
  //Node class
  T nodeValue; //Nilai dari node
  DNode<T>? prev; //Node sebelumnya didalam list
  DNode<T>? next; //Node setelahnya didalam list

  DNode(this.nodeValue) {
    prev = null;
    next = null;
  }
}

class DoubleLinkedList<T> {
  //Class untuk linkedlist
  DNode<T>? head; //Node paling depan
  DNode<T>? tail; //Node paling belakang

  bool isEmpty() => head == null; //Mengecek apakah linked list kosong

  void tambahNodeAkhir(DNode<T> newNode) {
    //Menambahkan node di belakang linked list
    if (isEmpty()) {
      head = tail = newNode;
    } else {
      tail!.next = newNode;
      newNode.prev = tail;
      tail = newNode;
    }
  }

  void tambahNode_Sebelum(DNode<T> newNode, DNode<T> target) {
    //Menambahkan node sebelum node tertentu
    var curr = head;
    while (curr != null) {
      if (curr == target) {
        newNode.next = curr;
        newNode.prev = curr.prev;
        if (curr.prev != null) {
          curr.prev!.next = newNode;
        } else {
          head = newNode;
        }
        curr.prev = newNode;
        break;
      }
      curr = curr.next;
    }
  }

  void printList() {
    //Menampilkan isi linked list
    var curr = head;
    stdout.write("[");
    while (curr != null) {
      stdout.write(curr.nodeValue);
      curr = curr.next;
      if (curr != null) stdout.write(", ");
    }
    print("]");
  }
}

void main() {
  DoubleLinkedList<int> Dlist = DoubleLinkedList();
  var node10 = DNode<int>(20);
  var node20 = DNode<int>(50);

  Dlist.tambahNodeAkhir(node10);
  Dlist.tambahNodeAkhir(node20);

  print("Sebelum penyisipan:");
  Dlist.printList();

  var nodeDisisipkan = DNode<int>(30);
  Dlist.tambahNode_Sebelum(nodeDisisipkan, node20);

  print("\nSetelah penyisipan:");
  Dlist.printList();
}
