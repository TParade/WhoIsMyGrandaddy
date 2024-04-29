import { HttpClient } from '@angular/common/http';
import { Component, OnInit, ViewChild } from '@angular/core';
import { NestedTreeControl } from '@angular/cdk/tree';
import { MatTreeNestedDataSource } from '@angular/material/tree';

interface Person {
  id: number;
  fatherId: number | null;
  motherId: number | null;
  name: string;
  surname: string;
  birthDate: Date;
  identityNumber: string;
  generation: number;
  children?: Person[];
}

@Component({
  selector: 'app-descendant',
  templateUrl: './descendant.component.html',
  styleUrls: ['./descendant.component.scss']
})
export class DescendantComponent implements OnInit {
  treeControl = new NestedTreeControl<Person>(node => node.children);
  dataSource = new MatTreeNestedDataSource<Person>();
  descendants: Person[] = [];
  searchIdNumber = '';
  loadMoreEnabled = true;
  loading = false;
  maxGeneration = 3;
  loadMoreGenNumber = 3;

  constructor(private http: HttpClient) { }

  ngOnInit() {
    this.getDescendants();
  }

  hasChild(_: number, node: Person) {
    return !!node.children && node.children.length > 0;
  }

  getDescendants() {
    if (!this.loadMoreEnabled || this.loading || !this.searchIdNumber) {
      return;
    }
    this.loading = true;
    let url = `/api/descendant?maxGeneration=${this.maxGeneration}`
      + `&identityNumber=${this.searchIdNumber}`;

      //TODO:Fix
    this.http.get<Person[]>(url).subscribe(
      result => {
        this.descendants = result;
        this.dataSource.data = this.descendants;
        this.treeControl = new NestedTreeControl<Person>(node => node.children);
        this.treeControl.dataNodes = this.dataSource.data;
        this.treeControl.expandAll();

        this.loading = false;
      },
      error => {
        console.error(error);
        alert(error.message);
        this.loading = false;
      }
    );
  }

  toggleLoadMore() {
    this.maxGeneration += this.loadMoreGenNumber;
    //this.loadMoreEnabled = !this.loadMoreEnabled;
    if (this.loadMoreEnabled) {
    this.loadMoreEnabled = true;
      this.getDescendants();
    }
  }

  search() {
    this.descendants = [];
    this.loadMoreEnabled = true;
    this.getDescendants();
  }
}
