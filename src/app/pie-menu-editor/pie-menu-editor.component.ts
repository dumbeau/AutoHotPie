import {Component} from '@angular/core';
import {ITreeOptions, KEYS, TREE_ACTIONS} from '@circlon/angular-tree-component';

@Component({
  selector: 'app-pie-menu-editor',
  templateUrl: './pie-menu-editor.component.html',
  styleUrls: ['./pie-menu-editor.component.scss']
})
export class PieMenuEditorComponent {
  // TODO: Drag and drop, click behavior to be implemented. TreeView structure still under design.
  // TODO: Update css to make it look better.
  nodes = [
    {
      id: 1,
      name: 'root1',
      children: [
        { id: 2, name: 'child1' },
        { id: 3, name: 'child2' }
      ]
    },
    {
      id: 4,
      name: 'root2',
      children: [
        { id: 5, name: 'child2.1' },
        {
          id: 6,
          name: 'child2.2',
          children: [
            { id: 7, name: 'subsub' }
          ]
        }
      ]
    }
  ];
  options: ITreeOptions = {
    isExpandedField: 'expanded',
    allowDrag: (node) => true,
    allowDrop: (node) => true,
    actionMapping: {
      mouse: {
        dblClick: (tree: any, node: any, $event: any) => {
          if (node.hasChildren) {TREE_ACTIONS.TOGGLE_EXPANDED(tree, node, $event);}
        }
      },
      keys: {
        [KEYS.ENTER]: (tree: any, node: any, $event: any) => {
          node.expandAll();
        }
      }
    },
  };
}
