import {Component, Input, OnInit, ViewChild} from '@angular/core';
import {ITreeOptions, KEYS, TREE_ACTIONS} from '@circlon/angular-tree-component';
import {PieItemNode} from './PieItemNode';
import {ActivatedRoute} from '@angular/router';
import {PieMenu} from '../../helpers/PieMenu';
import {PieItem} from '../../helpers/PieItem';

@Component({
    selector: 'app-pie-menu-editor',
    templateUrl: './pie-menu-editor.component.html',
    styleUrls: ['./pie-menu-editor.component.scss']
})
export class PieMenuEditorComponent implements OnInit {
    @Input() pieMenuId: string;

    @ViewChild('tree') tree: any;
    // TODO: Drag and drop, click behavior to be implemented. TreeView structure still under design.

    nodes: PieItemNode[] = [];

    options: ITreeOptions = {
        isExpandedField: 'expanded',
        allowDrag: (node) => true,
        allowDrop: (node) => true,
        actionMapping: {
            mouse: {
                dblClick: (tree: any, node: any, $event: any) => {
                    if (node.hasChildren) {
                        TREE_ACTIONS.TOGGLE_EXPANDED(tree, node, $event);
                    }
                }
            },
            keys: {
                [KEYS.ENTER]: (tree: any, node: any, $event: any) => {
                    node.expandAll();
                }
            }
        },
    };
    constructor(private activatedRoute: ActivatedRoute) {
        this.pieMenuId = this.activatedRoute.snapshot.paramMap.get('pieMenuId') ?? '';
        console.log('PieMenuEditorComponent constructor called. pieMenuId: ' + this.pieMenuId);
    }

    async loadNodes() {
        const pieMenu = PieMenu.fromJsonString(await window.electronAPI.getPieMenu(this.pieMenuId));
        console.log('PieMenuEditorComponent loadNodes() called. pieMenu: ' + pieMenu.toJsonString());

        this.nodes = [new PieItemNode(pieMenu.id, pieMenu.name, true, [])];

        for (const pieItemId of pieMenu.pieItems) {
            window.electronAPI.getPieItem(pieItemId).then((pieItemJsonString) => {
                if (pieItemJsonString === undefined) {
                    console.error('PieMenuEditorComponent: PieItem with id ' + pieItemId + ' not found.');
                    return;
                }

                const pieItem = PieItem.fromJsonString(pieItemJsonString);

                if (pieItem === undefined) {
                    console.error('PieMenuEditorComponent: Something went wrong while parsing PieItem with id ' + pieItemId + '.');
                    return;
                }

                this.nodes[0].children.push(new PieItemNode(pieItem.id, pieItem.name, false, []));

                this.tree.treeModel.update();

            });
        }
    }

    ngOnInit(): void {
        this.loadNodes();
    }
}
