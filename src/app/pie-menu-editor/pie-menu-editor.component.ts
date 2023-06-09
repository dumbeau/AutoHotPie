import {Component, Input, OnInit} from '@angular/core';
import {ActivatedRoute} from '@angular/router';

@Component({
  selector: 'app-pie-menu-editor',
  templateUrl: './pie-menu-editor.component.html',
  styleUrls: ['./pie-menu-editor.component.scss']
})
export class PieMenuEditorComponent implements OnInit {
  @Input() pieMenuId: string;

  constructor(private activatedRoute: ActivatedRoute) {
    this.pieMenuId = this.activatedRoute.snapshot.paramMap.get('pieMenuId') ?? '';
    console.log('PieMenuEditorComponent constructor called. pieMenuId: ' + this.pieMenuId);
  }

  ngOnInit(): void {
  }
}
