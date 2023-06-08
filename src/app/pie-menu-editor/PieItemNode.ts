export class PieItemNode {
    id: string;
    name: string;
    allowChildren: boolean;
    children: PieItemNode[];

    constructor(id: string, name: string, allowChildren: boolean, children: PieItemNode[]) {
        this.id = id;
        this.name = name;
        this.allowChildren = allowChildren;
        this.children = children;
    }
}
